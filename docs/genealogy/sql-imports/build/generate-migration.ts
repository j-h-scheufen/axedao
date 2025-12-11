#!/usr/bin/env npx tsx
/**
 * Genealogy Migration Generator
 *
 * Generates a delta SQL migration by comparing current .sql files against
 * the last deployed state. Outputs:
 * - pending-migration.sql: SQL to apply to staging/production
 * - pending-state.json: State snapshot after migration is applied
 *
 * Usage:
 *   npx tsx generate-migration.ts [--dry-run]
 *
 * Workflow:
 * 1. Edit .sql files, test locally with sync.sh
 * 2. Run this script to generate migration
 * 3. Review pending-migration.sql
 * 4. Commit all changes
 * 5. Push to develop → GitHub Action applies to staging
 * 6. After confirming: mv pending-state.json deployed-state.json
 * 7. Merge to main → GitHub Action applies to production
 */

import * as crypto from 'node:crypto';
import * as fs from 'node:fs';
import * as path from 'node:path';

// ============================================================
// TYPES
// ============================================================

interface StatementSignature {
  subjectType: 'person' | 'group';
  subjectApelido: string; // apelido for person, name for group
  predicate: string;
  objectType: 'person' | 'group';
  objectApelido: string;
  startedAt: string | null; // ISO date string or null
}

interface FileState {
  fileChecksum: string;
  entityChecksum: string;
  entityType: 'person' | 'group';
  identifier: string; // apelido for person, name for group
  statements: StatementSignature[];
}

interface DeployedState {
  deployedAt: string;
  commit: string | null;
  files: Record<string, FileState>;
}

interface StatementAction extends StatementSignature {
  action: 'insert' | 'delete';
  sourceFile: string;
}

interface MigrationPlan {
  entitiesToUpsert: Array<{ file: string; type: 'person' | 'group'; identifier: string }>;
  statementsToInsert: StatementAction[];
  statementsToDelete: StatementAction[];
  summary: {
    newFiles: string[];
    changedFiles: string[];
    unchangedFiles: string[];
    deletedFiles: string[];
  };
}

// ============================================================
// CONSTANTS
// ============================================================

const SCRIPT_DIR = path.dirname(new URL(import.meta.url).pathname);
const SQL_IMPORTS_DIR = path.dirname(SCRIPT_DIR);
const PERSONS_DIR = path.join(SQL_IMPORTS_DIR, 'persons');
const GROUPS_DIR = path.join(SQL_IMPORTS_DIR, 'groups');
const DEPLOYED_STATE_FILE = path.join(SQL_IMPORTS_DIR, 'deployed-state.json');
const PENDING_STATE_FILE = path.join(SCRIPT_DIR, 'pending-state.json');
const PENDING_MIGRATION_FILE = path.join(SCRIPT_DIR, 'pending-migration.sql');

// ============================================================
// PARSING UTILITIES
// ============================================================

function computeMd5(content: string): string {
  return crypto.createHash('md5').update(content).digest('hex');
}

/**
 * Extract the entity INSERT block from a SQL file using section markers.
 * The SQL files use consistent section markers like:
 * -- PERSON PROFILE or -- GROUP PROFILE
 * followed by INSERT INTO genealogy.(person|group)_profiles
 */
function extractEntityBlock(sql: string, type: 'person' | 'group'): string | null {
  const tableName = type === 'person' ? 'person_profiles' : 'group_profiles';

  // Find the INSERT INTO statement for this entity type
  const insertStart = sql.indexOf(`INSERT INTO genealogy.${tableName}`);
  if (insertStart === -1) return null;

  // Find the end of the ON CONFLICT clause by looking for the pattern:
  // "updated_at = NOW();" which ends the entity block
  const fromInsert = sql.substring(insertStart);
  const endPattern = /updated_at\s*=\s*NOW\(\)\s*;/;
  const endMatch = fromInsert.match(endPattern);
  if (!endMatch || endMatch.index === undefined) return null;

  const endIndex = endMatch.index + endMatch[0].length;
  return fromInsert.substring(0, endIndex);
}

/**
 * Extract the entity identifier (apelido for person, name for group) from SQL.
 * Uses the unique pattern in the ON CONFLICT clause which references the identifier.
 */
function extractEntityIdentifier(sql: string, type: 'person' | 'group'): string | null {
  if (type === 'person') {
    // For persons, look for the apelido value directly in the VALUES
    // The pattern is: after "-- Identity" comment and before the title line
    // apelido is always the second identity field after name
    // Look for: 'ApelIdoValue',  (with quotes, followed by comma or newline)

    // More reliable: extract from file name or header comment
    const headerMatch = sql.match(/-- GENEALOGY PERSON IMPORT:\s*(.+)/);
    if (headerMatch) {
      // Clean up the name (remove "Mestre " prefix if present)
      const name = headerMatch[1].trim();
      return name.replace(/^Mestre\s+/i, '');
    }

    // Fallback: look for apelido in a specific pattern
    // The SQL has: 'Name',\n  'Apelido', pattern
    const apelidoMatch = sql.match(
      /INSERT INTO genealogy\.person_profiles[\s\S]*?VALUES\s*\(\s*[^,]+,\s*--[^\n]*\n\s*'([^']+)'/
    );
    if (apelidoMatch) return apelidoMatch[1];

    return null;
  } else {
    // For groups, look for name in the header or VALUES
    const headerMatch = sql.match(/-- GENEALOGY GROUP IMPORT:\s*(.+)/);
    if (headerMatch) {
      // Extract just the group name (before any parenthetical)
      const fullName = headerMatch[1].trim();
      const parenIndex = fullName.indexOf('(');
      return parenIndex > 0 ? fullName.substring(0, parenIndex).trim() : fullName;
    }

    // Fallback: look for name in VALUES - it's the first string value
    const nameMatch = sql.match(/INSERT INTO genealogy\.group_profiles[\s\S]*?VALUES\s*\(\s*--[^\n]*\n\s*'([^']+)'/);
    if (nameMatch) return nameMatch[1];

    return null;
  }
}

/**
 * Extract statement signatures from SQL file.
 * Parses INSERT INTO genealogy.statements blocks by looking for
 * the WHERE clause patterns.
 */
function extractStatements(sql: string): StatementSignature[] {
  const statements: StatementSignature[] = [];

  // Split by INSERT INTO genealogy.statements to find each statement block
  const parts = sql.split(/INSERT INTO genealogy\.statements/);

  for (let i = 1; i < parts.length; i++) {
    const block = parts[i];

    // Skip if this is just a comment or incomplete
    if (!block.includes('SELECT') || !block.includes('WHERE')) continue;

    // Extract predicate from the pattern: 'predicate_name'::genealogy.predicate
    const predicateMatch = block.match(/'(\w+)'::genealogy\.predicate/);
    const predicate = predicateMatch ? predicateMatch[1] : 'unknown';

    // Extract entity types from pattern: 'person'::genealogy.entity_type or 'group'::genealogy.entity_type
    const entityTypeMatches = [...block.matchAll(/'(person|group)'::genealogy\.entity_type/g)];
    const subjectType = (entityTypeMatches[0]?.[1] as 'person' | 'group') || 'person';
    const objectType = (entityTypeMatches[1]?.[1] as 'person' | 'group') || 'person';

    // Extract subject identifier from WHERE clause
    // Pattern: s.apelido = 'X' or p.apelido = 'X' (for person)
    // Pattern: s.name = 'X' (for group as subject, rare)
    const subjectMatch = block.match(/(?:s|p)\.apelido\s*=\s*'([^']+)'/);
    const subjectGroupMatch = block.match(/s\.name\s*=\s*'([^']+)'/);
    const subjectApelido = subjectMatch?.[1] || subjectGroupMatch?.[1] || 'unknown';

    // Extract object identifier from WHERE clause
    // Pattern: o.apelido = 'X' (for person)
    // Pattern: g.name = 'X' or o.name = 'X' (for group)
    const objectPersonMatch = block.match(/o\.apelido\s*=\s*'([^']+)'/);
    const objectGroupMatch = block.match(/(?:g|o)\.name\s*=\s*'([^']+)'/);
    const objectApelido = objectPersonMatch?.[1] || objectGroupMatch?.[1] || 'unknown';

    // Extract started_at date - look for the first date literal before date_precision
    // Pattern: 'YYYY-MM-DD'::date, 'precision'::genealogy.date_precision
    const dateMatch = block.match(/'(\d{4}-\d{2}-\d{2})'::date,\s*'\w+'::genealogy\.date_precision/);
    const startedAt = dateMatch ? dateMatch[1] : null;

    // Only add if we got meaningful data
    if (subjectApelido !== 'unknown' && objectApelido !== 'unknown') {
      statements.push({
        subjectType,
        subjectApelido,
        predicate,
        objectType,
        objectApelido,
        startedAt,
      });
    }
  }

  return statements;
}

/**
 * Parse a SQL file and extract its state.
 */
function parseFile(filePath: string, type: 'person' | 'group'): FileState | null {
  const content = fs.readFileSync(filePath, 'utf-8');
  const fileChecksum = computeMd5(content);

  const entityBlock = extractEntityBlock(content, type);
  if (!entityBlock) {
    console.warn(`Warning: Could not extract entity block from ${filePath}`);
    return null;
  }

  const entityChecksum = computeMd5(entityBlock);
  const identifier = extractEntityIdentifier(content, type);
  if (!identifier) {
    console.warn(`Warning: Could not extract identifier from ${filePath}`);
    return null;
  }

  const statements = extractStatements(content);

  return {
    fileChecksum,
    entityChecksum,
    entityType: type,
    identifier,
    statements,
  };
}

// ============================================================
// STATE MANAGEMENT
// ============================================================

function loadDeployedState(): DeployedState {
  if (!fs.existsSync(DEPLOYED_STATE_FILE)) {
    return {
      deployedAt: '',
      commit: null,
      files: {},
    };
  }
  return JSON.parse(fs.readFileSync(DEPLOYED_STATE_FILE, 'utf-8'));
}

function scanCurrentFiles(): Record<string, FileState> {
  const files: Record<string, FileState> = {};

  // Scan persons
  if (fs.existsSync(PERSONS_DIR)) {
    for (const file of fs.readdirSync(PERSONS_DIR)) {
      if (file.endsWith('.sql')) {
        const filePath = path.join(PERSONS_DIR, file);
        const relativePath = `persons/${file}`;
        const state = parseFile(filePath, 'person');
        if (state) {
          files[relativePath] = state;
        }
      }
    }
  }

  // Scan groups
  if (fs.existsSync(GROUPS_DIR)) {
    for (const file of fs.readdirSync(GROUPS_DIR)) {
      if (file.endsWith('.sql')) {
        const filePath = path.join(GROUPS_DIR, file);
        const relativePath = `groups/${file}`;
        const state = parseFile(filePath, 'group');
        if (state) {
          files[relativePath] = state;
        }
      }
    }
  }

  return files;
}

// ============================================================
// DIFF & MIGRATION PLANNING
// ============================================================

function statementToKey(sig: StatementSignature): string {
  return `${sig.subjectType}:${sig.subjectApelido}|${sig.predicate}|${sig.objectType}:${sig.objectApelido}|${sig.startedAt || 'NULL'}`;
}

function planMigration(deployed: DeployedState, current: Record<string, FileState>): MigrationPlan {
  const plan: MigrationPlan = {
    entitiesToUpsert: [],
    statementsToInsert: [],
    statementsToDelete: [],
    summary: {
      newFiles: [],
      changedFiles: [],
      unchangedFiles: [],
      deletedFiles: [],
    },
  };

  const deployedFiles = deployed.files;
  const currentFiles = current;

  // Find new and changed files
  for (const [filePath, currState] of Object.entries(currentFiles)) {
    const prevState = deployedFiles[filePath];

    if (!prevState) {
      // New file
      plan.summary.newFiles.push(filePath);
      plan.entitiesToUpsert.push({
        file: filePath,
        type: currState.entityType,
        identifier: currState.identifier,
      });
      // All statements are new
      for (const stmt of currState.statements) {
        plan.statementsToInsert.push({ ...stmt, action: 'insert', sourceFile: filePath });
      }
    } else if (prevState.fileChecksum !== currState.fileChecksum) {
      // Changed file
      plan.summary.changedFiles.push(filePath);

      // Check if entity changed
      if (prevState.entityChecksum !== currState.entityChecksum) {
        plan.entitiesToUpsert.push({
          file: filePath,
          type: currState.entityType,
          identifier: currState.identifier,
        });
      }

      // Diff statements
      const prevSigs = new Set(prevState.statements.map(statementToKey));
      const currSigs = new Set(currState.statements.map(statementToKey));

      // New statements
      for (const stmt of currState.statements) {
        if (!prevSigs.has(statementToKey(stmt))) {
          plan.statementsToInsert.push({ ...stmt, action: 'insert', sourceFile: filePath });
        }
      }

      // Deleted statements
      for (const stmt of prevState.statements) {
        if (!currSigs.has(statementToKey(stmt))) {
          plan.statementsToDelete.push({ ...stmt, action: 'delete', sourceFile: filePath });
        }
      }
    } else {
      // Unchanged
      plan.summary.unchangedFiles.push(filePath);
    }
  }

  // Find deleted files (in deployed but not in current)
  for (const [filePath, prevState] of Object.entries(deployedFiles)) {
    if (!currentFiles[filePath]) {
      plan.summary.deletedFiles.push(filePath);
      // Delete all statements from this file
      for (const stmt of prevState.statements) {
        plan.statementsToDelete.push({ ...stmt, action: 'delete', sourceFile: filePath });
      }
      // Note: We don't auto-delete entities per requirements
    }
  }

  return plan;
}

// ============================================================
// SQL GENERATION
// ============================================================

function generateDeleteStatementSql(stmt: StatementAction): string {
  const subjectTable = stmt.subjectType === 'person' ? 'person_profiles' : 'group_profiles';
  const objectTable = stmt.objectType === 'person' ? 'person_profiles' : 'group_profiles';
  const subjectField = stmt.subjectType === 'person' ? 'apelido' : 'name';
  const objectField = stmt.objectType === 'person' ? 'apelido' : 'name';
  const startedAtValue = stmt.startedAt ? `'${stmt.startedAt}'::date` : `'0001-01-01'::date`;

  return `-- Delete statement: ${stmt.subjectApelido} ${stmt.predicate} ${stmt.objectApelido}
DELETE FROM genealogy.statements s
USING genealogy.${subjectTable} subj, genealogy.${objectTable} obj
WHERE s.subject_id = subj.id
  AND s.object_id = obj.id
  AND s.subject_type = '${stmt.subjectType}'::genealogy.entity_type
  AND s.object_type = '${stmt.objectType}'::genealogy.entity_type
  AND subj.${subjectField} = '${stmt.subjectApelido.replace(/'/g, "''")}'
  AND s.predicate = '${stmt.predicate}'::genealogy.predicate
  AND obj.${objectField} = '${stmt.objectApelido.replace(/'/g, "''")}'
  AND COALESCE(s.started_at, '0001-01-01'::date) = ${startedAtValue};
`;
}

function generateMigrationSql(plan: MigrationPlan, currentFiles: Record<string, FileState>): string {
  const lines: string[] = [];

  lines.push('-- ============================================================');
  lines.push('-- GENEALOGY DATA MIGRATION');
  lines.push(`-- Generated: ${new Date().toISOString()}`);
  lines.push('-- ============================================================');
  lines.push('--');
  lines.push(`-- New files: ${plan.summary.newFiles.length}`);
  lines.push(`-- Changed files: ${plan.summary.changedFiles.length}`);
  lines.push(`-- Unchanged files: ${plan.summary.unchangedFiles.length}`);
  lines.push(`-- Deleted files: ${plan.summary.deletedFiles.length}`);
  lines.push('--');
  lines.push(`-- Entities to upsert: ${plan.entitiesToUpsert.length}`);
  lines.push(`-- Statements to insert: ${plan.statementsToInsert.length}`);
  lines.push(`-- Statements to delete: ${plan.statementsToDelete.length}`);
  lines.push('-- ============================================================');
  lines.push('');
  lines.push('BEGIN;');
  lines.push('');

  // Phase 1: Delete orphaned statements
  if (plan.statementsToDelete.length > 0) {
    lines.push('-- ============================================================');
    lines.push('-- PHASE 1: DELETE ORPHANED STATEMENTS');
    lines.push('-- ============================================================');
    lines.push('');
    for (const stmt of plan.statementsToDelete) {
      lines.push(generateDeleteStatementSql(stmt));
    }
    lines.push('');
  }

  // Phase 2: Upsert entities
  // Instead of trying to extract and re-serialize, include the original file content
  // between BEGIN and the statements section
  if (plan.entitiesToUpsert.length > 0) {
    lines.push('-- ============================================================');
    lines.push('-- PHASE 2: UPSERT ENTITIES');
    lines.push('-- ============================================================');
    lines.push('');

    // Sort: persons first, then groups (groups may reference persons)
    const sorted = [...plan.entitiesToUpsert].sort((a, b) => {
      if (a.type === 'person' && b.type === 'group') return -1;
      if (a.type === 'group' && b.type === 'person') return 1;
      return 0;
    });

    for (const entity of sorted) {
      const filePath = path.join(SQL_IMPORTS_DIR, entity.file);
      const content = fs.readFileSync(filePath, 'utf-8');
      const entityBlock = extractEntityBlock(content, entity.type);
      if (entityBlock) {
        lines.push(`-- From: ${entity.file} (${entity.identifier})`);
        lines.push(entityBlock);
        lines.push('');
      }
    }
  }

  // Phase 3: Insert new statements
  if (plan.statementsToInsert.length > 0) {
    lines.push('-- ============================================================');
    lines.push('-- PHASE 3: INSERT NEW STATEMENTS');
    lines.push('-- ============================================================');
    lines.push('');

    // Group by source file
    const fileStatements = new Map<string, StatementAction[]>();
    for (const stmt of plan.statementsToInsert) {
      const existing = fileStatements.get(stmt.sourceFile) || [];
      existing.push(stmt);
      fileStatements.set(stmt.sourceFile, existing);
    }

    // For each file with new statements, extract and include the statement blocks
    for (const [filePath, stmts] of fileStatements) {
      const fullPath = path.join(SQL_IMPORTS_DIR, filePath);
      const content = fs.readFileSync(fullPath, 'utf-8');

      lines.push(`-- From: ${filePath}`);
      lines.push(
        `-- Statements: ${stmts.map((s) => `${s.subjectApelido} ${s.predicate} ${s.objectApelido}`).join(', ')}`
      );
      lines.push('');

      // Extract all statement INSERT blocks from the file
      // Split by INSERT INTO genealogy.statements and process each
      const parts = content.split(/(INSERT INTO genealogy\.statements)/);
      for (let i = 1; i < parts.length; i += 2) {
        const insertKeyword = parts[i];
        const restOfBlock = parts[i + 1];
        if (!restOfBlock) continue;

        // Find the end of this statement (ON CONFLICT ... DO NOTHING;)
        const endMatch = restOfBlock.match(/ON CONFLICT[^;]+DO NOTHING;/);
        if (!endMatch || endMatch.index === undefined) continue;

        const statementBlock = insertKeyword + restOfBlock.substring(0, endMatch.index + endMatch[0].length);

        // Check if this statement matches any we need to insert
        const blockSigs = extractStatements(statementBlock);
        const shouldInclude = blockSigs.some((sig) =>
          stmts.some((s) => statementToKey(s) === statementToKey(sig))
        );

        if (shouldInclude) {
          // Include the comment above the INSERT if present
          const precedingContent = parts.slice(0, i).join('');
          const lastCommentMatch = precedingContent.match(/-- [^\n]+\n$/);
          if (lastCommentMatch) {
            lines.push(lastCommentMatch[0].trim());
          }
          lines.push(statementBlock);
          lines.push('');
        }
      }
    }
  }

  // Phase 4: Update import_log entries
  const allFilesToUpdate = [...plan.summary.newFiles, ...plan.summary.changedFiles];
  if (allFilesToUpdate.length > 0) {
    lines.push('-- ============================================================');
    lines.push('-- PHASE 4: UPDATE IMPORT LOG');
    lines.push('-- ============================================================');
    lines.push('');

    for (const filePath of allFilesToUpdate) {
      const fullPath = path.join(SQL_IMPORTS_DIR, filePath);
      const content = fs.readFileSync(fullPath, 'utf-8');

      // Extract import_log INSERT - find from INSERT INTO genealogy.import_log to the closing ;
      const importLogStart = content.indexOf('INSERT INTO genealogy.import_log');
      if (importLogStart === -1) continue;

      const fromImportLog = content.substring(importLogStart);
      // Find the end by looking for the ON CONFLICT pattern that ends it
      const endMatch = fromImportLog.match(/ON CONFLICT[^;]+;/);
      if (!endMatch || endMatch.index === undefined) continue;

      const importLogBlock = fromImportLog.substring(0, endMatch.index + endMatch[0].length);
      lines.push(`-- From: ${filePath}`);
      lines.push(importLogBlock);
      lines.push('');
    }
  }

  lines.push('COMMIT;');
  lines.push('');

  return lines.join('\n');
}

// ============================================================
// MAIN
// ============================================================

async function main() {
  const dryRun = process.argv.includes('--dry-run');

  console.log('=== Genealogy Migration Generator ===\n');

  // Load deployed state
  console.log('Loading deployed state...');
  const deployedState = loadDeployedState();
  console.log(`  Previously deployed files: ${Object.keys(deployedState.files).length}`);
  if (deployedState.deployedAt) {
    console.log(`  Last deployed: ${deployedState.deployedAt}`);
  }

  // Scan current files
  console.log('\nScanning current files...');
  const currentFiles = scanCurrentFiles();
  console.log(`  Current files: ${Object.keys(currentFiles).length}`);

  // Plan migration
  console.log('\nPlanning migration...');
  const plan = planMigration(deployedState, currentFiles);

  console.log('\n=== Migration Summary ===');
  console.log(`  New files: ${plan.summary.newFiles.length}`);
  for (const f of plan.summary.newFiles) {
    const state = currentFiles[f];
    console.log(`    + ${f} (${state?.identifier || 'unknown'})`);
  }

  console.log(`  Changed files: ${plan.summary.changedFiles.length}`);
  for (const f of plan.summary.changedFiles) {
    const state = currentFiles[f];
    console.log(`    ~ ${f} (${state?.identifier || 'unknown'})`);
  }

  console.log(`  Unchanged files: ${plan.summary.unchangedFiles.length}`);

  console.log(`  Deleted files: ${plan.summary.deletedFiles.length}`);
  for (const f of plan.summary.deletedFiles) console.log(`    - ${f}`);

  console.log(`\n  Entities to upsert: ${plan.entitiesToUpsert.length}`);
  console.log(`  Statements to insert: ${plan.statementsToInsert.length}`);
  console.log(`  Statements to delete: ${plan.statementsToDelete.length}`);

  if (
    plan.summary.newFiles.length === 0 &&
    plan.summary.changedFiles.length === 0 &&
    plan.summary.deletedFiles.length === 0
  ) {
    console.log('\n✅ No changes detected. Nothing to migrate.');
    return;
  }

  // Generate migration SQL
  console.log('\nGenerating migration SQL...');
  const migrationSql = generateMigrationSql(plan, currentFiles);

  // Generate pending state
  const pendingState: DeployedState = {
    deployedAt: '', // Will be set after actual deployment
    commit: null,
    files: currentFiles,
  };

  if (dryRun) {
    console.log('\n=== DRY RUN - Migration SQL Preview (first 200 lines) ===\n');
    const previewLines = migrationSql.split('\n').slice(0, 200);
    console.log(previewLines.join('\n'));
    if (migrationSql.split('\n').length > 200) {
      console.log(`\n... (${migrationSql.split('\n').length - 200} more lines)`);
    }
    console.log('\n=== DRY RUN - No files written ===');
  } else {
    // Ensure build directory exists
    const buildDir = path.dirname(PENDING_MIGRATION_FILE);
    if (!fs.existsSync(buildDir)) {
      fs.mkdirSync(buildDir, { recursive: true });
    }

    // Write files
    fs.writeFileSync(PENDING_MIGRATION_FILE, migrationSql);
    console.log(`\n  Written: ${PENDING_MIGRATION_FILE}`);

    fs.writeFileSync(PENDING_STATE_FILE, JSON.stringify(pendingState, null, 2));
    console.log(`  Written: ${PENDING_STATE_FILE}`);

    console.log('\n✅ Migration generated successfully.');
    console.log('\nNext steps:');
    console.log('  1. Review build/pending-migration.sql');
    console.log('  2. Commit all changes (including build/ files)');
    console.log('  3. Push to develop → GitHub Action applies to staging');
    console.log('  4. After confirming staging works:');
    console.log('     mv docs/genealogy/sql-imports/build/pending-state.json docs/genealogy/sql-imports/deployed-state.json');
    console.log('  5. Commit deployed-state.json');
    console.log('  6. Merge to main → GitHub Action applies to production');
  }
}

main().catch(console.error);

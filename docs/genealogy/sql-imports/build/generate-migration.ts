#!/usr/bin/env npx tsx
/**
 * Genealogy Migration Generator (Simplified)
 *
 * Generates a delta SQL migration by comparing current .sql files against
 * the last deployed state. Uses the new entities/statements directory structure:
 *
 *   entities/persons/*.sql   - Person profile INSERTs
 *   entities/groups/*.sql    - Group profile INSERTs
 *   statements/persons/*.sql - Person relationship INSERTs
 *   statements/groups/*.sql  - Group relationship INSERTs
 *
 * Outputs:
 * - pending-migration.sql: SQL to apply to staging/production
 * - pending-state.json: State snapshot after migration is applied
 *
 * Usage:
 *   npx tsx generate-migration.ts [--dry-run]
 *
 * Workflow:
 * 1. Edit .sql files in entities/ and statements/ directories
 * 2. Run this script to generate migration: pnpm db:genealogy:build
 * 3. Test locally: pnpm db:genealogy:apply
 * 4. Review pending-migration.sql
 * 5. Commit all changes
 * 6. Push to develop → GitHub Action applies to staging
 * 7. After confirming: mv pending-state.json deployed-state.json
 * 8. Merge to main → GitHub Action applies to production
 */

import * as crypto from 'node:crypto';
import * as fs from 'node:fs';
import * as path from 'node:path';

// ============================================================
// TYPES
// ============================================================

interface FileState {
  checksum: string;
  category: 'entity' | 'statement';
  entityType: 'person' | 'group';
}

interface DeployedState {
  deployedAt: string;
  commit: string | null;
  files: Record<string, FileState>;
}

interface MigrationPlan {
  entityFiles: {
    new: string[];
    changed: string[];
  };
  statementFiles: {
    new: string[];
    changed: string[];
  };
  deletedFiles: string[];
  unchangedFiles: string[];
}

// ============================================================
// CONSTANTS
// ============================================================

const SCRIPT_DIR = path.dirname(new URL(import.meta.url).pathname);
const SQL_IMPORTS_DIR = path.dirname(SCRIPT_DIR);
const ENTITIES_DIR = path.join(SQL_IMPORTS_DIR, 'entities');
const STATEMENTS_DIR = path.join(SQL_IMPORTS_DIR, 'statements');
const DEPLOYED_STATE_FILE = path.join(SQL_IMPORTS_DIR, 'deployed-state.json');
const PENDING_STATE_FILE = path.join(SCRIPT_DIR, 'pending-state.json');
const PENDING_MIGRATION_FILE = path.join(SCRIPT_DIR, 'pending-migration.sql');

// ============================================================
// UTILITIES
// ============================================================

function computeMd5(content: string): string {
  return crypto.createHash('md5').update(content).digest('hex');
}

function scanDirectory(
  dir: string,
  category: 'entity' | 'statement',
  entityType: 'person' | 'group',
  basePath: string
): Record<string, FileState> {
  const files: Record<string, FileState> = {};

  if (!fs.existsSync(dir)) return files;

  for (const file of fs.readdirSync(dir)) {
    if (file.endsWith('.sql')) {
      const filePath = path.join(dir, file);
      const content = fs.readFileSync(filePath, 'utf-8');
      const relativePath = path.join(basePath, file);

      files[relativePath] = {
        checksum: computeMd5(content),
        category,
        entityType,
      };
    }
  }

  return files;
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
  return {
    ...scanDirectory(path.join(ENTITIES_DIR, 'persons'), 'entity', 'person', 'entities/persons'),
    ...scanDirectory(path.join(ENTITIES_DIR, 'groups'), 'entity', 'group', 'entities/groups'),
    ...scanDirectory(path.join(STATEMENTS_DIR, 'persons'), 'statement', 'person', 'statements/persons'),
    ...scanDirectory(path.join(STATEMENTS_DIR, 'groups'), 'statement', 'group', 'statements/groups'),
  };
}

// ============================================================
// DIFF & MIGRATION PLANNING
// ============================================================

function planMigration(deployed: DeployedState, current: Record<string, FileState>): MigrationPlan {
  const plan: MigrationPlan = {
    entityFiles: { new: [], changed: [] },
    statementFiles: { new: [], changed: [] },
    deletedFiles: [],
    unchangedFiles: [],
  };

  // Find new and changed files
  for (const [filePath, currState] of Object.entries(current)) {
    const prevState = deployed.files[filePath];
    const isEntity = currState.category === 'entity';
    const target = isEntity ? plan.entityFiles : plan.statementFiles;

    if (!prevState) {
      target.new.push(filePath);
    } else if (prevState.checksum !== currState.checksum) {
      target.changed.push(filePath);
    } else {
      plan.unchangedFiles.push(filePath);
    }
  }

  // Find deleted files
  for (const filePath of Object.keys(deployed.files)) {
    if (!current[filePath]) {
      plan.deletedFiles.push(filePath);
    }
  }

  // Sort files: persons before groups (groups may reference persons)
  const sortFiles = (files: string[]): string[] => {
    return files.sort((a, b) => {
      const aIsPerson = a.includes('/persons/');
      const bIsPerson = b.includes('/persons/');
      if (aIsPerson && !bIsPerson) return -1;
      if (!aIsPerson && bIsPerson) return 1;
      return a.localeCompare(b);
    });
  };

  plan.entityFiles.new = sortFiles(plan.entityFiles.new);
  plan.entityFiles.changed = sortFiles(plan.entityFiles.changed);
  plan.statementFiles.new = sortFiles(plan.statementFiles.new);
  plan.statementFiles.changed = sortFiles(plan.statementFiles.changed);

  return plan;
}

// ============================================================
// SQL GENERATION
// ============================================================

function generateMigrationSql(plan: MigrationPlan): string {
  const lines: string[] = [];

  const totalEntities = plan.entityFiles.new.length + plan.entityFiles.changed.length;
  const totalStatements = plan.statementFiles.new.length + plan.statementFiles.changed.length;

  lines.push('-- ============================================================');
  lines.push('-- GENEALOGY DATA MIGRATION');
  lines.push(`-- Generated: ${new Date().toISOString()}`);
  lines.push('-- ============================================================');
  lines.push('--');
  lines.push(`-- New entity files: ${plan.entityFiles.new.length}`);
  lines.push(`-- Changed entity files: ${plan.entityFiles.changed.length}`);
  lines.push(`-- New statement files: ${plan.statementFiles.new.length}`);
  lines.push(`-- Changed statement files: ${plan.statementFiles.changed.length}`);
  lines.push(`-- Deleted files: ${plan.deletedFiles.length}`);
  lines.push(`-- Unchanged files: ${plan.unchangedFiles.length}`);
  lines.push('-- ============================================================');
  lines.push('');
  lines.push('BEGIN;');
  lines.push('');

  // Phase 0: Handle deleted files FIRST - generate DELETE statements
  // This must happen BEFORE entity/statement upserts to handle renames properly
  if (plan.deletedFiles.length > 0) {
    lines.push('-- ============================================================');
    lines.push('-- PHASE 0: DELETE REMOVED ENTITIES AND STATEMENTS');
    lines.push('-- ============================================================');
    lines.push('-- These files were removed from the source directory.');
    lines.push('-- Deleting corresponding records from the database FIRST');
    lines.push('-- to properly handle renames (old apelido → new apelido).');
    lines.push('-- ============================================================');
    lines.push('');

    // Helper to convert filename to apelido with proper Portuguese capitalization
    const fileNameToApelido = (fileName: string): string => {
      const lowercaseWords = ['de', 'da', 'do', 'das', 'dos', 'e'];
      return fileName
        .split('-')
        .map((word, index) => {
          if (index > 0 && lowercaseWords.includes(word.toLowerCase())) {
            return word.toLowerCase();
          }
          return word.charAt(0).toUpperCase() + word.slice(1);
        })
        .join(' ');
    };

    // Separate entity and statement deletions
    const deletedEntities = plan.deletedFiles.filter((f) => f.startsWith('entities/'));
    const deletedStatements = plan.deletedFiles.filter((f) => f.startsWith('statements/'));

    // For deleted statement files, delete statements by the subject
    for (const filePath of deletedStatements) {
      const match = filePath.match(/statements\/(persons|groups)\/(.+)\.sql$/);
      if (match) {
        const entityType = match[1] === 'persons' ? 'person' : 'group';
        const fileName = match[2];
        const apelido = fileNameToApelido(fileName);

        lines.push(`-- Deleting statements for removed file: ${filePath}`);
        lines.push(`-- Subject apelido derived from filename: "${apelido}"`);
        lines.push(`DELETE FROM genealogy.statements`);
        lines.push(`WHERE subject_type = '${entityType}'::genealogy.entity_type`);
        lines.push(`  AND subject_id IN (`);
        if (entityType === 'person') {
          lines.push(`    SELECT id FROM genealogy.person_profiles WHERE apelido = '${apelido}'`);
        } else {
          lines.push(`    SELECT id FROM genealogy.group_profiles WHERE name = '${apelido}'`);
        }
        lines.push(`  );`);
        lines.push('');
      }
    }

    // For deleted entity files, delete the entity itself
    for (const filePath of deletedEntities) {
      const match = filePath.match(/entities\/(persons|groups)\/(.+)\.sql$/);
      if (match) {
        const entityType = match[1] === 'persons' ? 'person' : 'group';
        const fileName = match[2];
        const apelido = fileNameToApelido(fileName);

        lines.push(`-- Deleting entity for removed file: ${filePath}`);
        lines.push(`-- Apelido derived from filename: "${apelido}"`);
        if (entityType === 'person') {
          lines.push(`DELETE FROM genealogy.person_profiles WHERE apelido = '${apelido}';`);
        } else {
          lines.push(`DELETE FROM genealogy.group_profiles WHERE name = '${apelido}';`);
        }
        lines.push('');
      }
    }
  }

  // Phase 1: Upsert entities (new + changed)
  if (totalEntities > 0) {
    lines.push('-- ============================================================');
    lines.push('-- PHASE 1: UPSERT ENTITIES');
    lines.push('-- ============================================================');
    lines.push('');

    const allEntityFiles = [...plan.entityFiles.new, ...plan.entityFiles.changed];
    for (const filePath of allEntityFiles) {
      const fullPath = path.join(SQL_IMPORTS_DIR, filePath);
      const content = fs.readFileSync(fullPath, 'utf-8');
      const isNew = plan.entityFiles.new.includes(filePath);

      lines.push(`-- Source: ${filePath} (${isNew ? 'NEW' : 'CHANGED'})`);
      lines.push(content.trim());
      lines.push('');
    }
  }

  // Phase 2: Insert statements (new + changed)
  // Because statements use ON CONFLICT DO NOTHING, we can safely re-run them
  if (totalStatements > 0) {
    lines.push('-- ============================================================');
    lines.push('-- PHASE 2: UPSERT STATEMENTS');
    lines.push('-- ============================================================');
    lines.push('');

    const allStatementFiles = [...plan.statementFiles.new, ...plan.statementFiles.changed];
    for (const filePath of allStatementFiles) {
      const fullPath = path.join(SQL_IMPORTS_DIR, filePath);
      const content = fs.readFileSync(fullPath, 'utf-8');
      const isNew = plan.statementFiles.new.includes(filePath);

      lines.push(`-- Source: ${filePath} (${isNew ? 'NEW' : 'CHANGED'})`);
      lines.push(content.trim());
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
  console.log(`  New entity files: ${plan.entityFiles.new.length}`);
  for (const f of plan.entityFiles.new) console.log(`    + ${f}`);

  console.log(`  Changed entity files: ${plan.entityFiles.changed.length}`);
  for (const f of plan.entityFiles.changed) console.log(`    ~ ${f}`);

  console.log(`  New statement files: ${plan.statementFiles.new.length}`);
  for (const f of plan.statementFiles.new) console.log(`    + ${f}`);

  console.log(`  Changed statement files: ${plan.statementFiles.changed.length}`);
  for (const f of plan.statementFiles.changed) console.log(`    ~ ${f}`);

  console.log(`  Deleted files: ${plan.deletedFiles.length}`);
  for (const f of plan.deletedFiles) console.log(`    - ${f}`);

  console.log(`  Unchanged files: ${plan.unchangedFiles.length}`);

  const hasChanges =
    plan.entityFiles.new.length > 0 ||
    plan.entityFiles.changed.length > 0 ||
    plan.statementFiles.new.length > 0 ||
    plan.statementFiles.changed.length > 0 ||
    plan.deletedFiles.length > 0;

  if (!hasChanges) {
    console.log('\n✅ No changes detected. Nothing to migrate.');
    return;
  }

  // Generate migration SQL
  console.log('\nGenerating migration SQL...');
  const migrationSql = generateMigrationSql(plan);

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
    console.log(
      '     mv docs/genealogy/sql-imports/build/pending-state.json docs/genealogy/sql-imports/deployed-state.json'
    );
    console.log('  5. Commit deployed-state.json');
    console.log('  6. Merge to main → GitHub Action applies to production');
  }
}

main().catch(console.error);

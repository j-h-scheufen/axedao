#!/bin/bash
# ============================================================
# Genealogy SQL Import Sync Script
# ============================================================
# Syncs SQL import files to a target database, handling:
# - New files not yet imported
# - Files that have changed since last import (checksum mismatch)
#
# Usage:
#   ./sync.sh                    # Uses DATABASE_URL from environment
#   ./sync.sh <database_url>     # Uses provided connection string
#   ./sync.sh --dry-run          # Show what would be done without executing
#   ./sync.sh --status           # Show current import status
#   ./sync.sh --force            # Re-run ALL files (useful after adding new persons)
#
# The --force flag is useful when:
# - You've added new persons and want to create statements that reference them
# - Statements use ON CONFLICT DO NOTHING, so re-runs are safe and idempotent
#
# ============================================================

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PERSONS_DIR="$SCRIPT_DIR/persons"
GROUPS_DIR="$SCRIPT_DIR/groups"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Parse arguments
DRY_RUN=false
STATUS_ONLY=false
FORCE_ALL=false
DB_URL="${DATABASE_URL:-}"

for arg in "$@"; do
  case $arg in
    --dry-run)
      DRY_RUN=true
      shift
      ;;
    --status)
      STATUS_ONLY=true
      shift
      ;;
    --force)
      FORCE_ALL=true
      shift
      ;;
    *)
      if [[ "$arg" != --* ]]; then
        DB_URL="$arg"
      fi
      ;;
  esac
done

if [[ -z "$DB_URL" ]]; then
  echo -e "${RED}Error: No database URL provided.${NC}"
  echo "Usage: ./sync.sh <database_url> [--dry-run] [--status]"
  echo "Or set DATABASE_URL environment variable."
  exit 1
fi

# Function to compute MD5 checksum of a file
compute_checksum() {
  local file="$1"
  if command -v md5sum &> /dev/null; then
    md5sum "$file" | cut -d' ' -f1
  elif command -v md5 &> /dev/null; then
    md5 -q "$file"
  else
    echo "unknown"
  fi
}

# Function to get import status from database
get_import_status() {
  local file_path="$1"
  psql "$DB_URL" -t -A -c "
    SELECT imported_at, checksum, dependencies
    FROM genealogy.import_log
    WHERE file_path = '$file_path'
  " 2>/dev/null || echo ""
}


# Function to run an import
run_import() {
  local file="$1"
  local file_path="$2"
  local checksum="$3"

  echo -e "${BLUE}Importing: $file_path${NC}"

  if $DRY_RUN; then
    echo -e "${YELLOW}  [DRY-RUN] Would execute: psql \$DB_URL -f $file${NC}"
    return 0
  fi

  # Update the checksum in the file before running
  # (or we could pass it via psql variable, but simpler to just run and update)
  if psql "$DB_URL" -f "$file" 2>&1; then
    # Update checksum in import_log
    psql "$DB_URL" -c "
      UPDATE genealogy.import_log
      SET checksum = '$checksum'
      WHERE file_path = '$file_path'
    " > /dev/null 2>&1
    echo -e "${GREEN}  ✓ Success${NC}"
    return 0
  else
    echo -e "${RED}  ✗ Failed${NC}"
    return 1
  fi
}

# Function to check if a file's dependencies were imported AFTER the file
# Returns "stale" if dependencies are newer, empty otherwise
check_dependency_staleness() {
  local file_path="$1"

  # Query to check if any dependency was imported after this file
  # This indicates the file should be re-run to pick up missing statements
  local result=$(psql "$DB_URL" -t -A -c "
    WITH file_import AS (
      SELECT imported_at, dependencies
      FROM genealogy.import_log
      WHERE file_path = '$file_path'
    )
    SELECT COUNT(*)
    FROM file_import f
    CROSS JOIN UNNEST(f.dependencies) AS dep(dep_path)
    JOIN genealogy.import_log d ON d.file_path = dep_path
    WHERE d.imported_at > f.imported_at
  " 2>/dev/null || echo "0")

  if [[ "$result" -gt 0 ]]; then
    echo "stale"
  fi
}

# Function to check if file needs import
needs_import() {
  local file="$1"
  local file_path="$2"
  local current_checksum="$3"

  local status=$(get_import_status "$file_path")

  if [[ -z "$status" ]]; then
    echo "new"
    return
  fi

  local stored_checksum=$(echo "$status" | cut -d'|' -f2)

  # Check if checksum changed
  if [[ "$stored_checksum" != "$current_checksum" ]]; then
    echo "changed"
    return
  fi

  # Check if any dependency was imported after this file
  # This means statements referencing that dependency may have failed
  local staleness=$(check_dependency_staleness "$file_path")
  if [[ "$staleness" == "stale" ]]; then
    echo "stale_deps"
    return
  fi

  if $FORCE_ALL; then
    echo "forced"
    return
  fi

  echo "current"
}

# Function to show status
show_status() {
  echo -e "${BLUE}=== Genealogy Import Status ===${NC}"
  echo ""

  echo -e "${YELLOW}Database import_log:${NC}"
  psql "$DB_URL" -c "
    SELECT
      entity_type,
      file_path,
      imported_at::date as imported,
      CASE WHEN checksum IS NULL THEN 'no checksum' ELSE LEFT(checksum, 8) || '...' END as checksum,
      array_length(dependencies, 1) as deps
    FROM genealogy.import_log
    ORDER BY imported_at
  " 2>/dev/null || echo "  (No imports yet or table doesn't exist)"

  echo ""
  echo -e "${YELLOW}Local SQL files:${NC}"

  for dir in "$PERSONS_DIR" "$GROUPS_DIR"; do
    if [[ -d "$dir" ]]; then
      local type=$(basename "$dir")
      for file in "$dir"/*.sql; do
        if [[ -f "$file" ]]; then
          local file_path="$type/$(basename "$file")"
          local checksum=$(compute_checksum "$file")
          local status=$(needs_import "$file" "$file_path" "$checksum")

          case $status in
            new)
              echo -e "  ${RED}[NEW]${NC} $file_path"
              ;;
            changed)
              echo -e "  ${YELLOW}[CHANGED]${NC} $file_path"
              ;;
            stale_deps)
              echo -e "  ${YELLOW}[STALE]${NC} $file_path (deps imported after file)"
              ;;
            forced)
              echo -e "  ${YELLOW}[FORCE]${NC} $file_path"
              ;;
            current)
              echo -e "  ${GREEN}[OK]${NC} $file_path"
              ;;
          esac
        fi
      done
    fi
  done
}

# Main sync logic
sync_imports() {
  local to_import=()
  local import_order=()

  echo -e "${BLUE}=== Scanning for imports ===${NC}"

  # Build list of files that need importing
  # Process persons first, then groups (groups may reference persons)
  for dir in "$PERSONS_DIR" "$GROUPS_DIR"; do
    if [[ -d "$dir" ]]; then
      local type=$(basename "$dir")
      for file in "$dir"/*.sql; do
        if [[ -f "$file" ]]; then
          local file_path="$type/$(basename "$file")"
          local checksum=$(compute_checksum "$file")
          local status=$(needs_import "$file" "$file_path" "$checksum")

          case $status in
            new)
              echo -e "  ${RED}[NEW]${NC} $file_path"
              to_import+=("$file|$file_path|$checksum")
              ;;
            changed)
              echo -e "  ${YELLOW}[CHANGED]${NC} $file_path"
              to_import+=("$file|$file_path|$checksum")
              ;;
            stale_deps)
              echo -e "  ${YELLOW}[STALE]${NC} $file_path (deps imported after file)"
              to_import+=("$file|$file_path|$checksum")
              ;;
            forced)
              echo -e "  ${YELLOW}[FORCE]${NC} $file_path"
              to_import+=("$file|$file_path|$checksum")
              ;;
            current)
              echo -e "  ${GREEN}[OK]${NC} $file_path"
              ;;
          esac
        fi
      done
    fi
  done

  echo ""

  if [[ ${#to_import[@]} -eq 0 ]]; then
    echo -e "${GREEN}All imports are up to date!${NC}"
    return 0
  fi

  echo -e "${BLUE}=== Running imports ===${NC}"
  echo "Files to import: ${#to_import[@]}"
  echo ""

  local success=0
  local failed=0

  for item in "${to_import[@]}"; do
    local file=$(echo "$item" | cut -d'|' -f1)
    local file_path=$(echo "$item" | cut -d'|' -f2)
    local checksum=$(echo "$item" | cut -d'|' -f3)

    if run_import "$file" "$file_path" "$checksum"; then
      ((success++))
    else
      ((failed++))
    fi
  done

  echo ""
  echo -e "${BLUE}=== Summary ===${NC}"
  echo -e "  ${GREEN}Success: $success${NC}"
  if [[ $failed -gt 0 ]]; then
    echo -e "  ${RED}Failed: $failed${NC}"
  fi
}

# Main
if $STATUS_ONLY; then
  show_status
else
  sync_imports
fi

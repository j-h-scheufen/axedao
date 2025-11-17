#!/bin/bash
# Phase 0: Clean up garbage entries from source JSON files
# Removes parsing artifacts: state names, "The Capoeira List", and incomplete parentheses

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"
INPUT_DIR="$PROJECT_DIR/groups-json"
BACKUP_DIR="$PROJECT_DIR/groups-json-backup"

echo "=== Phase 0: Cleaning Garbage Entries ==="
echo "Input directory: $INPUT_DIR"
echo ""

# Create backup
echo "Creating backup..."
mkdir -p "$BACKUP_DIR"
cp -r "$INPUT_DIR"/* "$BACKUP_DIR/"
echo "Backup saved to: $BACKUP_DIR"
echo ""

# Define garbage name patterns to remove
GARBAGE_NAMES=(
  "NEW JERSEY"
  "The Capoeira List"
  "(Boca do Mundo is currently teaching in"
  "(Website has not been updated,"
)

total_removed=0

# Process each JSON file
for input_file in "$INPUT_DIR"/*.json; do
  filename=$(basename "$input_file")

  # Count before
  before_count=$(jq 'length' "$input_file")

  # Remove garbage entries
  jq 'map(select(
    .name != "NEW JERSEY" and
    .name != "The Capoeira List" and
    .name != "(Boca do Mundo is currently teaching in" and
    .name != "(Website has not been updated,"
  ))' "$input_file" > "$input_file.tmp"

  # Count after
  after_count=$(jq 'length' "$input_file.tmp")
  removed=$((before_count - after_count))
  total_removed=$((total_removed + removed))

  # Replace original file
  mv "$input_file.tmp" "$input_file"

  if [ "$removed" -gt 0 ]; then
    echo "  ✓ $filename: removed $removed garbage entries ($before_count → $after_count)"
  fi
done

echo ""
echo "=== Summary ==="
echo "Total garbage entries removed: $total_removed"
echo ""
echo "To restore original files: cp -r $BACKUP_DIR/* $INPUT_DIR/"

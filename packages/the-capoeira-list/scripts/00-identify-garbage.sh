#!/bin/bash
# Identify garbage entries for review before deletion
# Creates a detailed report of entries to be removed

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"
INPUT_DIR="$PROJECT_DIR/groups-json"
REPORT_FILE="$PROJECT_DIR/out/00-garbage-entries.json"

mkdir -p "$PROJECT_DIR/out"

echo "=== Identifying Garbage Entries for Review ==="
echo ""

# Extract all garbage entries with their source files
cat "$INPUT_DIR"/*.json | jq -s '
  # Flatten all arrays and add source file info
  [
    paths(type == "array") as $path |
    getpath($path) |
    select(type == "array") |
    .[] |
    select(type == "object")
  ] |
  # Filter for garbage entries
  map(select(
    .name == "NEW JERSEY" or
    .name == "The Capoeira List" or
    .name == "(Boca do Mundo is currently teaching in" or
    .name == "(Website has not been updated,"
  )) |
  # Format for review
  map({
    name: .name,
    website: .website,
    leader: (if .leader then .leader.nickname else null end),
    locations: (.locations | length),
    notes: (.notes[0:150] // ""),
    rawRecord: (.rawRecord[0:200] // "")
  })
' > "$REPORT_FILE"

echo "Found garbage entries:"
cat "$REPORT_FILE" | jq -r '.[] | "  - \(.name)"' | sort | uniq -c

echo ""
echo "Full details saved to: $REPORT_FILE"
echo ""
echo "Review the report, then run: bash scripts/00-cleanup-garbage.sh"

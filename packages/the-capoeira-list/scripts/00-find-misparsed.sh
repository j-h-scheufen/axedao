#!/bin/bash
# Find all potentially misparsed entries by checking if rawRecord contains
# the actual group name after a location header

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"
INPUT_DIR="$PROJECT_DIR/groups-json"

echo "=== Finding Potentially Misparsed Entries ==="
echo ""

# Check entries where name ends in "County" but rawRecord shows a different group name
echo "Entries ending in 'County':"
cat "$INPUT_DIR"/*.json | jq -s '
  [.[] | .[] | select(.name)] |
  map(select((.name | test("^[A-Z][a-z]+ [A-Z][a-z]+ County$|^[A-Z][a-z]+ County$")) and .rawRecord)) |
  .[] |
  {
    name,
    website,
    possibleGroupName: (.rawRecord | split("\n") | .[3:7] | map(select(length > 5)) | .[0] // "unknown")
  }
'

echo ""
echo "Entries with city/state patterns:"
cat "$INPUT_DIR"/*.json | jq -s '
  [.[] | .[] | select(.name)] |
  map(select((.name | test("^[A-Z][a-z]+, [A-Z]")) and .rawRecord)) |
  .[0:10] |
  .[] |
  {name, website}
'

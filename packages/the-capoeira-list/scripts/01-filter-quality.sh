#!/bin/bash
# Phase 1: Filter groups for quality candidates
# This script filters groups based on minimum quality criteria for database import
# and consolidates results into files of 25 groups each for easier inspection

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"
INPUT_DIR="$PROJECT_DIR/groups-json"
OUTPUT_DIR="$PROJECT_DIR/out/01-filtered"
REPORT_FILE="$PROJECT_DIR/out/01-filter-report.json"
TEMP_FILE="$PROJECT_DIR/out/01-filtered-all.json"

# Create output directory
mkdir -p "$OUTPUT_DIR"

echo "=== Phase 1: Filtering Groups for Quality ==="
echo "Input directory: $INPUT_DIR"
echo "Output directory: $OUTPUT_DIR"
echo ""

# Filtering criteria (configurable)
REQUIRE_WEBSITE=true
REQUIRE_LOCATION=true
GROUPS_PER_FILE=100

# Build jq filter based on criteria
JQ_FILTER='.'

# Must have a website
if [ "$REQUIRE_WEBSITE" = true ]; then
  JQ_FILTER="$JQ_FILTER | select(.website)"
fi

# Must have at least one location
if [ "$REQUIRE_LOCATION" = true ]; then
  JQ_FILTER="$JQ_FILTER | select(.locations | length > 0)"
fi

# Add metadata about filtering and source file
JQ_FILTER_WITH_META="$JQ_FILTER | . + {filterMetadata: {filteredAt: now | todate, phase: 1, sourceFile: \$filename, criteria: {requireWebsite: $REQUIRE_WEBSITE, requireLocation: $REQUIRE_LOCATION}}}"

# Process all JSON files and collect filtered results
echo "Filtering groups from all files..."
total_input=0
total_output=0
file_results=()

# Collect all filtered groups into a single temporary file
echo "[" > "$TEMP_FILE"
first_group=true

for input_file in "$INPUT_DIR"/*.json; do
  filename=$(basename "$input_file")

  # Count input records
  input_count=$(jq 'length' "$input_file")
  total_input=$((total_input + input_count))

  # Apply filter with source filename
  filtered=$(jq --arg filename "$filename" "map($JQ_FILTER_WITH_META)" "$input_file")

  # Count output records
  output_count=$(echo "$filtered" | jq 'length')
  total_output=$((total_output + output_count))

  if [ "$output_count" -gt 0 ]; then
    echo "  ✓ $filename: $output_count/$input_count groups passed"

    # Append filtered groups to temp file (handling JSON array concatenation)
    if [ "$first_group" = true ]; then
      echo "$filtered" | jq -c '.[]' >> "$TEMP_FILE"
      first_group=false
    else
      echo "$filtered" | jq -c '.[]' | sed 's/^/,/' >> "$TEMP_FILE"
    fi
  else
    echo "  ✗ $filename: 0/$input_count groups passed"
  fi

  # Store results for report
  file_results+=("{\"file\": \"$filename\", \"inputCount\": $input_count, \"outputCount\": $output_count}")
done

echo "]" >> "$TEMP_FILE"

echo ""
echo "Reorganizing into files of $GROUPS_PER_FILE groups each..."

# Read all filtered groups
all_groups=$(cat "$TEMP_FILE")
total_groups=$(echo "$all_groups" | jq 'length')

# Calculate number of output files needed
num_files=$(( (total_groups + GROUPS_PER_FILE - 1) / GROUPS_PER_FILE ))

# Split into files of GROUPS_PER_FILE groups each
for ((i=0; i<num_files; i++)); do
  start_idx=$((i * GROUPS_PER_FILE))
  batch_num=$((i + 1))
  output_file="$OUTPUT_DIR/batch-$(printf "%02d" $batch_num).json"

  # Extract slice of groups
  echo "$all_groups" | jq ".[$start_idx:$start_idx+$GROUPS_PER_FILE]" > "$output_file"

  group_count=$(jq 'length' "$output_file")
  echo "  Created batch-$(printf "%02d" $batch_num).json with $group_count groups"
done

# Clean up temp file
rm "$TEMP_FILE"

echo ""
echo "=== Summary ==="
echo "Total input groups: $total_input"
echo "Total filtered groups: $total_output"
echo "Filtered out: $((total_input - total_output))"
echo "Pass rate: $(awk "BEGIN {printf \"%.1f\", ($total_output/$total_input)*100}")%"
echo "Output files created: $num_files (${GROUPS_PER_FILE} groups per file)"

# Generate report
cat > "$REPORT_FILE" << EOF
{
  "phase": 1,
  "description": "Quality filtering: groups with website and at least one location",
  "timestamp": "$(date -u +"%Y-%m-%dT%H:%M:%SZ")",
  "criteria": {
    "requireWebsite": $REQUIRE_WEBSITE,
    "requireLocation": $REQUIRE_LOCATION
  },
  "outputFormat": {
    "groupsPerFile": $GROUPS_PER_FILE,
    "totalFiles": $num_files
  },
  "summary": {
    "totalInput": $total_input,
    "totalOutput": $total_output,
    "filteredOut": $((total_input - total_output)),
    "passRate": $(awk "BEGIN {printf \"%.2f\", ($total_output/$total_input)*100}")
  },
  "fileResults": [
    $(IFS=,; echo "${file_results[*]}")
  ]
}
EOF

echo ""
echo "Report saved to: $REPORT_FILE"
echo "Filtered data saved to: $OUTPUT_DIR"

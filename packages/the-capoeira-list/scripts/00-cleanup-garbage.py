#!/usr/bin/env python3
"""
Phase 0: Clean up garbage entries from source JSON files
Removes parsing artifacts while preserving original JSON formatting
"""

import json
import os
from pathlib import Path

SCRIPT_DIR = Path(__file__).parent
PROJECT_DIR = SCRIPT_DIR.parent
INPUT_DIR = PROJECT_DIR / "groups-json"
BACKUP_DIR = PROJECT_DIR / "groups-json-backup"

# Garbage names to remove
GARBAGE_NAMES = {
    "NEW JERSEY",
    "The Capoeira List",
    "(Boca do Mundo is currently teaching in",
    "(Website has not been updated,",
}

def main():
    print("=== Phase 0: Cleaning Garbage Entries ===")
    print(f"Input directory: {INPUT_DIR}")
    print()

    # Create backup
    print("Creating backup...")
    BACKUP_DIR.mkdir(exist_ok=True)
    for file in INPUT_DIR.glob("*.json"):
        import shutil
        shutil.copy2(file, BACKUP_DIR / file.name)
    print(f"Backup saved to: {BACKUP_DIR}")
    print()

    total_removed = 0
    files_modified = 0

    # Process each JSON file
    for input_file in sorted(INPUT_DIR.glob("*.json")):
        with open(input_file, 'r', encoding='utf-8') as f:
            groups = json.load(f)

        before_count = len(groups)

        # Filter out garbage entries
        filtered_groups = [
            group for group in groups
            if group.get('name') not in GARBAGE_NAMES
        ]

        after_count = len(filtered_groups)
        removed = before_count - after_count

        if removed > 0:
            # Write back with same formatting (indent=2)
            with open(input_file, 'w', encoding='utf-8') as f:
                json.dump(filtered_groups, f, indent=2, ensure_ascii=False)
                f.write('\n')  # Add trailing newline

            total_removed += removed
            files_modified += 1
            print(f"  ✓ {input_file.name}: removed {removed} garbage entries ({before_count} → {after_count})")

    print()
    print("=== Summary ===")
    print(f"Files modified: {files_modified}")
    print(f"Total garbage entries removed: {total_removed}")
    print()
    print(f"To restore original files: cp -r {BACKUP_DIR}/* {INPUT_DIR}/")

if __name__ == "__main__":
    main()

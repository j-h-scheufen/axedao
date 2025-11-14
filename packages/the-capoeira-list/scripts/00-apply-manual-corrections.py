#!/usr/bin/env python3
"""
Apply manual corrections to misparsed entries.
Uses the manual-corrections.json file to fix or delete entries.
"""

import json
from pathlib import Path
from typing import Dict, Any, Optional, List

SCRIPT_DIR = Path(__file__).parent
PROJECT_DIR = SCRIPT_DIR.parent
INPUT_DIR = PROJECT_DIR / "groups-json"
CORRECTIONS_FILE = SCRIPT_DIR / "manual-corrections.json"
BACKUP_DIR = PROJECT_DIR / "groups-json-backup-manual"
REPORT_FILE = PROJECT_DIR / "out" / "00-manual-corrections-report.json"

def matches_identifier(group: Dict[str, Any], identifier: Dict[str, Any]) -> bool:
    """Check if a group matches the identifier criteria."""
    for key, value in identifier.items():
        if key == "website":
            if group.get("website") != value:
                return False
        elif key == "name":
            if group.get("name") != value:
                return False
        elif key == "notes":
            group_notes = group.get("notes") or ""
            if value not in group_notes:
                return False
        elif key == "leader":
            group_leader = group.get("leader", {})
            if isinstance(value, dict):
                for lkey, lvalue in value.items():
                    if group_leader.get(lkey) != lvalue:
                        return False
            else:
                return False
        else:
            if group.get(key) != value:
                return False
    return True

def apply_correction(group: Dict[str, Any], correction: Dict[str, Any]) -> Optional[Dict[str, Any]]:
    """
    Apply a correction to a group entry.
    Returns the corrected group, or None if the entry should be deleted.
    """
    action = correction.get("action")

    if action == "delete":
        return None

    # Apply corrections
    corrected = group.copy()
    corrections_data = correction.get("corrections", {})

    for key, value in corrections_data.items():
        corrected[key] = value

    # Add metadata about the fix
    if "fixMetadata" not in corrected:
        corrected["fixMetadata"] = {}

    corrected["fixMetadata"]["manuallyFixed"] = True
    corrected["fixMetadata"]["originalName"] = group["name"]
    corrected["fixMetadata"]["fixedFields"] = list(corrections_data.keys())

    return corrected

def main():
    print("=== Applying Manual Corrections ===")
    print()

    # Load corrections
    with open(CORRECTIONS_FILE, 'r', encoding='utf-8') as f:
        corrections = json.load(f)

    print(f"Loaded {len(corrections)} correction rules")
    print()

    # Create backup
    print("Creating backup...")
    BACKUP_DIR.mkdir(exist_ok=True)
    for file in INPUT_DIR.glob("*.json"):
        import shutil
        shutil.copy2(file, BACKUP_DIR / file.name)
    print(f"Backup saved to: {BACKUP_DIR}")
    print()

    # Track corrections
    applied_corrections = []
    deleted_entries = []
    total_fixed = 0
    total_deleted = 0
    files_modified = 0

    # Process each JSON file
    for input_file in sorted(INPUT_DIR.glob("*.json")):
        with open(input_file, 'r', encoding='utf-8') as f:
            groups = json.load(f)

        file_fixed = 0
        file_deleted = 0
        new_groups = []

        for group in groups:
            # Check if this group matches any correction identifier
            matched_correction = None
            for correction in corrections:
                if matches_identifier(group, correction["identifier"]):
                    matched_correction = correction
                    break

            if matched_correction:
                corrected = apply_correction(group, matched_correction)

                if corrected is None:
                    # Entry should be deleted
                    file_deleted += 1
                    total_deleted += 1
                    deleted_entries.append({
                        "file": input_file.name,
                        "name": group["name"],
                        "reason": matched_correction.get("reason", "Unknown"),
                    })
                else:
                    # Entry was corrected
                    new_groups.append(corrected)
                    file_fixed += 1
                    total_fixed += 1
                    applied_corrections.append({
                        "file": input_file.name,
                        "originalName": group["name"],
                        "correctedName": corrected["name"],
                        "fixedFields": corrected.get("fixMetadata", {}).get("fixedFields", []),
                    })
            else:
                # No correction needed
                new_groups.append(group)

        if file_fixed > 0 or file_deleted > 0:
            # Write back
            with open(input_file, 'w', encoding='utf-8') as f:
                json.dump(new_groups, f, indent=2, ensure_ascii=False)
                f.write('\n')

            files_modified += 1
            print(f"  ✓ {input_file.name}: fixed {file_fixed}, deleted {file_deleted}")

    # Write report
    PROJECT_DIR.joinpath("out").mkdir(exist_ok=True)
    report = {
        "totalFixed": total_fixed,
        "totalDeleted": total_deleted,
        "filesModified": files_modified,
        "appliedCorrections": applied_corrections,
        "deletedEntries": deleted_entries,
    }

    with open(REPORT_FILE, 'w', encoding='utf-8') as f:
        json.dump(report, f, indent=2, ensure_ascii=False)

    print()
    print("=== Summary ===")
    print(f"Files modified: {files_modified}")
    print(f"Total entries fixed: {total_fixed}")
    print(f"Total entries deleted: {total_deleted}")
    print()
    print(f"Detailed report: {REPORT_FILE}")

    if applied_corrections:
        print()
        print("Corrected entries:")
        for entry in applied_corrections:
            print(f"  '{entry['originalName']}' → '{entry['correctedName']}'")

    if deleted_entries:
        print()
        print("Deleted entries:")
        for entry in deleted_entries:
            print(f"  '{entry['name']}' - {entry['reason']}")

if __name__ == "__main__":
    main()

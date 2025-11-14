#!/usr/bin/env python3
"""
Fix misparsed entries where section headers were captured as group names.
Re-parses the rawRecord field to extract correct group information.
"""

import json
import re
from pathlib import Path
from typing import Dict, Any, Optional

SCRIPT_DIR = Path(__file__).parent
PROJECT_DIR = SCRIPT_DIR.parent
INPUT_DIR = PROJECT_DIR / "groups-json"
OUTPUT_DIR = PROJECT_DIR / "out"
REPORT_FILE = OUTPUT_DIR / "00-fixed-entries-report.json"

# Section headers that indicate misparsing
SECTION_HEADERS = {
    "NEW JERSEY",
    "The Capoeira List",
    "(Boca do Mundo is currently teaching in",
    "(Website has not been updated,",
}

def extract_group_name(raw_record: str) -> Optional[str]:
    """
    Extract the actual group name from rawRecord.
    The group name typically appears after section headers and is more indented.
    """
    lines = raw_record.split('\n')

    # Look for lines that look like group names (not section headers)
    # They usually start with whitespace followed by the name
    # and are followed by contact/location info
    for i, line in enumerate(lines):
        stripped = line.strip()

        # Skip empty lines and section headers
        if not stripped or stripped in SECTION_HEADERS:
            continue

        # Skip location headers (usually have "County" or "City" in them after section headers)
        if 'County' in stripped or re.match(r'^\w+\s+(County|City)', stripped):
            continue

        # Look for pattern: whitespace + name + (possible whitespace)
        # The actual group name is usually indented more than section headers
        # and appears before URLs/emails/phones
        if (stripped and
            not stripped.startswith('http') and
            not '@' in stripped and
            not re.match(r'^\d', stripped) and  # Not starting with number
            not stripped.startswith('SOURCE:') and
            not stripped.startswith('Professor') and
            not stripped.startswith('Mestre') and
            not stripped.startswith('Contra') and
            not stripped.startswith('Instrutor') and
            not stripped.startswith('[') and  # Not phone in brackets
            len(stripped) > 3):

            # Check if this looks like a group name by seeing if next lines have contact info
            next_lines = lines[i+1:i+5]
            has_contact_info = any(
                'http' in l or '@' in l or re.search(r'\d{3}', l) or 'SOURCE' in l
                for l in next_lines
            )

            if has_contact_info:
                return stripped

    return None

def extract_leader_info(raw_record: str) -> Dict[str, Any]:
    """Extract leader information from rawRecord."""
    lines = raw_record.split('\n')

    for line in lines:
        stripped = line.strip()

        # Look for lines with titles and names
        # Pattern: Title Name "nickname" (optional: under Mestre X)
        match = re.search(r'(Professor|Mestre|Contra[- ]?Mestre|Instrutor[a]?)\s+(\w+)\s*["\']([^"\']+)["\']?\s*(under\s+Mestre\s+\w+)?', stripped, re.IGNORECASE)
        if match:
            title = match.group(1).lower().replace('-', '-').replace(' ', '-')
            first_part = match.group(2)
            nickname = match.group(3)

            return {
                "title": title if title in ["mestre", "professor", "instrutor", "instrutora", "contra-mestre"] else None,
                "nickname": nickname,
                "name": first_part if first_part and first_part != nickname else ""
            }

        # Alternative pattern: Title "nickname" "name"
        match = re.search(r'(Professor|Mestre|Contra[- ]?Mestre|Instrutor[a]?)\s+["\']?(\w+)["\']?\s+["\']([^"\']+)["\']', stripped, re.IGNORECASE)
        if match:
            title = match.group(1).lower().replace(' ', '-')
            nickname = match.group(2)
            name = match.group(3)

            return {
                "title": title if title in ["mestre", "professor", "instrutor", "instrutora", "contra-mestre"] else None,
                "nickname": nickname,
                "name": name
            }

    return None

def fix_entry(entry: Dict[str, Any]) -> tuple[Dict[str, Any], bool]:
    """
    Fix a misparsed entry by re-parsing the rawRecord.
    Returns (fixed_entry, was_fixed)
    """
    if entry.get('name') not in SECTION_HEADERS:
        return entry, False

    raw_record = entry.get('rawRecord', '')
    if not raw_record:
        return entry, False

    # Extract correct group name
    correct_name = extract_group_name(raw_record)
    if not correct_name:
        return entry, False

    # Extract leader info
    leader_info = extract_leader_info(raw_record)

    # Create fixed entry
    fixed = entry.copy()
    fixed['name'] = correct_name

    if leader_info:
        fixed['leader'] = leader_info

    # Add fix metadata
    if 'fixMetadata' not in fixed:
        fixed['fixMetadata'] = {}

    fixed['fixMetadata']['originalName'] = entry['name']
    fixed['fixMetadata']['fixed'] = True
    fixed['fixMetadata']['fixedFields'] = ['name']

    if leader_info:
        fixed['fixMetadata']['fixedFields'].append('leader')

    return fixed, True

def main():
    print("=== Fixing Misparsed Entries ===")
    print()

    OUTPUT_DIR.mkdir(exist_ok=True)

    fixed_entries = []
    total_fixed = 0
    files_modified = 0

    # Process each JSON file
    for input_file in sorted(INPUT_DIR.glob("*.json")):
        with open(input_file, 'r', encoding='utf-8') as f:
            groups = json.load(f)

        file_fixed = 0
        new_groups = []

        for group in groups:
            fixed_group, was_fixed = fix_entry(group)
            new_groups.append(fixed_group)

            if was_fixed:
                file_fixed += 1
                total_fixed += 1
                fixed_entries.append({
                    'file': input_file.name,
                    'originalName': group['name'],
                    'fixedName': fixed_group['name'],
                    'website': fixed_group.get('website'),
                    'leader': fixed_group.get('leader', {}).get('nickname'),
                })

        if file_fixed > 0:
            # Write back
            with open(input_file, 'w', encoding='utf-8') as f:
                json.dump(new_groups, f, indent=2, ensure_ascii=False)
                f.write('\n')

            files_modified += 1
            print(f"  ✓ {input_file.name}: fixed {file_fixed} entries")

    # Write report
    report = {
        'totalFixed': total_fixed,
        'filesModified': files_modified,
        'fixedEntries': fixed_entries
    }

    with open(REPORT_FILE, 'w', encoding='utf-8') as f:
        json.dump(report, f, indent=2, ensure_ascii=False)

    print()
    print("=== Summary ===")
    print(f"Files modified: {files_modified}")
    print(f"Total entries fixed: {total_fixed}")
    print()
    print(f"Detailed report: {REPORT_FILE}")
    print()
    print("Fixed entries:")
    for entry in fixed_entries:
        print(f"  '{entry['originalName']}' → '{entry['fixedName']}'")

if __name__ == "__main__":
    main()

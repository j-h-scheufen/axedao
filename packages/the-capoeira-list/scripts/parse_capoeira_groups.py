
import re
import json
from pathlib import Path

DIVIDER_RE = re.compile(r'_{5,}')
URL_RE = re.compile(r'https?://\S+')
EMAIL_RE = re.compile(r'[\w\.-]+@[\w\.-]+')
PHONE_RE = re.compile(r'\+?\(?\d[\d\s\-\(\)]{5,}')

def parse_group_data(raw_text):
    entries = []
    current_country = None
    sections = DIVIDER_RE.split(raw_text)

    for section in sections:
        lines = [line.rstrip() for line in section.strip().splitlines() if line.strip()]
        if not lines:
            continue

        # Check if first line is a country/region (centered, no leading spaces)
        if lines[0] and not lines[0].startswith(" ") and not re.search(r'https?://|@', lines[0]):
            # This could be a country/region or a group name
            # If it's followed by a line with 6 spaces (1 tab), it's likely a country
            if len(lines) > 1 and lines[1].startswith("      "):
                current_country = lines[0].strip()
                lines = lines[1:]  # Remove the country line from processing
            else:
                # This is a group name, not a country
                pass

        name = None
        urls = []
        contacts = []
        info = []
        current_contact_name = None
        contact_values = []

        # Find the group name - it's the first line with content in the section
        for line in lines:
            stripped = line.strip()
            if not re.search(r'https?://|@', stripped):
                name = stripped
                break

        # Process the rest of the lines
        for line in lines:
            stripped = line.strip()
            
            # Skip the group name line we already processed
            if stripped == name:
                continue

            found_urls = re.findall(r'https?://[^\s]+', stripped)
            if found_urls:
                urls.extend(found_urls)
                continue

            email_match = EMAIL_RE.search(stripped)
            phone_match = PHONE_RE.search(stripped)

            if email_match or phone_match:
                contact_values.append(email_match.group() if email_match else phone_match.group())
                continue

            if re.match(r'(Instructor|Professor|Contact|Teacher|Mestre|Contra Mestre|Monitor|Monitore|Prof|Formado|Grupo|Cordao|Academia|School|Studio|Club|Association|Associação|Capoeira)', stripped, re.IGNORECASE):
                if current_contact_name and contact_values:
                    contacts.append({"name": current_contact_name, "value": "; ".join(dict.fromkeys(contact_values))})
                current_contact_name = stripped
                contact_values = []
            else:
                info.append(stripped)

        if current_contact_name and contact_values:
            contacts.append({"name": current_contact_name, "value": "; ".join(dict.fromkeys(contact_values))})

        # Debug: Print sections that don't have a group name
        if not name and len(lines) > 0:
            print(f"DEBUG: Section without group name: {lines[:3]}...")

        entry = {
            "country": current_country,
            "name": name,
            "urls": list(dict.fromkeys(urls)),
            "contacts": contacts,
            "info": info
        }
        entries.append(entry)

    return entries

if __name__ == "__main__":
    allcities_text = Path("../data/allcities20.txt").read_text(encoding="utf-8", errors="ignore")
    citydata_text = Path("../data/citydata.txt").read_text(encoding="utf-8", errors="ignore")
    parsed_allcities = parse_group_data(allcities_text)
    parsed_citydata = parse_group_data(citydata_text)
    combined = parsed_allcities + parsed_citydata
    Path("../out/capoeira_groups_parsed.json").write_text(json.dumps(combined, indent=2, ensure_ascii=False), encoding="utf-8")
    print(f"✅ Parsed {len(combined)} total group entries.")

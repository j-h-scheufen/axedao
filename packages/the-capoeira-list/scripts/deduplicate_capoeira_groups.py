
import json
from pathlib import Path
from collections import defaultdict

INPUT_PATH = Path("../out/capoeira_groups_parsed.json")
OUTPUT_PATH = Path("../out/capoeira_groups_deduplicated.json")

ACADEMIAS = [
    "axe capoeira", "abada capoeira", "cordão de ouro", "cordao de ouro",
    "capoeira brasil", "senzala capoeira", "fica", "capoeira angola ecamar",
    "grupo capoeira brasil", "grupo axe capoeira", "capoeira mandinga",
    "capoeira angola", "capoeira contemporânea", "capoeira regional"
]

def detect_academia(name):
    lower = name.lower()
    for acad in ACADEMIAS:
        if lower.startswith(acad):
            return acad.title()
    return None

all_entries = json.loads(INPUT_PATH.read_text(encoding="utf-8"))

for entry in all_entries:
    entry["academia"] = detect_academia(entry["name"])

dedup_map = defaultdict(list)
skip_dedup_map = []

for entry in all_entries:
    name_lower = entry["name"].strip().lower()
    region_lower = (entry.get("region") or "").strip().lower()
    country_lower = (entry.get("country") or "").strip().lower()

    if name_lower in {region_lower, country_lower} or name_lower in ACADEMIAS:
        skip_dedup_map.append(entry)
    else:
        dedup_map[name_lower].append(entry)

def merge_group(entries):
    base = entries[0]
    merged = {
        "name": base["name"],
        "region": base["region"],
        "country": base["country"],
        "academia": base["academia"],
        "urls": [],
        "contacts": [],
        "info": []
    }
    seen_urls = set()
    seen_contacts = set()
    for e in entries:
        for url in e.get("urls", []):
            if url not in seen_urls:
                seen_urls.add(url)
                merged["urls"].append(url)
        for c in e.get("contacts", []):
            key = (c.get("name"), c.get("value"))
            if key not in seen_contacts:
                seen_contacts.add(key)
                merged["contacts"].append(c)
        if e.get("info"):
            merged["info"].append(">>> INFO BLOCK START")
            merged["info"].extend(e["info"])
            merged["info"].append(">>> INFO BLOCK END")
    return merged

deduplicated = [merge_group(entries) for entries in dedup_map.values()] + skip_dedup_map

OUTPUT_PATH.write_text(json.dumps(deduplicated, indent=2, ensure_ascii=False), encoding="utf-8")

print(json.dumps({
    "original_total": len(all_entries),
    "deduplicated_total": len(deduplicated),
    "merged_entries": len(all_entries) - len(deduplicated)
}, indent=2))

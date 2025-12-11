# Entity Registry

Track imported entities and their database UUIDs for reference when creating relationship statements.

---

## Persons

| Apelido | Full Name | UUID | Imported On | Notes |
|---------|-----------|------|-------------|-------|
| | | | | |

---

## Groups

| Name | Aliases | UUID | Imported On | Notes |
|------|---------|------|-------------|-------|
| | | | | |

---

## Usage

After running import SQL against the database, update this registry with actual UUIDs:

```sql
-- Query to get UUIDs after import
SELECT id, apelido, name FROM genealogy.person_profiles ORDER BY created_at DESC LIMIT 10;
SELECT id, name FROM genealogy.group_profiles ORDER BY created_at DESC LIMIT 10;
```

These UUIDs are needed when creating statement records that reference these entities.

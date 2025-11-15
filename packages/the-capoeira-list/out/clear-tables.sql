-- Clear out groups and group_locations tables
-- Run this in Supabase SQL editor before importing new data

BEGIN;

-- Delete all group locations first (foreign key constraint)
DELETE FROM group_locations;

-- Delete all groups
DELETE FROM groups;

-- Verify tables are empty
SELECT 'group_locations' as table_name, COUNT(*) as remaining_rows FROM group_locations
UNION ALL
SELECT 'groups' as table_name, COUNT(*) as remaining_rows FROM groups;

COMMIT;

-- Expected output: both tables should show 0 remaining_rows

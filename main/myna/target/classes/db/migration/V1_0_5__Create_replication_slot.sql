-- Drop the replication slot if exists
DO 
$do$
BEGIN
IF EXISTS (SELECT 1 FROM pg_replication_slots WHERE slot_name = 'fis_changes_slot') THEN
    PERFORM pg_drop_replication_slot('fis_changes_slot');
END IF;
END 
$do$;

-- Create logical replication slot
-- See: https://www.postgresql.org/docs/current/static/logicaldecoding-example.html

SELECT * FROM pg_create_logical_replication_slot('fis_changes_slot', 'wal2json');
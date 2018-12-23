-- Drop the users and priviledges if exists
DO 
$do$
BEGIN
IF EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'myna_readonly') THEN
    REVOKE CONNECT ON DATABASE myna FROM myna_readonly;
    REVOKE USAGE ON SCHEMA inserv FROM myna_readonly;
    REVOKE USAGE ON SCHEMA rules FROM myna_readonly;
    REVOKE USAGE ON SCHEMA bulk FROM myna_readonly;
    REVOKE SELECT ON ALL TABLES IN SCHEMA inserv FROM myna_readonly;
    REVOKE SELECT ON ALL TABLES IN SCHEMA rules FROM myna_readonly;
    REVOKE SELECT ON ALL TABLES IN SCHEMA bulk FROM myna_readonly;
    ALTER DEFAULT PRIVILEGES IN SCHEMA inserv REVOKE SELECT ON TABLES FROM myna_readonly;
    ALTER DEFAULT PRIVILEGES IN SCHEMA rules REVOKE SELECT ON TABLES FROM myna_readonly;
    ALTER DEFAULT PRIVILEGES IN SCHEMA bulk REVOKE SELECT ON TABLES FROM myna_readonly;
    DROP USER myna_readonly;
END IF;
END 
$do$;

-- Create readonly user
CREATE USER myna_readonly WITH PASSWORD 'myna_readonly';

-- Allows connect to myna database only
GRANT CONNECT ON DATABASE myna TO myna_readonly;

-- Allows USAGE on schemas
GRANT USAGE ON schema inserv to myna_readonly;
GRANT USAGE ON schema rules to myna_readonly;
GRANT USAGE ON schema bulk to myna_readonly;
 
-- Allows SELECT on TABLES
GRANT SELECT ON ALL TABLES IN SCHEMA inserv TO myna_readonly;
GRANT SELECT ON ALL TABLES IN SCHEMA rules TO myna_readonly;
GRANT SELECT ON ALL TABLES IN SCHEMA bulk TO myna_readonly;

-- Allows SELECT on TABLES created in the future
ALTER DEFAULT PRIVILEGES IN SCHEMA inserv GRANT SELECT ON TABLES TO myna_readonly;
ALTER DEFAULT PRIVILEGES IN SCHEMA rules GRANT SELECT ON TABLES TO myna_readonly;
ALTER DEFAULT PRIVILEGES IN SCHEMA bulk GRANT SELECT ON TABLES TO myna_readonly;

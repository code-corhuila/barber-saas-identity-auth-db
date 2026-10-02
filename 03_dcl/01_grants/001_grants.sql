GRANT USAGE ON SCHEMA identity_auth TO identity_auth_reader, identity_auth_writer;
GRANT SELECT ON ALL TABLES IN SCHEMA identity_auth TO identity_auth_reader;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA identity_auth TO identity_auth_writer;
ALTER DEFAULT PRIVILEGES IN SCHEMA identity_auth GRANT SELECT ON TABLES TO identity_auth_reader;
ALTER DEFAULT PRIVILEGES IN SCHEMA identity_auth GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO identity_auth_writer;

-- The domain grants its writer role to its own login user (Annex J J.7). The user exists only
-- where the infrastructure created it, so the grant is conditional.
DO $$
BEGIN
    IF EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'identity_auth_app') THEN
        GRANT identity_auth_writer TO identity_auth_app;
    END IF;
END
$$;

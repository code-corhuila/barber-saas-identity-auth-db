DO $$
BEGIN
    IF EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'identity_auth_app') THEN
        REVOKE identity_auth_writer FROM identity_auth_app;
    END IF;
END
$$;
ALTER DEFAULT PRIVILEGES IN SCHEMA identity_auth REVOKE ALL ON TABLES FROM identity_auth_reader, identity_auth_writer;
REVOKE ALL ON ALL TABLES IN SCHEMA identity_auth FROM identity_auth_reader, identity_auth_writer;
REVOKE USAGE ON SCHEMA identity_auth FROM identity_auth_reader, identity_auth_writer;

-- NOLOGIN roles carry the permissions. The login user identity_auth_app is created by
-- barber-saas-infra-postgres from a secret; no password is ever versioned here.
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'identity_auth_reader') THEN
        CREATE ROLE identity_auth_reader NOLOGIN;
    END IF;
    IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'identity_auth_writer') THEN
        CREATE ROLE identity_auth_writer NOLOGIN;
    END IF;
END
$$;

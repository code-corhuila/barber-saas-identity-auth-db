-- NULL until the user confirms the e-mailed code (ADR-018); the existing rows are set by
-- 02_dml/01_updates/001_verify_existing_users.sql. The code's foreign key, with its delete behaviour.
ALTER TABLE identity_auth.app_user
    ADD COLUMN email_verified_at timestamptz NULL;
ALTER TABLE identity_auth.email_verification_code
    ADD CONSTRAINT fk_email_verification_code_user FOREIGN KEY (user_id)
        REFERENCES identity_auth.app_user (id) ON DELETE CASCADE;

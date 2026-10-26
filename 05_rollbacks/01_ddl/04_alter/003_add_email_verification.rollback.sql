ALTER TABLE identity_auth.email_verification_code
    DROP CONSTRAINT IF EXISTS fk_email_verification_code_user;
ALTER TABLE identity_auth.app_user
    DROP COLUMN IF EXISTS email_verified_at;

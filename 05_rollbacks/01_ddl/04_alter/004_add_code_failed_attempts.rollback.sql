ALTER TABLE identity_auth.email_verification_code
    DROP COLUMN IF EXISTS failed_attempts;
ALTER TABLE identity_auth.password_reset_token
    DROP COLUMN IF EXISTS failed_attempts;

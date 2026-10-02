ALTER TABLE identity_auth.password_reset_token DROP CONSTRAINT IF EXISTS fk_password_reset_token_user;
ALTER TABLE identity_auth.refresh_token DROP CONSTRAINT IF EXISTS fk_refresh_token_user;

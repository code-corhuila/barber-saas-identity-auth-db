-- Wrong attempts against a 6-digit code (SEC-03): after 5 the code stops working and a new one must be
-- requested, so guessing it is no longer bounded only by the gateway's rate limit. New changeset: the
-- applied ones are never edited (Liquibase checksums).
ALTER TABLE identity_auth.password_reset_token
    ADD COLUMN failed_attempts integer NOT NULL DEFAULT 0,
    ADD CONSTRAINT chk_password_reset_token_failed_attempts CHECK (failed_attempts >= 0);
ALTER TABLE identity_auth.email_verification_code
    ADD COLUMN failed_attempts integer NOT NULL DEFAULT 0,
    ADD CONSTRAINT chk_email_verification_code_failed_attempts CHECK (failed_attempts >= 0);

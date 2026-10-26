-- "the codes of a user, newest first": voiding the earlier codes and the resend limits (ADR-018)
CREATE INDEX IF NOT EXISTS idx_email_verification_code_user_created
    ON identity_auth.email_verification_code (user_id, created_at);

-- Accounts created before e-mail verification keep signing in (ADR-018): they count as verified
-- since they were created. Idempotent: only rows still NULL.
UPDATE identity_auth.app_user
   SET email_verified_at = created_at
 WHERE email_verified_at IS NULL;

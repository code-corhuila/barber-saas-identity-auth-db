-- "log in by e-mail", case-insensitive and unique
CREATE UNIQUE INDEX IF NOT EXISTS uq_app_user_email ON identity_auth.app_user (lower(email));
-- "staff of a barbershop"
CREATE INDEX IF NOT EXISTS idx_app_user_barbershop_id ON identity_auth.app_user (barbershop_id);
-- foreign key columns are always indexed
CREATE INDEX IF NOT EXISTS idx_refresh_token_user_id ON identity_auth.refresh_token (user_id);
CREATE INDEX IF NOT EXISTS idx_password_reset_token_user_id ON identity_auth.password_reset_token (user_id);

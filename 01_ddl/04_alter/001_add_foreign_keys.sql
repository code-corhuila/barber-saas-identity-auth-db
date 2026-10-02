ALTER TABLE identity_auth.refresh_token
    ADD CONSTRAINT fk_refresh_token_user
    FOREIGN KEY (user_id) REFERENCES identity_auth.app_user (id) ON DELETE CASCADE;

ALTER TABLE identity_auth.password_reset_token
    ADD CONSTRAINT fk_password_reset_token_user
    FOREIGN KEY (user_id) REFERENCES identity_auth.app_user (id) ON DELETE CASCADE;

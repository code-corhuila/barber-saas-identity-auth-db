CREATE TABLE identity_auth.password_reset_token (
    id           uuid        NOT NULL,
    user_id      uuid        NOT NULL,
    code_hash    text        NOT NULL,
    expires_at   timestamptz NOT NULL,
    used_at      timestamptz NULL,
    created_at   timestamptz NOT NULL DEFAULT now(),
    CONSTRAINT pk_password_reset_token PRIMARY KEY (id)
);

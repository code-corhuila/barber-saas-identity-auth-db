CREATE TABLE identity_auth.refresh_token (
    id           uuid        NOT NULL,
    user_id      uuid        NOT NULL,
    token_hash   text        NOT NULL,
    expires_at   timestamptz NOT NULL,
    revoked_at   timestamptz NULL,
    created_at   timestamptz NOT NULL DEFAULT now(),
    CONSTRAINT pk_refresh_token PRIMARY KEY (id),
    CONSTRAINT uq_refresh_token_hash UNIQUE (token_hash)
);

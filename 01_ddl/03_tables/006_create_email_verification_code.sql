-- A 6-digit code that proves the user reads the address (ADR-018, DEC-AUTH-09). Stored hashed,
-- 15 minutes, single use. New changeset: the applied ones are never edited (Liquibase checksums).
CREATE TABLE identity_auth.email_verification_code (
    id           uuid        NOT NULL,
    user_id      uuid        NOT NULL,
    code_hash    text        NOT NULL,
    expires_at   timestamptz NOT NULL,
    used_at      timestamptz NULL,
    created_at   timestamptz NOT NULL DEFAULT now(),
    CONSTRAINT pk_email_verification_code PRIMARY KEY (id)
);

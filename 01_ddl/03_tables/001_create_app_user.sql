-- "user" is reserved in PostgreSQL, hence app_user.
CREATE TABLE identity_auth.app_user (
    id                 uuid        NOT NULL,
    barbershop_id      uuid        NULL,      -- owned by the barbershop domain: referenced by id, no FK
    full_name          text        NOT NULL,
    email              text        NOT NULL,
    password_hash      text        NOT NULL,
    phone              text        NULL,
    profile_photo_url  text        NULL,
    role               text        NOT NULL,
    is_active          boolean     NOT NULL DEFAULT true,
    created_at         timestamptz NOT NULL DEFAULT now(),
    updated_at         timestamptz NOT NULL DEFAULT now(),
    CONSTRAINT pk_app_user PRIMARY KEY (id),
    CONSTRAINT chk_app_user_full_name CHECK (char_length(full_name) BETWEEN 1 AND 120),
    CONSTRAINT chk_app_user_email     CHECK (char_length(email) <= 150),
    CONSTRAINT chk_app_user_phone     CHECK (char_length(phone) <= 20),
    CONSTRAINT chk_app_user_role      CHECK (role IN ('SUPER_ADMIN','ADMIN_BARBERSHOP','BARBER','CLIENT')),
    CONSTRAINT chk_app_user_tenant    CHECK ((role IN ('ADMIN_BARBERSHOP','BARBER')) = (barbershop_id IS NOT NULL))
);

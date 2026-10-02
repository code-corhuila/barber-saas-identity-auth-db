CREATE TABLE identity_auth.outbox_event (
    id              uuid        NOT NULL,
    aggregate_type  text        NOT NULL,
    aggregate_id    uuid        NOT NULL,
    event_type      text        NOT NULL,
    payload         jsonb       NOT NULL,
    correlation_id  text        NOT NULL,
    occurred_at     timestamptz NOT NULL DEFAULT now(),
    published_at    timestamptz NULL,
    CONSTRAINT pk_outbox_event PRIMARY KEY (id)
);
CREATE INDEX idx_outbox_event_unpublished ON identity_auth.outbox_event (occurred_at) WHERE published_at IS NULL;

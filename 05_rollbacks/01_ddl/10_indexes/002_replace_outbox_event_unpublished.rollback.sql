DROP INDEX IF EXISTS identity_auth.idx_outbox_event_unpublished;
CREATE INDEX idx_outbox_event_unpublished ON identity_auth.outbox_event (occurred_at) WHERE published_at IS NULL;

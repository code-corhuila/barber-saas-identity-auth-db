# Changelog

All notable changes to `barber-saas-identity-auth-db` are recorded here. The format follows
[Keep a Changelog](https://keepachangelog.com/en/1.1.0/) and the project uses
[Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [3.0.0] - 2026-11-05

MVP 3 (corte 3): promoted from `develop` through `qa` with `git cherry-pick -x` (norm 10–11).

User stories: code-corhuila/barber-saas-docs#123, code-corhuila/barber-saas-docs#124.

### Added

- **tables:** add email_verification_code
- **alter:** add app_user.email_verified_at and the code's foreign key
- **indexes:** index the verification codes of a user by creation time
- **dml:** mark the accounts created before verification as verified
- **alter:** count the wrong attempts of the reset and verification codes

## [2.0.0] - 2026-10-08

MVP 2 (corte 2): first release of this repository to `main`, promoted from `develop` through `qa`
with `git cherry-pick -x` (norm 10–11).

User stories: code-corhuila/barber-saas-docs#3, code-corhuila/barber-saas-docs#6, code-corhuila/barber-saas-docs#59.

### Added

- **deploy:** add the migration runner with its own changelog tables
- **ddl:** create the identity_auth schema
- **ddl:** create app user
- **ddl:** create refresh token
- **ddl:** create password reset token
- **ddl:** create idempotency key
- **ddl:** create outbox event
- **ddl:** add foreign keys
- **dcl:** create roles
- **dcl:** grants
- **ddl:** set aside outbox events the worker cannot deliver

### Fixed

- **migrations:** restore the applied roles changeset byte for byte

### Changed

- **ddl:** create indexes

### Documentation

- **readme:** explain how the schema is migrated and where the data is
- **readme:** point the header to Barber Saas and barber-saas-docs

### Tests

- **ci:** rebuild the schema from an empty database on every pull request

### Maintenance

- **db:** ignore local env files and liquibase output
- **github:** add the pull request template
- **github:** track the story environment on the board
- **liquibase:** add the master changelog and the ddl, dml, dcl and tcl families
- use the new repository name barber-saas-infra-postgres

[3.0.0]: https://github.com/code-corhuila/barber-saas-identity-auth-db/releases/tag/v3.0.0
[2.0.0]: https://github.com/code-corhuila/barber-saas-identity-auth-db/releases/tag/v2.0.0


# Task 03: Relational Schema Modeling & 3NF Normalization

## Objective
Design a normalized PostgreSQL database for a multi-tenant SaaS application.

## Tables
1. tenants
2. users
3. projects
4. roles
5. project_members
6. user_roles
7. project_settings
8. tasks

## Relationships
- One-to-many: tenants and users; projects and tasks.
- Many-to-many: users and projects through project_members.
- Many-to-many: users and roles through user_roles.
- One-to-one: projects and project_settings.

## Project Files
- schema.sql: Database tables and constraints.
- seed_data.sql: Sample records.
- docs/er-model.md: Entity-Relationship model.
- docs/normalization.md: 1NF, 2NF and 3NF explanations.
- tests/negative_tests.sql: Negative SQL tests.
- docs/run-and-submit.md: Execution instructions.

## Database
PostgreSQL

## Purpose
Demonstrate normalization, primary and foreign keys, referential integrity, and cascading updates and deletes.

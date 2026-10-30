
# Database Setup and Execution Guide

## Requirements
- PostgreSQL database
- pgAdmin or PostgreSQL command-line tool (psql)

## Step 1: Create a Database

```sql
CREATE DATABASE rabtech_task03;
```

Connect to the database named `rabtech_task03`.

## Step 2: Create the Tables

Run the `schema.sql` file first.

This creates all eight related tables:
1. tenants
2. users
3. projects
4. roles
5. project_members
6. user_roles
7. project_settings
8. tasks

## Step 3: Insert Sample Data

Run `seed_data.sql` after creating the tables.

This inserts sample records into all eight tables.

## Step 4: Verify the Data

Run:

```sql
SELECT * FROM tenants;
SELECT * FROM users;
SELECT * FROM projects;
SELECT * FROM roles;
SELECT * FROM project_members;
SELECT * FROM user_roles;
SELECT * FROM project_settings;
SELECT * FROM tasks;
```

Check that the records are inserted correctly.

## Step 5: Run Negative Tests

Run `tests/negative_tests.sql`.

The tests check:
- Duplicate-value rejection
- CHECK constraint enforcement
- Foreign-key enforcement
- NOT NULL enforcement
- Cascading updates and deletes

Look for PASS messages in the PostgreSQL output.

## Expected Result

All eight tables should be created, sample records should be inserted, and the negative tests should pass.

## Deliverables

- schema.sql
- seed_data.sql
- ER diagram
- 1NF, 2NF and 3NF documentation
- Negative test script
- Database execution guide

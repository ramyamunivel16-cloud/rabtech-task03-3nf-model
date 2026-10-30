
# Database Normalization

## Objective
The database is designed using First Normal Form (1NF), Second Normal Form (2NF), and Third Normal Form (3NF) to reduce data duplication and maintain data consistency.

## 1. First Normal Form (1NF)

A table satisfies 1NF when:
- Each column contains atomic (single) values.
- Each row is uniquely identified by a primary key.
- There are no repeating groups or multiple values in one column.

**Applied in this database:**
- Each user has individual values for name and email.
- Each task has one title, status, and due date.
- Each project membership is stored as a separate row.

Therefore, the tables follow 1NF.

## 2. Second Normal Form (2NF)

A table satisfies 2NF when:
- It already satisfies 1NF.
- Every non-key attribute depends on the entire primary key, not just part of a composite key.

**Applied in this database:**
- The `project_members` table uses a composite primary key consisting of tenant_id, project_id, and user_id.
- The `user_roles` table uses a composite primary key consisting of tenant_id, user_id, and role_id.
- The `project_settings` table uses tenant_id and project_id as its composite primary key.

The non-key attributes in these tables depend on their complete keys. The other tables use single-column primary keys.

Therefore, the design follows 2NF.

## 3. Third Normal Form (3NF)

A table satisfies 3NF when:
- It already satisfies 2NF.
- Non-key attributes depend only on the primary key.
- There are no transitive dependencies between non-key attributes.

**Applied in this database:**
- Tenant information is stored in the `tenants` table.
- User information is stored in the `users` table.
- Role information is stored in the `roles` table.
- Project information is stored in the `projects` table.
- Task information is stored in the `tasks` table.
- Project membership and user-role assignments are maintained in separate junction tables.

This avoids storing unrelated details repeatedly in other tables.

Therefore, the database is designed to follow 3NF.

## Conclusion

The database separates entities into related tables and uses primary keys, foreign keys, and constraints to maintain data integrity.

The design aims to reduce redundancy, avoid update anomalies, and maintain consistency.

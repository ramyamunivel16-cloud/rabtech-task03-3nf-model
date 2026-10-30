
# Entity Relationship Diagram

## Database: Multi-Tenant SaaS Project Management System

```mermaid
erDiagram
    TENANTS ||--o{ USERS : has
    TENANTS ||--o{ PROJECTS : owns
    USERS ||--o{ PROJECTS : creates
    PROJECTS ||--o{ TASKS : contains
    USERS ||--o{ PROJECT_MEMBERS : joins
    PROJECTS ||--o{ PROJECT_MEMBERS : has
    USERS ||--o{ USER_ROLES : assigned
    ROLES ||--o{ USER_ROLES : defines
    PROJECTS ||--o| PROJECT_SETTINGS : has

    TENANTS {
        int tenant_id PK
        string tenant_name
        string plan
    }

    USERS {
        int user_id PK
        int tenant_id FK
        string full_name
        string email
    }

    PROJECTS {
        int project_id PK
        int tenant_id FK
        string project_name
        int created_by FK
    }

    ROLES {
        int role_id PK
        string role_name
        string description
    }

    PROJECT_MEMBERS {
        int tenant_id PK, FK
        int project_id PK, FK
        int user_id PK, FK
    }

    USER_ROLES {
        int tenant_id PK, FK
        int user_id PK, FK
        int role_id PK, FK
    }

    PROJECT_SETTINGS {
        int tenant_id PK, FK
        int project_id PK, FK
        string timezone
        string visibility
    }

    TASKS {
        int task_id PK
        int tenant_id FK
        int project_id FK
        string title
        string task_status
        date due_date
    }
```

## Relationships

- **One-to-Many (1:N):** One tenant can have many users and projects.
- **One-to-Many (1:N):** One project can contain many tasks.
- **Many-to-Many (N:M):** Users can join many projects through `project_members`.
- **Many-to-Many (N:M):** Users can have many roles through `user_roles`.
- **One-to-One (1:1):** A project can have at most one settings record through `project_settings`.

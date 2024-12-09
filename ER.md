```mermaid
erDiagram
    USERS {
        int id PK
        string name
        string email
        string password_digest
        datetime created_at
        datetime updated_at
    }
    TASKS {
        int id PK
        int user_id FK
        string title
        string description
        string category
        int priority
        datetime due_date
        datetime created_at
        datetime updated_at
    }
    SCHEDULES {
        int id PK
        int user_id FK
        string name
        datetime schedule_date
        datetime created_at
        datetime updated_at
    }
    SCHEDULE_TASKS {
        int id PK
        int schedule_id FK
        int task_id FK
        datetime created_at
        datetime updated_at
    }

    USERS ||--o{ TASKS : "has many"
    USERS ||--o{ SCHEDULES : "has many"
    SCHEDULES ||--o{ SCHEDULE_TASKS : "has many"
    TASKS ||--o{ SCHEDULE_TASKS : "has many"

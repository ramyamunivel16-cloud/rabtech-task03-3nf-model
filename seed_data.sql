
-- RabTech Task 03: Representative seed fixtures

BEGIN;

INSERT INTO tenants (tenant_id, tenant_name, plan) VALUES
(1, 'Bright Academy', 'PRO'),
(2, 'Cloud Retail', 'FREE');

INSERT INTO users (user_id, tenant_id, full_name, email) VALUES
(1, 1, 'Anu Kumar', 'anu@bright.example'),
(2, 1, 'Bala Raj', 'bala@bright.example'),
(3, 2, 'Chitra Devi', 'chitra@retail.example');

INSERT INTO projects
(project_id, tenant_id, project_name, created_by) VALUES
(1, 1, 'Student Portal', 1),
(2, 1, 'Course Tracker', 2),
(3, 2, 'Inventory App', 3);

INSERT INTO roles (role_id, role_name, description) VALUES
(1, 'ADMIN', 'Manages organization resources'),
(2, 'MEMBER', 'Works on assigned projects');

INSERT INTO project_members (tenant_id, project_id, user_id) VALUES
(1, 1, 1),
(1, 1, 2),
(1, 2, 2),
(2, 3, 3);

INSERT INTO user_roles (tenant_id, user_id, role_id) VALUES
(1, 1, 1),
(1, 2, 2),
(2, 3, 1);

INSERT INTO project_settings
(tenant_id, project_id, timezone, visibility) VALUES
(1, 1, 'Asia/Kolkata', 'PRIVATE'),
(1, 2, 'Asia/Kolkata', 'PUBLIC'),
(2, 3, 'Asia/Kolkata', 'PRIVATE');

INSERT INTO tasks
(task_id, tenant_id, project_id, title, task_status, due_date) VALUES
(1, 1, 1, 'Design login page', 'DONE', '2026-11-05'),
(2, 1, 1, 'Create dashboard', 'IN_PROGRESS', '2026-11-12'),
(3, 1, 2, 'Prepare course report', 'TODO', '2026-11-20'),
(4, 2, 3, 'Add product records', 'TODO', '2026-11-25');

COMMIT;

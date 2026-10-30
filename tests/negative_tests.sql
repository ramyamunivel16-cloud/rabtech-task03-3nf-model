
-- Task 03: Negative and Cascade Tests
-- Run schema.sql and seed_data.sql before running this file.

-- TEST 1: Duplicate tenant name must be rejected.
DO $$
BEGIN
    BEGIN
        INSERT INTO tenants (tenant_name, plan)
        VALUES ('Bright Academy', 'PRO');

        RAISE EXCEPTION 'Test failed: duplicate tenant name was accepted';
    EXCEPTION
        WHEN unique_violation THEN
            RAISE NOTICE 'PASS: Duplicate tenant name rejected';
    END;

    -- TEST 2: Invalid plan must be rejected.
    BEGIN
        INSERT INTO tenants (tenant_name, plan)
        VALUES ('Invalid Plan Test', 'GOLD');

        RAISE EXCEPTION 'Test failed: invalid plan was accepted';
    EXCEPTION
        WHEN check_violation THEN
            RAISE NOTICE 'PASS: Invalid plan rejected';
    END;

    -- TEST 3: Invalid foreign key must be rejected.
    BEGIN
        INSERT INTO users (tenant_id, full_name, email)
        VALUES (-999999, 'Test User', 'invalid@test.example');

        RAISE EXCEPTION 'Test failed: invalid tenant ID was accepted';
    EXCEPTION
        WHEN foreign_key_violation THEN
            RAISE NOTICE 'PASS: Invalid foreign key rejected';
    END;

    -- TEST 4: NULL name must be rejected.
    BEGIN
        INSERT INTO users (tenant_id, full_name, email)
        VALUES (1, NULL, 'nulltest@test.example');

        RAISE EXCEPTION 'Test failed: NULL name was accepted';
    EXCEPTION
        WHEN not_null_violation THEN
            RAISE NOTICE 'PASS: NOT NULL constraint enforced';
    END;
END;
$$;

-- TEST 5: Verify ON UPDATE CASCADE and ON DELETE CASCADE.
DO $$
DECLARE
    old_tenant_id INT;
    new_tenant_id INT;
    test_user_id INT;
    remaining_users INT;
BEGIN
    INSERT INTO tenants (tenant_name, plan)
    VALUES ('Cascade Test Tenant', 'FREE')
    RETURNING tenant_id INTO old_tenant_id;

    INSERT INTO users (tenant_id, full_name, email)
    VALUES (old_tenant_id, 'Cascade Test User', 'cascade@test.example')
    RETURNING user_id INTO test_user_id;

    new_tenant_id := old_tenant_id + 10000;

    -- Updating the parent key should update the child foreign key.
    UPDATE tenants
    SET tenant_id = new_tenant_id
    WHERE tenant_id = old_tenant_id;

    IF NOT EXISTS (
        SELECT 1 FROM users
        WHERE user_id = test_user_id
          AND tenant_id = new_tenant_id
    ) THEN
        RAISE EXCEPTION 'Test failed: ON UPDATE CASCADE did not work';
    END IF;

    RAISE NOTICE 'PASS: ON UPDATE CASCADE works';

    -- Deleting the parent should delete the child user.
    DELETE FROM tenants
    WHERE tenant_id = new_tenant_id;

    SELECT COUNT(*) INTO remaining_users
    FROM users
    WHERE user_id = test_user_id;

    IF remaining_users <> 0 THEN
        RAISE EXCEPTION 'Test failed: ON DELETE CASCADE did not work';
    END IF;

    RAISE NOTICE 'PASS: ON DELETE CASCADE works';
END;
$$;

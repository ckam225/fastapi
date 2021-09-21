-- upgrade --
CREATE TABLE IF NOT EXISTS "attempts" (
    "id" BIGSERIAL NOT NULL PRIMARY KEY,
    "email" VARCHAR(255) NOT NULL,
    "code" VARCHAR(255) NOT NULL UNIQUE,
    "created_at" TIMESTAMPTZ NOT NULL  DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE IF NOT EXISTS "roles" (
    "id" BIGSERIAL NOT NULL PRIMARY KEY,
    "name" VARCHAR(25) NOT NULL UNIQUE,
    "created_at" TIMESTAMPTZ NOT NULL  DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ NOT NULL  DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE IF NOT EXISTS "users" (
    "id" BIGSERIAL NOT NULL PRIMARY KEY,
    "lastname" VARCHAR(20) NOT NULL,
    "firstname" VARCHAR(50),
    "username" VARCHAR(50) NOT NULL UNIQUE,
    "email" VARCHAR(255) NOT NULL UNIQUE,
    "phone" VARCHAR(25),
    "password" VARCHAR(255),
    "avatar" VARCHAR(255),
    "email_confirmed_at" TIMESTAMPTZ,
    "created_at" TIMESTAMPTZ NOT NULL  DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ NOT NULL  DEFAULT CURRENT_TIMESTAMP,
    "is_actif" BOOL NOT NULL  DEFAULT True
);
CREATE TABLE IF NOT EXISTS "notifications" (
    "id" BIGSERIAL NOT NULL PRIMARY KEY,
    "type" VARCHAR(255) NOT NULL,
    "read_at" TIMESTAMPTZ,
    "data" JSONB,
    "created_at" TIMESTAMPTZ NOT NULL  DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ NOT NULL  DEFAULT CURRENT_TIMESTAMP,
    "user_id" BIGINT REFERENCES "users" ("id") ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "aerich" (
    "id" SERIAL NOT NULL PRIMARY KEY,
    "version" VARCHAR(255) NOT NULL,
    "app" VARCHAR(20) NOT NULL,
    "content" JSONB NOT NULL
);
CREATE TABLE IF NOT EXISTS "user_roles" (
    "users_id" BIGINT NOT NULL REFERENCES "users" ("id") ON DELETE CASCADE,
    "role_id" BIGINT NOT NULL REFERENCES "roles" ("id") ON DELETE CASCADE
);

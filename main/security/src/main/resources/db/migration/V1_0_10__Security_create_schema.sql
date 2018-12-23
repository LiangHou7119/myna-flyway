/**
 * Author:  Bruce Wang
 * Created: Jun 19, 2018
 */
--------------------------------------------------
-- Sequence: security.seq_security_id
--------------------------------------------------
CREATE SEQUENCE security.seq_security_id
  MINVALUE 100000;

--------------------------------------------------
-- Table: security.iam_user
--------------------------------------------------
CREATE TABLE security.iam_user
(
  id bigint NOT NULL DEFAULT nextval('security.seq_security_id'),
  created_by bigint,
  created_from character varying(255),
  created_time timestamp without time zone,
  last_modified_by bigint,
  last_modified_from character varying(255),
  last_modified_time timestamp without time zone,
  builtin boolean NOT NULL DEFAULT false,
  description character varying(2000),
  display_name character varying(60) NOT NULL,
  email_address character varying(60) NOT NULL,
  email_address_verified boolean NOT NULL DEFAULT false,
  lock_expiration timestamp without time zone,
  lock_reason character varying(255),
  lower_case_display_name character varying(60) NOT NULL,
  lower_case_name character varying(60) NOT NULL,
  name character varying(60) NOT NULL,
  password character varying(255),
  salt character varying(255),
  secret_answer character varying(255),
  secret_question character varying(120),
  version integer,
  CONSTRAINT iam_user_pkey PRIMARY KEY (id),
  CONSTRAINT uk_iam_u_name UNIQUE (name),
  CONSTRAINT uk_iam_u_lower_case_name UNIQUE (lower_case_name),
  CONSTRAINT uk_iam_u_email_address UNIQUE (email_address)
);

--------------------------------------------------
-- Table: security.iam_group
--------------------------------------------------
CREATE TABLE security.iam_group
(
  id bigint NOT NULL DEFAULT nextval('security.seq_security_id'),
  created_by bigint,
  created_from character varying(255),
  created_time timestamp without time zone,
  last_modified_by bigint,
  last_modified_from character varying(255),
  last_modified_time timestamp without time zone,
  builtin boolean NOT NULL DEFAULT false,
  description character varying(255),
  lower_case_name character varying(255) NOT NULL,
  name character varying(255) NOT NULL,
  version integer,
  CONSTRAINT iam_group_pkey PRIMARY KEY (id),
  CONSTRAINT uk_iam_g_name UNIQUE (name),
  CONSTRAINT uk_iam_g_lower_case_name UNIQUE (lower_case_name)
);

--------------------------------------------------
-- Table: security.iam_group_membership
--------------------------------------------------
CREATE TABLE security.iam_group_membership
(
  id bigint NOT NULL DEFAULT nextval('security.seq_security_id'),
  created_by bigint,
  created_from character varying(255),
  created_time timestamp without time zone,
  last_modified_by bigint,
  last_modified_from character varying(255),
  last_modified_time timestamp without time zone,
  group_id bigint,
  user_id bigint,
  CONSTRAINT iam_group_membership_pkey PRIMARY KEY (id),
  CONSTRAINT uk_iam_g_memship_group_id_user_id UNIQUE (group_id, user_id)
);

--------------------------------------------------
-- Table: security.iam_role
--------------------------------------------------
CREATE TABLE security.iam_role
(
  id bigint NOT NULL DEFAULT nextval('security.seq_security_id'),
  created_by bigint,
  created_from character varying(255),
  created_time timestamp without time zone,
  last_modified_by bigint,
  last_modified_from character varying(255),
  last_modified_time timestamp without time zone,
  builtin boolean NOT NULL DEFAULT false,
  description character varying(255),
  lower_case_name character varying(255) NOT NULL,
  name character varying(255) NOT NULL,
  version integer,
  CONSTRAINT iam_role_pkey PRIMARY KEY (id),
  CONSTRAINT uk_iam_r_name UNIQUE (name),
  CONSTRAINT uk_iam_r_lower_case_name UNIQUE (lower_case_name)
);

--------------------------------------------------
-- Table: security.iam_user_role_grant
--------------------------------------------------
CREATE TABLE security.iam_user_role_grant
(
  id bigint NOT NULL DEFAULT nextval('security.seq_security_id'),
  created_by bigint,
  created_from character varying(255),
  created_time timestamp without time zone,
  last_modified_by bigint,
  last_modified_from character varying(255),
  last_modified_time timestamp without time zone,
  role_id bigint,
  user_id bigint,
  CONSTRAINT iam_user_role_grant_pkey PRIMARY KEY (id),
  CONSTRAINT uk_iam_u_r_grant_role_id_user_id UNIQUE (role_id, user_id)
);

--------------------------------------------------
-- Table: security.iam_group_role_grant
--------------------------------------------------
CREATE TABLE security.iam_group_role_grant
(
  id bigint NOT NULL DEFAULT nextval('security.seq_security_id'),
  created_by bigint,
  created_from character varying(255),
  created_time timestamp without time zone,
  last_modified_by bigint,
  last_modified_from character varying(255),
  last_modified_time timestamp without time zone,
  group_id bigint,
  role_id bigint,
  CONSTRAINT iam_group_role_grant_pkey PRIMARY KEY (id),
  CONSTRAINT uk_iam_g_role_grant_role_id_group_id UNIQUE (role_id, group_id)
);

--------------------------------------------------
-- Table: security.iam_user_audit
--------------------------------------------------
CREATE TABLE security.iam_user_audit
(
  user_id bigint NOT NULL DEFAULT nextval('security.seq_security_id'),
  created_by bigint,
  created_from character varying(255),
  created_time timestamp without time zone,
  last_modified_by bigint,
  last_modified_from character varying(255),
  last_modified_time timestamp without time zone,
  current_failed_login_count integer,
  last_failed_login_from character varying(255),
  last_failed_login_time timestamp without time zone,
  last_login_from character varying(255),
  last_login_time timestamp without time zone,
  locked_by character varying(255),
  locked_from character varying(255),
  locked_time timestamp without time zone,
  login_count integer,
  previous_login_from character varying(255),
  previous_login_time timestamp without time zone,
  total_failed_login_count integer,
  unlocked_by character varying(255),
  unlocked_from character varying(16),
  unlocked_time timestamp without time zone,
  CONSTRAINT iam_user_audit_pkey PRIMARY KEY (user_id)
);


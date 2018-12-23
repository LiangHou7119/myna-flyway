/**
 * Author:  Bruce Wang
 * Created: June 20, 2018
 */
------------------------------------------------
-- builtin administrator
------------------------------------------------

-- iam_user
insert into security.iam_user(
	id,
	name,
	lower_case_name,
	display_name,
	lower_case_display_name,
	email_address,
	email_address_verified,
	builtin,
	created_by, 
	created_time,
	last_modified_by,
	last_modified_time
) values(
	-1,
	'administrator',
	'administrator',
	'administrator',
	'administrator',
	'myna@thomsonreuters.com',
	true,
	true,
	-1,
	now(),
	-1,
	now()
);

-- iam_group
insert into security.iam_group(
	id,
	name,
	lower_case_name,
	builtin,
	created_by,
	created_time,
	last_modified_by,
	last_modified_time
) values (
	-1,
	'administrators',
	'administrators',
	true,
	-1,
	now(),
	-1,
	now()
);

-- iam_group_membership
insert into security.iam_group_membership(
	id,
	group_id,
	user_id,
	created_by,
	created_time,
	last_modified_by,
	last_modified_time
) values(
	-1,
	-1,
	-1,
	-1,
	now(),
	-1,
	now()
);

-- iam_role
insert into security.iam_role(
	id,
	name,
	lower_case_name,
	builtin,
	created_by,
	created_time,
	last_modified_by,
	last_modified_time
) values(
	-1,
	'administrator',
	'administrator',
	true,
	-1,
	now(),
	-1,
	now()
);

-- iam_user_role_grant
insert into security.iam_user_role_grant(
	id,
	user_id,
	role_id,
	created_by,
	created_time,
	last_modified_by,
	last_modified_time
) values(
	-1,
	-1,
	-1,
	-1,
	now(),
	-1,
	now()
);

-- iam_group_role_grant
insert into security.iam_group_role_grant(
	id,
	group_id,
	role_id,
	created_by,
	created_time,
	last_modified_by,
	last_modified_time
) values(
	-1,
	-1,
	-1,
	-1,
	now(),
	-1,
	now()
);


INSERT INTO inserv.instrument (entity_id, is_stub, is_quotable, created, created_by, last_modified, last_modified_by) VALUES (1, false, false, '1753-01-01 00:00:00', '10003', '1753-01-01 00:00:00', '10003');
INSERT INTO inserv.instrument_version (entity_id, version_id, is_stub, is_quotable, active_from, active_to, effective_from, effective_to, created, created_by, last_modified, last_modified_by) VALUES (1, 1, false, false, '1753-01-01 00:00:00', '9999-12-31 00:00:00', '1753-01-01 00:00:00', '9999-12-31 00:00:00', '1753-01-01 00:00:00', '10003', '1753-01-01 00:00:00', '10003');
INSERT INTO inserv.instrument_attribute (attribute_id, entity_id,attribute_definition_id, attribute_type , language_id, created, created_by, last_modified, last_modified_by) VALUES (1, 1, 110, 'String', 505062, '1753-01-01 00:00:00', '10003', '1753-01-01 00:00:00', '10003');
INSERT INTO inserv.instrument_attribute (attribute_id, entity_id,attribute_definition_id, attribute_type , language_id, created, created_by, last_modified, last_modified_by) VALUES (2, 1, 130, 'AdminState', null, '1753-01-01 00:00:00', '10003', '1753-01-01 00:00:00', '10003');


INSERT INTO inserv.instrument_attribute_version
(
 attribute_id,
 entity_id,
 attribute_definition_id,
 attribute_type,
 payload,
 language_id,
 active_from,
 active_to,
 effective_from,
 effective_to,
 created,
 created_by,
 last_modified,
 last_modified_by)
 VALUES ( 1, 1, 110, 'String', '"common name 001"',505062, 
'1753-01-01 00:00:00', '1980-12-31 00:00:00', '1753-01-01 00:00:00', 
'1980-12-31 00:00:00', '1753-01-01 00:00:00', '10003', '1753-01-01 00:00:00', '10003');

INSERT INTO inserv.instrument_attribute_version
(
version_id,
 attribute_id,
 entity_id,
 attribute_definition_id,
 attribute_type,
 payload,
 language_id,
 active_from,
 active_to,
 effective_from,
 effective_to,
 created,
 created_by,
 last_modified,
 last_modified_by)
 VALUES (1, 1, 1, 110, 'String', '"common name 002"',505062, 
'1980-12-31 00:00:00', '9999-12-31 00:00:00', '1980-12-31 00:00:00', 
'9999-12-31 00:00:00', '1753-01-01 00:00:00', '10003', '1753-01-01 00:00:00', '10003');

INSERT INTO inserv.instrument_attribute_version
(
version_id,
 attribute_id,
 entity_id,
 attribute_definition_id,
 attribute_type,
 payload,
 language_id,
 active_from,
 active_to,
 effective_from,
 effective_to,
 created,
 created_by,
 last_modified,
 last_modified_by)
 VALUES (2, 2, 1, 130, 'AdminState', '{"status":"Registered"}',null, 
'1753-01-01 00:00:00', '9999-12-31 00:00:00', '1753-01-01 00:00:00', 
'9999-12-31 00:00:00', '1753-01-01 00:00:00', '10003', '1753-01-01 00:00:00', '10003');


--test data for underlying

/*insert into inserv.underlying
(  entity_id,
   composite_type,    
   derivative_instrument_id  ,
   composite_id,
   created,
   created_by,
   last_modified,
   last_modified_by)
   values(1, 'NON',1, null,'1753-01-01 00:00:00', '10003', '1753-01-01 00:00:00', '10003');


insert into inserv.underlying_version
(  version_id,
   entity_id,
   composite_type,    
   derivative_instrument_id  ,
   composite_id,
   underlying_instrument_id,
   active_from,
   active_to,
   effective_from,
   effective_to,
   created,
   created_by,
   last_modified,
   last_modified_by)
 values(  1,
   1,
   'NON',
   1, 
   null,
   null,
   '1753-01-01 00:00:00',
   '9999-12-31 00:00:00',
   '1753-01-01 00:00:00',
   '9999-12-31 00:00:00',
   '1753-01-01 00:00:00', 
   '10003',
   '1753-01-01 00:00:00',
   '10003');

    insert into inserv.underlying_attribute
    (attribute_id,
	entity_id,
	attribute_definition_id,
	language_id,
	attribute_type,
	created,
	created_by,
	last_modified,
	last_modified_by)
    values(
	1,
	1,
	206,
	505062,
	'String',
	'2017-12-31 00:00:00',
	'user',
	'2017-12-31 00:00:00',
	'user');

    insert into inserv.underlying_attribute_version
    (	version_id,
	entity_id,
	attribute_id,
	attribute_definition_id,
	language_id,
	attribute_type,
	payload,
	description,
	active_from,
	active_to,
	effective_from,
	effective_to,
	created,
	created_by,
	last_modified,
	last_modified_by)
    values( 1,
	1,
	1,
	206,
	505062,
	'String',
	'"Underlying"',
	'test attributeVersion insert',
	'2017-08-31 00:00:00',
	'2017-12-31 00:00:00',
	'2017-08-31 00:00:00',
	'2017-12-31 00:00:00',
	'2017-12-31 00:00:00',
	'10003',
	'2017-12-31 00:00:00',
	'10003');

    -- data of tranche

    insert into inserv.tranche
    (	entity_id,
        instrument_id,
        created,
        created_by,
        last_modified,
        last_modified_by)
    values( 1,
        1,
        '2017-12-31 00:00:00',
        '10003',
        '2017-12-31 00:00:00',
        '10003');

    insert into inserv.tranche_version
    (	version_id,
        entity_id,
        instrument_id,
        active_from,
        active_to,
        effective_from,
        effective_to,
        created,
        created_by,
        last_modified,
        last_modified_by)
    values( 1,
        1,
        1,
        '2017-08-31 00:00:00',
        '9999-12-31 00:00:00',
        '2017-12-31 00:00:00',
        '9999-12-31 00:00:00',
        '2017-12-31 00:00:00',
        '10003',
        '2017-12-31 00:00:00',
        '10003');

    insert into inserv.tranche_attribute
    (	attribute_id,
        entity_id,
        attribute_definition_id,
        language_id,
        attribute_type,
        created,
        created_by,
        last_modified,
        last_modified_by)
    values( 1,
        1,
        1004,
        null,
        'String',
        '2017-12-31 00:00:00',
        '10003',
        '2017-12-31 00:00:00',
        '10003');

    insert into inserv.tranche_attribute_version
    (	version_id,
        entity_id,
        attribute_id,
        attribute_definition_id,
        language_id,
        attribute_type,
        payload,
        description,
        active_from,
        active_to,
        effective_from,
        effective_to,
        created,
        created_by,
        last_modified,
        last_modified_by)
    values( 1,
        1,
        1,
        1004,
        null,
        'String',
        '"Tranche"',
        'test attributeVersion insert',
        '2017-08-31 00:00:00',
        '9999-12-31 00:00:00',
        '2017-12-31 00:00:00',
        '9999-12-31 00:00:00',
        '2017-12-31 00:00:00',
        '10003',
        '2017-12-31 00:00:00',
        '10003');	*/


DROP INDEX din_name_idx;
CREATE UNIQUE INDEX din_name_idx ON bulk.bulk_din_configuration(entity_definition_id, din_name);

INSERT INTO bulk.bulk_din_configuration(entity_definition_id, attribute_definition_id, din_name, created, created_by, last_modified, last_modified_by)
VALUES(2,2,'UNDERLYING_TYPE',now(), '10000', now(), '10000');
INSERT INTO bulk.bulk_din_configuration(entity_definition_id, attribute_definition_id, din_name, created, created_by, last_modified, last_modified_by)
VALUES(2,133,'SETTLEMENT_TYPE',now(), '10000', now(), '10000');
INSERT INTO bulk.bulk_din_configuration(entity_definition_id, attribute_definition_id, din_name, created, created_by, last_modified, last_modified_by)
VALUES(2,200,'RATIO',now(), '10000', now(), '10000');
INSERT INTO bulk.bulk_din_configuration(entity_definition_id, attribute_definition_id, din_name, created, created_by, last_modified, last_modified_by)
VALUES(2,205,'WEIGHTING',now(), '10000', now(), '10000');
INSERT INTO bulk.bulk_din_configuration(entity_definition_id, attribute_definition_id, din_name, created, created_by, last_modified, last_modified_by)
VALUES(2,206,'COMMON_NAME',now(), '10000', now(), '10000');
INSERT INTO bulk.bulk_din_configuration(entity_definition_id, attribute_definition_id, din_name, created, created_by, last_modified, last_modified_by)
VALUES(2,212,'EXERCISE_QUANTITY',now(), '10000', now(), '10000');
INSERT INTO bulk.bulk_din_configuration(entity_definition_id, attribute_definition_id, din_name, created, created_by, last_modified, last_modified_by)
VALUES(2,228,'DESIGNATION',now(), '10000', now(), '10000');
INSERT INTO bulk.bulk_din_configuration(entity_definition_id, attribute_definition_id, din_name, created, created_by, last_modified, last_modified_by)
VALUES(2,229,'ALTERNATIVE_CODE',now(), '10000', now(), '10000');



CREATE SEQUENCE bulk.seq_bulk_conf_id increment by 1 minvalue 1 no maxvalue start with 1;
CREATE SEQUENCE bulk.seq_bulk_id increment by 1 minvalue 1 no maxvalue start with 1;
CREATE SEQUENCE bulk.seq_bulk_line_item_id increment by 1 minvalue 1 no maxvalue start with 1;

CREATE TABLE bulk.bulk_din_configuration
(
   id                       bigint          NOT NULL PRIMARY KEY,
   din_name                 varchar(300)    NOT NULL,
   entity_definition_id     bigint          NOT NULL,
   attribute_definition_id  bigint          NOT NULL,
   created                  timestamp       NOT NULL,
   created_by               varchar(80)     NOT NULL,
   last_modified            timestamp       NOT NULL,
   last_modified_by         varchar(80)     NOT NULL
);

CREATE UNIQUE INDEX din_name_idx ON bulk.bulk_din_configuration(din_name);


CREATE FUNCTION bulk.insert_pk_bulk_conf_id() RETURNS trigger AS $pk_bulk_conf_id$
    BEGIN
        -- Check input entity_id is null or < 0
        IF NEW.id IS NULL OR NEW.id <0 THEN
            NEW.id := nextval('bulk.seq_bulk_conf_id');
        END IF;
        RETURN NEW;
    END;
$pk_bulk_conf_id$ LANGUAGE plpgsql;

CREATE TRIGGER insert_pk_bulk_conf_id_tri BEFORE INSERT ON bulk.bulk_din_configuration
    FOR EACH ROW EXECUTE PROCEDURE bulk.insert_pk_bulk_conf_id();


CREATE TABLE bulk.bulk
(
   id                       bigint          NOT NULL PRIMARY KEY,
   bulk_name                varchar(300)    NOT NULL,
   bulk_type                varchar(50)     NOT NULL,
   status                   varchar(50)     NOT NULL,
   bulk_file_name           varchar(300)    NOT NULL,
   bulk_file_size           bigint,
   bulk_file_uri            varchar(500)    NOT NULL,
   upload_time              timestamp,
   work_time                timestamp,
   finish_time              timestamp,
   records                  bigint,
   success_records          bigint,
   unproc_records           bigint,
   partial_success_records  bigint,
   created                  timestamp       NOT NULL,
   created_by               varchar(80)     NOT NULL,
   last_modified            timestamp       NOT NULL,
   last_modified_by         varchar(80)     NOT NULL
);

CREATE UNIQUE INDEX bulk_name_idx ON bulk.bulk(bulk_name);
CREATE INDEX bulk_type_idx ON bulk.bulk (bulk_type);
CREATE INDEX created_by_idx ON bulk.bulk (created_by);


CREATE FUNCTION bulk.insert_pk_bulk_id() RETURNS trigger AS $pk_bulk_id$
    BEGIN
        -- Check input entity_id is null or < 0
        IF NEW.id IS NULL OR NEW.id <0 THEN
            NEW.id := nextval('bulk.seq_bulk_id');
        END IF;
        RETURN NEW;
    END;
$pk_bulk_id$ LANGUAGE plpgsql;

CREATE TRIGGER insert_pk_bulk_id_tri BEFORE INSERT ON bulk.bulk
    FOR EACH ROW EXECUTE PROCEDURE bulk.insert_pk_bulk_id();


CREATE TABLE bulk.bulk_line_item
(
   id                       bigint              NOT NULL PRIMARY KEY,
   bulk_id                  bigint              REFERENCES bulk.bulk(id),
   line_type                varchar(50)         NOT NULL,
   line_number              bigint              NOT NULL,
   content                  varchar(1048576)    NOT NULL,
   perm_id                  varchar(100),
   error                    varchar(1048576),
   created                  timestamp       NOT NULL,
   created_by               varchar(80)     NOT NULL,
   last_modified            timestamp       NOT NULL,
   last_modified_by         varchar(80)     NOT NULL
);

CREATE UNIQUE INDEX bulk_line_item_idx ON bulk.bulk_line_item(bulk_id, line_number);

CREATE FUNCTION bulk.insert_pk_bulk_line_item_id() RETURNS trigger AS $pk_bulk_line_item_id$
    BEGIN
        -- Check input entity_id is null or < 0
        IF NEW.id IS NULL OR NEW.id <0 THEN
            NEW.id := nextval('bulk.seq_bulk_line_item_id');
        END IF;
        RETURN NEW;
    END;
$pk_bulk_line_item_id$ LANGUAGE plpgsql;

CREATE TRIGGER insert_pk_bulk_line_item_id_tri BEFORE INSERT ON bulk.bulk_line_item
    FOR EACH ROW EXECUTE PROCEDURE bulk.insert_pk_bulk_line_item_id();
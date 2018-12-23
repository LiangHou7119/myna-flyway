CREATE SEQUENCE inserv.seq_ins_attr_id increment by 1 minvalue 200000 no maxvalue start with 200001;
CREATE SEQUENCE inserv.seq_ins_attr_ver_id increment by 1 minvalue 200000 no maxvalue start with 200001;


CREATE TABLE inserv.instrument_attribute
(
   attribute_id             bigint        NOT NULL PRIMARY KEY,
   entity_id                bigint        NOT NULL REFERENCES inserv.instrument(entity_id),
   attribute_definition_id  bigint        NOT NULL,
   language_id              bigint,
   attribute_type           varchar(80)   NOT NULL,
   created                  timestamp     NOT NULL,
   created_by               varchar(80)   NOT NULL,
   last_modified            timestamp     NOT NULL,
   last_modified_by         varchar(80)   NOT NULL,
   revision                 bigint
);

--index
create index inst_attr_ent_attr_fk_idx on inserv.instrument_attribute(entity_id,attribute_definition_id );


CREATE FUNCTION insert_pk_ins_attr_id() RETURNS trigger AS $pk_ins_attr_id$
    BEGIN
        -- Check input attribute_id is null or < 0
        IF NEW.attribute_id IS NULL OR NEW.attribute_id <0 THEN
            NEW.attribute_id := nextval('inserv.seq_ins_attr_id');
        END IF;
        RETURN NEW;
    END;
$pk_ins_attr_id$ LANGUAGE plpgsql;

CREATE TRIGGER insert_pk_ins_attr_id_tri BEFORE INSERT ON inserv.instrument_attribute
    FOR EACH ROW EXECUTE PROCEDURE insert_pk_ins_attr_id();


CREATE TABLE inserv.instrument_attribute_version
(
   version_id               bigint              NOT NULL PRIMARY KEY,
   entity_id                bigint              NOT NULL REFERENCES inserv.instrument(entity_id),
   attribute_id             bigint              NOT NULL REFERENCES inserv.instrument_attribute(attribute_id),
   attribute_definition_id  bigint              NOT NULL,
   language_id              bigint,
   attribute_type           varchar(80)         NOT NULL,
   payload                  varchar(1048576)    NOT NULL,
   description              varchar(1048576), --1M
   active_from              timestamp           NOT NULL,
   active_to                timestamp           NOT NULL,
   effective_from           timestamp           NOT NULL,
   effective_to             timestamp           NOT NULL,                           
   effective_from_nacode           varchar(20),
   effective_to_nacode             varchar(20),
   created                  timestamp           NOT NULL,
   created_by               varchar(80)         NOT NULL,
   last_modified            timestamp           NOT NULL,
   last_modified_by         varchar(80)         NOT NULL,
   revision                 bigint
);


--index
create index attr_ver_ent_attr_fk_idx on inserv.instrument_attribute_version(entity_id,attribute_definition_id);

--index
create index attr_ver_attr_fk_idx on inserv.instrument_attribute_version(attribute_id);

--index
create index attr_ver_payload_idx on inserv.instrument_attribute_version(payload, attribute_definition_id);


CREATE FUNCTION insert_pk_ins_attr_ver_id() RETURNS trigger AS $pk_ins_attr_ver_id$
    BEGIN
        -- Check input attribute_id is null or < 0
        IF NEW.version_id IS NULL OR NEW.version_id <0 THEN
            NEW.version_id := nextval('inserv.seq_ins_attr_ver_id');
        END IF;
        RETURN NEW;
    END;
$pk_ins_attr_ver_id$ LANGUAGE plpgsql;

CREATE TRIGGER insert_pk_ins_attr_ver_id_tri BEFORE INSERT ON inserv.instrument_attribute_version
    FOR EACH ROW EXECUTE PROCEDURE insert_pk_ins_attr_ver_id();

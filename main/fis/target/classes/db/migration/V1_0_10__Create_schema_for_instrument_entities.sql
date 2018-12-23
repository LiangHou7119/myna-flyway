CREATE SEQUENCE inserv.seq_ins_id increment by 1 minvalue 500000000 no maxvalue start with 500000001;
CREATE SEQUENCE inserv.seq_ins_ver_id increment by 1 minvalue 200000 no maxvalue start with 200001;

CREATE SEQUENCE inserv.seq_perm_id increment by 1 minvalue 23000000000 maxvalue 25000000000 start with 23000000001;

CREATE TABLE inserv.instrument
(
   entity_id         bigint        NOT NULL PRIMARY KEY,
   is_stub           boolean       NOT NULL,
   is_quotable       boolean       NOT NULL,
   created           timestamp     NOT NULL,
   created_by        varchar(80)   NOT NULL,
   last_modified     timestamp     NOT NULL,
   last_modified_by  varchar(80)   NOT NULL,
   revision          bigint
);


CREATE FUNCTION insert_pk_ins_entity_id() RETURNS trigger AS $pk_ins_entity_id$
    BEGIN
        -- Check input entity_id is null or < 0
        IF NEW.entity_id IS NULL OR NEW.entity_id <0 THEN
            NEW.entity_id := nextval('inserv.seq_ins_id');
        END IF;
        RETURN NEW;
    END;
$pk_ins_entity_id$ LANGUAGE plpgsql;

CREATE TRIGGER insert_pk_ins_entity_id_tri BEFORE INSERT ON inserv.instrument
    FOR EACH ROW EXECUTE PROCEDURE insert_pk_ins_entity_id();

CREATE TABLE inserv.instrument_version
(
   version_id        bigint        NOT NULL PRIMARY KEY,
   entity_id         bigint        NOT NULL REFERENCES inserv.instrument(entity_id),
   is_stub           boolean       NOT NULL,
   is_quotable       boolean       NOT NULL,
   active_from       timestamp     NOT NULL,
   active_to         timestamp     NOT NULL,
   effective_from    timestamp     NOT NULL,
   effective_to      timestamp     NOT NULL,
   effective_from_nacode           varchar(20),
   effective_to_nacode             varchar(20),
   created           timestamp     NOT NULL,
   created_by        varchar(80)   NOT NULL,
   last_modified     timestamp     NOT NULL,
   last_modified_by  varchar(80)   NOT NULL,
   revision          bigint
);

create index inst_ver_fk_ent_idx on inserv.instrument_version(entity_id);

CREATE FUNCTION insert_pk_ins_version_id() RETURNS trigger AS $pk_ins_version_id$
    BEGIN
        --Check input version_id is null or < 0
        IF NEW.version_id IS NULL OR NEW.version_id <0 THEN
            NEW.version_id := nextval('inserv.seq_ins_ver_id');
        END IF;
        RETURN NEW;
    END;
$pk_ins_version_id$ LANGUAGE plpgsql;

CREATE TRIGGER insert_pk_ins_version_id_tri BEFORE INSERT ON inserv.instrument_version
    FOR EACH ROW EXECUTE PROCEDURE insert_pk_ins_version_id();


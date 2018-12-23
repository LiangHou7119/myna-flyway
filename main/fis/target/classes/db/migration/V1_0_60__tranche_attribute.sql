/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  u8017655
 * Created: Aug 2, 2017
 */


CREATE SEQUENCE inserv.seq_tranche_attr_id increment by 1 minvalue 200000 no maxvalue start with 200001;
CREATE SEQUENCE inserv.seq_tranche_attr_ver_id increment by 1 minvalue 200000 no maxvalue start with 200001;


CREATE TABLE inserv.tranche_attribute
(
   attribute_id             bigint        NOT NULL PRIMARY KEY,
   entity_id        bigint        NOT NULL REFERENCES inserv.tranche(entity_id),
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
create index tranche_attr_ent_attr_fk_idx on inserv.tranche_attribute
(entity_id,attribute_definition_id );


CREATE FUNCTION insert_pk_tranche_attr_id() RETURNS trigger AS $pk_tranche_attr_id$
    BEGIN
        -- Check input attribute_id is null or < 0
        IF NEW.attribute_id IS NULL OR NEW.attribute_id <0 THEN
            NEW.attribute_id := nextval('inserv.seq_tranche_attr_id');
        END IF;
        RETURN NEW;
    END;
$pk_tranche_attr_id$ LANGUAGE plpgsql;

CREATE TRIGGER insert_pk_tranche_attr_id_tri BEFORE INSERT ON inserv.tranche_attribute
    FOR EACH ROW EXECUTE PROCEDURE insert_pk_tranche_attr_id();


CREATE TABLE inserv.tranche_attribute_version
(
   version_id               bigint              NOT NULL PRIMARY KEY,
   entity_id        bigint              NOT NULL REFERENCES inserv.tranche(entity_id),
   attribute_id             bigint              NOT NULL REFERENCES inserv.tranche_attribute(attribute_id),
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
create index tranchet_attr_ver_ent_attr_fk_idx on inserv.tranche_attribute_version(entity_id,attribute_definition_id);

--index
create index tranche_attr_ver_attr_fk_idx on inserv.tranche_attribute_version(attribute_id);



CREATE FUNCTION insert_pk_tranche_attr_ver_id() RETURNS trigger AS $pk_tranche_attr_ver_id$
    BEGIN
        -- Check input attribute_id is null or < 0
        IF NEW.version_id IS NULL OR NEW.version_id <0 THEN
            NEW.version_id := nextval('inserv.seq_tranche_attr_ver_id');
        END IF;
        RETURN NEW;
    END;
$pk_tranche_attr_ver_id$ LANGUAGE plpgsql;

CREATE TRIGGER insert_pk_tranche_attr_ver_id BEFORE INSERT ON inserv.tranche_attribute_version
    FOR EACH ROW EXECUTE PROCEDURE insert_pk_tranche_attr_ver_id();

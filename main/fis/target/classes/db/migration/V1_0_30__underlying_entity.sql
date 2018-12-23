/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  betty.xie
 * Created: Jul 27, 2017
 */




CREATE TABLE inserv.underlying
(
   entity_id                 bigint        NOT NULL PRIMARY KEY,
   composite_type    varchar(80),      --NON or BASKET
   derivative_instrument_id  bigint        NOT NULL REFERENCES inserv.instrument(entity_id),
   composite_id              bigint        REFERENCES inserv.underlying(entity_id), --fk to inserv.underling, refer to the parent underlying entity
   created           timestamp     NOT NULL,
   created_by        varchar(80)   NOT NULL,
   last_modified     timestamp     NOT NULL,
   last_modified_by  varchar(80)   NOT NULL,
   revision                  bigint
);

create index undly_fk_composite_idx on  inserv.underlying(composite_id);
create index undly_fk_deri_ent_idx on inserv.underlying(derivative_instrument_id);



CREATE FUNCTION insert_pk_undly_entity_id() RETURNS trigger AS $pk_undly_entity_id$
    BEGIN
        -- Check input entity_id is null or < 0
        IF NEW.entity_id IS NULL OR NEW.entity_id <0 THEN
            NEW.entity_id := nextval('inserv.seq_ins_id');
        END IF;
        RETURN NEW;
    END;
$pk_undly_entity_id$ LANGUAGE plpgsql;

CREATE TRIGGER insert_pk_undly_entity_id_tri BEFORE INSERT ON inserv.underlying
    FOR EACH ROW EXECUTE PROCEDURE insert_pk_undly_entity_id();



CREATE TABLE inserv.underlying_version
(
   version_id                bigint        NOT NULL PRIMARY KEY,
   entity_id      bigint        NOT NULL REFERENCES inserv.underlying(entity_id),
   composite_type    varchar(80),      --NON or BASKET
   derivative_instrument_id      bigint        NOT NULL REFERENCES inserv.instrument(entity_id),
   underlying_instrument_id      bigint,
   composite_id              bigint,       --ignore FK references as this is copied from table underlying and seems to have no query scenario
   active_from               timestamp     NOT NULL,
   active_to                 timestamp     NOT NULL,
   effective_from            timestamp     NOT NULL,
   effective_to              timestamp     NOT NULL,
   effective_from_nacode           varchar(20),
   effective_to_nacode             varchar(20),
   created                   timestamp     NOT NULL,
   created_by                varchar(80)   NOT NULL,
   last_modified             timestamp     NOT NULL,
   last_modified_by          varchar(80)   NOT NULL,
   revision                  bigint
);

create index undly_ver_fk_undly_ent_idx on inserv.underlying_version(entity_id);

create index undly_ver_fk_deri_ent_idx on inserv.underlying_version(derivative_instrument_id);

CREATE FUNCTION insert_pk_undly_version_id() RETURNS trigger AS $pk_undly_version_id$
    BEGIN
        --Check input version_id is null or < 0
        IF NEW.version_id IS NULL OR NEW.version_id <0 THEN
            NEW.version_id := nextval('inserv.seq_ins_ver_id');
        END IF;
        RETURN NEW;
    END
$pk_undly_version_id$ LANGUAGE plpgsql;

CREATE TRIGGER insert_pk_undly_version_id_tri BEFORE INSERT ON inserv.underlying_version
    FOR EACH ROW EXECUTE PROCEDURE insert_pk_undly_version_id();

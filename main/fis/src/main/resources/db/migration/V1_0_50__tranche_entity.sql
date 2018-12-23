/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  u8017655
 * Created: Aug 2, 2017
 */

CREATE TABLE inserv.tranche
(
   entity_id                 bigint        NOT NULL PRIMARY KEY,    
   instrument_id            bigint        NOT NULL REFERENCES inserv.instrument(entity_id),
   created                  timestamp           NOT NULL,
   created_by               varchar(80)         NOT NULL,
   last_modified            timestamp           NOT NULL,
   last_modified_by         varchar(80)         NOT NULL,
   revision                 bigint
);

create index tranche_fk_ins_ent_idx on inserv.tranche(instrument_id);



CREATE FUNCTION insert_pk_tranche_id() RETURNS trigger AS $pk_tranche_id$
    BEGIN
        -- Check input entity_id is null or < 0
        IF NEW.entity_id IS NULL OR NEW.entity_id <0 THEN
            NEW.entity_id := nextval('inserv.seq_ins_id');
        END IF;
        RETURN NEW;
    END;
$pk_tranche_id$ LANGUAGE plpgsql;

CREATE TRIGGER insert_pk_tranche_id_tri BEFORE INSERT ON inserv.tranche
    FOR EACH ROW EXECUTE PROCEDURE insert_pk_tranche_id();



CREATE TABLE inserv.tranche_version
(
   version_id                bigint        NOT NULL PRIMARY KEY,
   entity_id                 bigint        NOT NULL REFERENCES inserv.tranche(entity_id), 
   instrument_id            bigint        NOT NULL REFERENCES inserv.instrument(entity_id),
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

create index tranche_ver_fk_tranche_ent_idx on inserv.tranche_version(entity_id);

create index tranche_ver_fk_ins_ent_idx on inserv.tranche_version(instrument_id);

CREATE FUNCTION insert_pk_tranche_version_id() RETURNS trigger AS $pk_tranche_version_id$
    BEGIN
        --Check input version_id is null or < 0
        IF NEW.version_id IS NULL OR NEW.version_id <0 THEN
            NEW.version_id := nextval('inserv.seq_ins_ver_id');
        END IF;
        RETURN NEW;
    END
$pk_tranche_version_id$ LANGUAGE plpgsql;

CREATE TRIGGER insert_pk_tranche_version_id_tri BEFORE INSERT ON inserv.tranche_version
    FOR EACH ROW EXECUTE PROCEDURE insert_pk_tranche_version_id();

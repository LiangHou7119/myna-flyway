/**
 *
 */

CREATE OR REPLACE FUNCTION inserv.insert_bf_instrument_attribute_version()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

    DECLARE
        insCountNum Integer;
        bfCountNum Integer;
        existResolveNum Integer;
        warrantIdCount Integer;
    BEGIN
        IF (TG_OP = 'INSERT') THEN
            select count(1) into warrantIdCount from backfeed.bf_attribute_mapping where warrant_attribute_id = new.attribute_definition_id and enable = true;
                IF (warrantIdCount > 0) THEN
                    IF( new.attribute_definition_id = 130) THEN
                       IF ( to_char(new.effective_to,'YYYY') = '9999') THEN
                            INSERT INTO backfeed.bf_instrument_attribute_version SELECT null,txid_current(),new.version_id, new.entity_id, new.attribute_id, new.attribute_definition_id, new.language_id,
                                new.attribute_type, new.payload, new.description, new.active_from, new.active_to, new.effective_from,
                                new.effective_to, new.effective_from_nacode, new.effective_to_nacode, new.created, new.created_by,
                                new.last_modified, new.last_modified_by, new.revision;
                       END IF;
                    ELSE
                        --select * from backfeed.bf_attribute_mapping

                        select count(1) into bfCountNum from backfeed.bf_instrument_attribute_version iv where iv.entity_id=new.entity_id
                        and iv.attribute_definition_id=new.attribute_definition_id and
                        ((iv.effective_from <= new.effective_from and iv.effective_to >= new.effective_to)
                            OR (iv.effective_from >= new.effective_from and iv.effective_to <= new.effective_to));
                        IF ( bfCountNum >0) THEN
                            delete from backfeed.bf_instrument_attribute_version iv where iv.entity_id=new.entity_id
                                and iv.attribute_definition_id=new.attribute_definition_id and
                                ((iv.effective_from <= new.effective_from and iv.effective_to >= new.effective_to)
                                OR (iv.effective_from >= new.effective_from and iv.effective_to <= new.effective_to));
                        END IF;
                        INSERT INTO backfeed.bf_instrument_attribute_version SELECT null,txid_current(),new.version_id, new.entity_id, new.attribute_id, new.attribute_definition_id, new.language_id,
                            new.attribute_type, new.payload, new.description, new.active_from, new.active_to, new.effective_from,
                            new.effective_to, new.effective_from_nacode, new.effective_to_nacode, new.created, new.created_by,
                            new.last_modified, new.last_modified_by, new.revision;
                    END IF;
                END IF;
        -- Data is modified only when deleted
        ELSIF (TG_OP = 'UPDATE') THEN
            select count(1) into warrantIdCount from backfeed.bf_attribute_mapping where warrant_attribute_id = new.attribute_definition_id and enable = true;
                IF (warrantIdCount > 0) THEN
                    select count(1) into bfCountNum from backfeed.bf_instrument_attribute_version iv where iv.entity_id=new.entity_id
                        and iv.attribute_definition_id=new.attribute_definition_id and
                        ((iv.effective_from <= new.effective_from and iv.effective_to >= new.effective_to)
                            OR (iv.effective_from >= new.effective_from and iv.effective_to <= new.effective_to));

                    IF( new.attribute_definition_id = 130 AND bfCountNum > 0) THEN
                        delete from backfeed.bf_instrument_attribute_version where version_id = new.version_id;
                    ELSE
                        IF ( bfCountNum = 0) THEN --the operation of delete
                            INSERT INTO backfeed.bf_instrument_attribute_version SELECT null,txid_current(),new.version_id, new.entity_id, new.attribute_id, new.attribute_definition_id, new.language_id,
                                new.attribute_type, new.payload, new.description, new.active_from, new.active_to, new.effective_from,
                                new.effective_to, new.effective_from_nacode, new.effective_to_nacode, new.created, new.created_by,
                                new.last_modified, new.last_modified_by, new.revision;
                        ELSE -- the operation of update
                            update backfeed.bf_instrument_attribute_version set xid = txid_current(), version_id = new.version_id, entity_id = new.entity_id,attribute_id =new.attribute_id, attribute_definition_id =new.attribute_definition_id,language_id = new.language_id,
                                attribute_type =new.attribute_type, payload =new.payload, description =new.description, active_from = new.active_from, active_to = new.active_to, effective_from = new.effective_from, effective_to = new.effective_to,
                                effective_from_nacode = new.effective_from_nacode, effective_to_nacode = new.effective_to_nacode, created = new.created, created_by = new.created_by, last_modified = new.last_modified,
                                last_modified_by = new.last_modified_by, revision = new.revision
                            where entity_id=new.entity_id and attribute_definition_id=new.attribute_definition_id and
                                  ((effective_from <= new.effective_from and effective_to >= new.effective_to)
                                  OR (effective_from >= new.effective_from and effective_to <= new.effective_to));
                        END IF;
                    END IF;
                END IF;
        END IF;
        RETURN NULL;
    END;

$BODY$;

ALTER FUNCTION inserv.insert_bf_instrument_attribute_version()
    OWNER TO myna;

DROP TRIGGER IF EXISTS trg_bf_instrument_attribute_version ON inserv.instrument_attribute_version;    
CREATE TRIGGER trg_bf_instrument_attribute_version
    AFTER INSERT OR UPDATE
    ON inserv.instrument_attribute_version
    FOR EACH ROW
    EXECUTE PROCEDURE inserv.insert_bf_instrument_attribute_version();


-- FUNCTION: inserv.insert_bf_instrument_version()

-- DROP FUNCTION inserv.insert_bf_instrument_version();

CREATE OR REPLACE FUNCTION inserv.insert_bf_instrument_version()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

    DECLARE
        bfCountNum Integer;
    BEGIN
        IF (TG_OP = 'INSERT') THEN
            IF (NEW.is_stub = false) THEN

                select count(1) into bfCountNum from backfeed.bf_instrument_version iv where iv.entity_id=new.entity_id
                     and ((iv.effective_from <= new.effective_from and iv.effective_to >= new.effective_to)
                     OR (iv.effective_from >= new.effective_from and iv.effective_to <= new.effective_to));

                IF ( bfCountNum >0) THEN
                    delete from backfeed.bf_instrument_version iv where iv.entity_id=new.entity_id
                        and    ((iv.effective_from <= new.effective_from and iv.effective_to >= new.effective_to)
                        OR (iv.effective_from >= new.effective_from and iv.effective_to <= new.effective_to));
                END IF;

                insert into backfeed.bf_instrument_version select null, txid_current(), new.version_id, new.entity_id, new.is_stub, new.is_quotable, new.active_from, new.active_to,
                    new.effective_from, new.effective_to, new.effective_from_nacode, new.effective_to_nacode, new.created,
                    new.created_by, new.last_modified, new.last_modified_by, new.revision;
            END IF;
        ELSIF (TG_OP = 'UPDATE') THEN

            select count(1) into bfCountNum from backfeed.bf_instrument_version iv where iv.entity_id=new.entity_id
                 and ((iv.effective_from <= new.effective_from and iv.effective_to >= new.effective_to)
                 OR (iv.effective_from >= new.effective_from and iv.effective_to <= new.effective_to));

            IF ( bfCountNum = 0) THEN

                insert into backfeed.bf_instrument_version select null, txid_current(), new.version_id, new.entity_id, new.is_stub, new.is_quotable, new.active_from, new.active_to,
                    new.effective_from, new.effective_to, new.effective_from_nacode, new.effective_to_nacode, new.created,
                    new.created_by, new.last_modified, new.last_modified_by, new.revision;
            ELSE

                update backfeed.bf_instrument_version set xid = txid_current(), version_id = new.version_id, entity_id = new.entity_id, is_stub = new.is_stub, is_quotable = new.is_quotable,
                    active_from = new.active_from, active_to = new.active_to, effective_from = new.effective_from, effective_to = new.effective_to, effective_from_nacode = new.effective_from_nacode,
                    effective_to_nacode = new.effective_to_nacode, created = new.created, created_by = new.created_by, last_modified = new.last_modified, last_modified_by = new.last_modified_by, revision = new.revision
                where entity_id=new.entity_id and ((effective_from <= new.effective_from and effective_to >= new.effective_to)
                      OR (effective_from >= new.effective_from and effective_to <= new.effective_to));
            END IF;
       END IF;
      RETURN null;
    END;

$BODY$;

ALTER FUNCTION inserv.insert_bf_instrument_version()
    OWNER TO myna;

-- Trigger: trg_bf_instrument_version

DROP TRIGGER IF EXISTS trg_bf_instrument_version ON inserv.instrument_version;
CREATE TRIGGER trg_bf_instrument_version
    AFTER INSERT OR UPDATE
    ON inserv.instrument_version
    FOR EACH ROW
    EXECUTE PROCEDURE inserv.insert_bf_instrument_version();


-- FUNCTION: inserv.insert_bf_tranche_attr_version()

-- DROP FUNCTION inserv.insert_bf_tranche_attr_version();

CREATE OR REPLACE FUNCTION inserv.insert_bf_tranche_attr_version()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

    DECLARE
        bfCountNum Integer;
    BEGIN
        IF (TG_OP = 'INSERT') THEN
            IF( new.attribute_type = 'AdminState') THEN
               IF ( to_char(new.effective_to,'YYYY') = '9999') THEN

                    INSERT INTO backfeed.bf_tranche_attribute_version SELECT null,txid_current(),new.version_id, new.entity_id, new.attribute_id, new.attribute_definition_id, new.language_id,
                        new.attribute_type, new.payload, new.description, new.active_from, new.active_to, new.effective_from,
                        new.effective_to, new.effective_from_nacode, new.effective_to_nacode, new.created, new.created_by,
                        new.last_modified, new.last_modified_by, new.revision;
               END IF;
            ELSE

                select count(1) into bfCountNum from backfeed.bf_tranche_attribute_version iv where iv.entity_id=new.entity_id
                    and iv.attribute_definition_id=new.attribute_definition_id and
                    ((iv.effective_from <= new.effective_from and iv.effective_to >= new.effective_to)
                    OR (iv.effective_from >= new.effective_from and iv.effective_to <= new.effective_to));

                IF ( bfCountNum >0) THEN

                    delete from backfeed.bf_tranche_attribute_version iv where iv.entity_id=new.entity_id
                        and iv.attribute_definition_id=new.attribute_definition_id and
                        ((iv.effective_from <= new.effective_from and iv.effective_to >= new.effective_to)
                        OR (iv.effective_from >= new.effective_from and iv.effective_to <= new.effective_to));
                END IF;

                INSERT INTO backfeed.bf_tranche_attribute_version SELECT null,txid_current(),new.version_id, new.entity_id, new.attribute_id, new.attribute_definition_id, new.language_id,
                    new.attribute_type, new.payload, new.description, new.active_from, new.active_to, new.effective_from,
                    new.effective_to, new.effective_from_nacode, new.effective_to_nacode, new.created, new.created_by,
                    new.last_modified, new.last_modified_by, new.revision;
            END IF;
        -- Data is modified only when deleted
        ELSIF (TG_OP = 'UPDATE') THEN

            select count(1) into bfCountNum from backfeed.bf_tranche_attribute_version iv where iv.entity_id=new.entity_id
                and iv.attribute_definition_id=new.attribute_definition_id and
                ((iv.effective_from <= new.effective_from and iv.effective_to >= new.effective_to)
                OR (iv.effective_from >= new.effective_from and iv.effective_to <= new.effective_to));

            IF( new.attribute_type = 'AdminState' AND bfCountNum > 0) THEN

                delete from backfeed.bf_tranche_attribute_version where iv.entity_id=new.entity_id
                    and iv.attribute_definition_id=new.attribute_definition_id and
                    ((iv.effective_from <= new.effective_from and iv.effective_to >= new.effective_to)
                    OR (iv.effective_from >= new.effective_from and iv.effective_to <= new.effective_to));
            ELSE

                IF ( bfCountNum = 0) THEN --the operation of delete

                    INSERT INTO backfeed.bf_tranche_attribute_version SELECT null,txid_current(),new.version_id, new.entity_id, new.attribute_id, new.attribute_definition_id, new.language_id,
                        new.attribute_type, new.payload, new.description, new.active_from, new.active_to, new.effective_from,
                        new.effective_to, new.effective_from_nacode, new.effective_to_nacode, new.created, new.created_by,
                        new.last_modified, new.last_modified_by, new.revision;
                ELSE -- the operation of update

                    UPDATE backfeed.bf_tranche_attribute_version SET xid = txid_current(), version_id = new.version_id, entity_id = new.entity_id,
                        attribute_id = new.attribute_id, attribute_definition_id = new.attribute_definition_id, language_id = new.language_id,
                        attribute_type = new.attribute_type, payload = new.payload, description = new.description, active_from = new.active_from,
                        active_to = new.active_to, effective_from = new.effective_from,    effective_to = new.effective_to, effective_from_nacode = new.effective_from_nacode,
                        effective_to_nacode = new.effective_to_nacode, created = new.created, created_by = new.created_by, last_modified = new.last_modified,
                        last_modified_by = new.last_modified_by, revision = new.revision
                    where entity_id=new.entity_id and attribute_definition_id=new.attribute_definition_id and
                          ((effective_from <= new.effective_from and effective_to >= new.effective_to)
                          OR (effective_from >= new.effective_from and effective_to <= new.effective_to));
                END IF;
            END IF;
        END IF;
        RETURN NULL;
    END;

$BODY$;

ALTER FUNCTION inserv.insert_bf_tranche_attr_version()
    OWNER TO myna;


-- Trigger: trg_bf_tranche_attr_version

DROP TRIGGER IF EXISTS trg_bf_tranche_attr_version ON inserv.tranche_attribute_version;
CREATE TRIGGER trg_bf_tranche_attr_version
    AFTER INSERT OR UPDATE
    ON inserv.tranche_attribute_version
    FOR EACH ROW
    EXECUTE PROCEDURE inserv.insert_bf_tranche_attr_version();


-- FUNCTION: inserv.insert_bf_tranche_version()

-- DROP FUNCTION inserv.insert_bf_tranche_version();

CREATE OR REPLACE FUNCTION inserv.insert_bf_tranche_version()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

    DECLARE
        bfCountNum Integer;
    BEGIN
        IF (TG_OP = 'INSERT') THEN

            select count(1) into bfCountNum from backfeed.bf_tranche_version iv where iv.entity_id=new.entity_id
                 and ((iv.effective_from <= new.effective_from and iv.effective_to >= new.effective_to)
                 OR (iv.effective_from >= new.effective_from and iv.effective_to <= new.effective_to));

            IF ( bfCountNum >0) THEN

                delete from backfeed.bf_tranche_version iv where iv.entity_id=new.entity_id
                    and    ((iv.effective_from <= new.effective_from and iv.effective_to >= new.effective_to)
                    OR (iv.effective_from >= new.effective_from and iv.effective_to <= new.effective_to));
            END IF;

                insert into backfeed.bf_tranche_version select null, txid_current(), new.version_id, new.entity_id, new.instrument_id,
                    new.active_from, new.active_to,    new.effective_from, new.effective_to, new.effective_from_nacode,
                    new.effective_to_nacode, new.created, new.created_by, new.last_modified, new.last_modified_by, new.revision;
        ELSIF (TG_OP = 'UPDATE') THEN

            select count(1) into bfCountNum from backfeed.bf_tranche_version iv where iv.entity_id=new.entity_id
                 and ((iv.effective_from <= new.effective_from and iv.effective_to >= new.effective_to)
                 OR (iv.effective_from >= new.effective_from and iv.effective_to <= new.effective_to));

            IF ( bfCountNum = 0) THEN

                insert into backfeed.bf_tranche_version select null, txid_current(), new.version_id, new.entity_id, new.instrument_id,
                    new.active_from, new.active_to,    new.effective_from, new.effective_to, new.effective_from_nacode,
                    new.effective_to_nacode, new.created, new.created_by, new.last_modified, new.last_modified_by, new.revision;
            ELSE

                update backfeed.bf_tranche_version set xid = txid_current(), version_id = new.version_id, entity_id = new.entity_id, instrument_id = instrument_id,
                        active_from = new.active_from, active_to = new.active_to, effective_from = new.effective_from, effective_to = new.effective_to, effective_from_nacode = new.effective_from_nacode,
                        effective_to_nacode = new.effective_to_nacode, created = new.created, created_by = new.created_by, last_modified = new.last_modified, last_modified_by = new.last_modified_by, revision = new.revision
                where entity_id=new.entity_id and ((effective_from <= new.effective_from and effective_to >= new.effective_to)
                      OR (effective_from >= new.effective_from and effective_to <= new.effective_to));
            END IF;
       END IF;
      RETURN null;
    END;

$BODY$;

ALTER FUNCTION inserv.insert_bf_tranche_version()
    OWNER TO myna;


-- Trigger: trg_bf_tranche_version

DROP TRIGGER IF EXISTS trg_bf_tranche_version ON inserv.tranche_version;
CREATE TRIGGER trg_bf_tranche_version
    AFTER INSERT OR UPDATE
    ON inserv.tranche_version
    FOR EACH ROW
    EXECUTE PROCEDURE inserv.insert_bf_tranche_version();


-- FUNCTION: inserv.insert_bf_undly_version()

-- DROP FUNCTION inserv.insert_bf_undly_version();

CREATE OR REPLACE FUNCTION inserv.insert_bf_undly_version()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

    DECLARE
        bfCountNum Integer;
    BEGIN
        IF (TG_OP = 'INSERT') THEN

            select count(1) into bfCountNum from backfeed.bf_underlying_version iv where iv.entity_id=new.entity_id
                 and ((iv.effective_from <= new.effective_from and iv.effective_to >= new.effective_to)
                 OR (iv.effective_from >= new.effective_from and iv.effective_to <= new.effective_to));

            IF ( bfCountNum >0) THEN

                delete from backfeed.bf_underlying_version iv where iv.entity_id=new.entity_id
                    and    ((iv.effective_from <= new.effective_from and iv.effective_to >= new.effective_to)
                    OR (iv.effective_from >= new.effective_from and iv.effective_to <= new.effective_to));
            END IF;

            insert into backfeed.bf_underlying_version select null, txid_current(), new.version_id, new.entity_id, new.composite_type, new.derivative_instrument_id,
                new.underlying_instrument_id, new.composite_id, new.active_from, new.active_to,    new.effective_from, new.effective_to, new.effective_from_nacode,
                new.effective_to_nacode, new.created, new.created_by, new.last_modified, new.last_modified_by, new.revision;

        ELSIF (TG_OP = 'UPDATE') THEN

            select count(1) into bfCountNum from backfeed.bf_underlying_version iv where iv.entity_id=new.entity_id
                 and ((iv.effective_from <= new.effective_from and iv.effective_to >= new.effective_to)
                 OR (iv.effective_from >= new.effective_from and iv.effective_to <= new.effective_to));

            IF ( bfCountNum = 0) THEN

                insert into backfeed.bf_underlying_version select null, txid_current(), new.version_id, new.entity_id, new.composite_type, new.derivative_instrument_id,
                    new.underlying_instrument_id, new.composite_id, new.active_from, new.active_to,    new.effective_from, new.effective_to, new.effective_from_nacode,
                    new.effective_to_nacode, new.created, new.created_by, new.last_modified, new.last_modified_by, new.revision;

            ELSE

                update backfeed.bf_underlying_version set xid = txid_current(), version_id = new.version_id, entity_id = new.entity_id, composite_type = new.composite_type, derivative_instrument_id = new.derivative_instrument_id,
                    underlying_instrument_id = new.underlying_instrument_id, active_from = new.active_from, active_to = new.active_to, effective_from = new.effective_from, effective_to = new.effective_to, effective_from_nacode = new.effective_from_nacode,
                    effective_to_nacode = new.effective_to_nacode, created = new.created, created_by = new.created_by, last_modified = new.last_modified, last_modified_by = new.last_modified_by, revision = new.revision
                where entity_id=new.entity_id and ((effective_from <= new.effective_from and effective_to >= new.effective_to)
                      OR (effective_from >= new.effective_from and effective_to <= new.effective_to));
            END IF;
       END IF;
      RETURN null;
    END;

$BODY$;

ALTER FUNCTION inserv.insert_bf_undly_version()
    OWNER TO myna;

-- Trigger: trg_bf_undly_version

DROP TRIGGER IF EXISTS trg_bf_undly_version ON inserv.underlying_version;
CREATE TRIGGER trg_bf_undly_version
    AFTER INSERT OR UPDATE
    ON inserv.underlying_version
    FOR EACH ROW
    EXECUTE PROCEDURE inserv.insert_bf_undly_version();


-- FUNCTION: inserv.insert_bf_undy_attribute_version()

-- DROP FUNCTION inserv.insert_bf_undy_attribute_version();

CREATE OR REPLACE FUNCTION inserv.insert_bf_undy_attribute_version()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

    DECLARE
        insCountNum Integer;
        bfCountNum Integer;
        existResolveNum Integer;
    BEGIN
        IF (TG_OP = 'INSERT') THEN
            IF( new.attribute_type = 'AdminState') THEN
               IF ( to_char(new.effective_to,'YYYY') = '9999') THEN

                    INSERT INTO backfeed.bf_underlying_attribute_version SELECT null,txid_current(),new.version_id, new.entity_id, new.attribute_id, new.attribute_definition_id, new.language_id,
                        new.attribute_type, new.payload, new.description, new.active_from, new.active_to, new.effective_from,
                        new.effective_to, new.effective_from_nacode, new.effective_to_nacode, new.created, new.created_by,
                        new.last_modified, new.last_modified_by, new.revision;
               END IF;
            ELSE

                select count(1) into bfCountNum from backfeed.bf_underlying_attribute_version iv where iv.entity_id=new.entity_id
                    and iv.attribute_definition_id=new.attribute_definition_id and
                    ((iv.effective_from <= new.effective_from and iv.effective_to >= new.effective_to)
                    OR (iv.effective_from >= new.effective_from and iv.effective_to <= new.effective_to));

                IF ( bfCountNum >0) THEN

                    delete from backfeed.bf_underlying_attribute_version iv where iv.entity_id=new.entity_id
                        and iv.attribute_definition_id=new.attribute_definition_id and
                        ((iv.effective_from <= new.effective_from and iv.effective_to >= new.effective_to)
                        OR (iv.effective_from >= new.effective_from and iv.effective_to <= new.effective_to));
                END IF;

                INSERT INTO backfeed.bf_underlying_attribute_version SELECT null,txid_current(),new.version_id, new.entity_id, new.attribute_id, new.attribute_definition_id, new.language_id,
                    new.attribute_type, new.payload, new.description, new.active_from, new.active_to, new.effective_from,
                    new.effective_to, new.effective_from_nacode, new.effective_to_nacode, new.created, new.created_by,
                    new.last_modified, new.last_modified_by, new.revision;
            END IF;
        -- Data is modified only when deleted
        ELSIF (TG_OP = 'UPDATE') THEN

            select count(1) into bfCountNum from backfeed.bf_underlying_attribute_version iv where iv.entity_id=new.entity_id
                and iv.attribute_definition_id=new.attribute_definition_id and
                ((iv.effective_from <= new.effective_from and iv.effective_to >= new.effective_to)
                OR (iv.effective_from >= new.effective_from and iv.effective_to <= new.effective_to));

            IF( new.attribute_type = 'AdminState' AND bfCountNum > 0) THEN

                delete from backfeed.bf_underlying_attribute_version where iv.entity_id=new.entity_id
                    and iv.attribute_definition_id=new.attribute_definition_id and
                    ((iv.effective_from <= new.effective_from and iv.effective_to >= new.effective_to)
                    OR (iv.effective_from >= new.effective_from and iv.effective_to <= new.effective_to));
            ELSE

                IF ( bfCountNum = 0) THEN --the operation of delete

                    INSERT INTO backfeed.bf_underlying_attribute_version SELECT null,txid_current(),new.version_id, new.entity_id, new.attribute_id, new.attribute_definition_id, new.language_id,
                        new.attribute_type, new.payload, new.description, new.active_from, new.active_to, new.effective_from,
                        new.effective_to, new.effective_from_nacode, new.effective_to_nacode, new.created, new.created_by,
                        new.last_modified, new.last_modified_by, new.revision;
                ELSE -- the operation of update

                    UPDATE backfeed.bf_underlying_attribute_version SET xid = txid_current(), version_id = new.version_id, entity_id = new.entity_id, attribute_id = new.attribute_id, attribute_definition_id = new.attribute_definition_id, language_id = new.language_id,
                        attribute_type = new.attribute_type, payload = new.payload, description = new.description, active_from = new.active_from, active_to = new.active_to, effective_from = new.effective_from,
                        effective_to = new.effective_to, effective_from_nacode = new.effective_from_nacode, effective_to_nacode = new.effective_to_nacode, created = new.created, created_by = new.created_by,
                        last_modified = new.last_modified, last_modified_by = new.last_modified_by, revision = new.revision
                    where entity_id=new.entity_id and attribute_definition_id=new.attribute_definition_id and
                         ((effective_from <= new.effective_from and effective_to >= new.effective_to)
                         OR (effective_from >= new.effective_from and effective_to <= new.effective_to));
                END IF;
            END IF;
        END IF;
        RETURN NULL;
    END;

$BODY$;

ALTER FUNCTION inserv.insert_bf_undy_attribute_version()
    OWNER TO myna;


-- Trigger: trg_bf_undy_attribute_version

DROP TRIGGER IF EXISTS trg_bf_undy_attribute_version ON inserv.underlying_attribute_version;
CREATE TRIGGER trg_bf_undy_attribute_version
    AFTER INSERT OR UPDATE
    ON inserv.underlying_attribute_version
    FOR EACH ROW
    EXECUTE PROCEDURE inserv.insert_bf_undy_attribute_version();
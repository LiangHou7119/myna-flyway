/**
 *
 */

--DROP SCHEMA IF EXISTS backfeed CASCADE;

--CREATE SCHEMA IF NOT EXISTS backfeed AUTHORIZATION myna;
COMMENT ON SCHEMA backfeed IS 'Schema for Warrant backfeed to NDA';

CREATE SEQUENCE backfeed.seq_bf_ins_ver_id increment by 1 minvalue 200000 no maxvalue start with 200001;
CREATE SEQUENCE backfeed.seq_bf_ins_atr_ver_id increment by 1 minvalue 200000 no maxvalue start with 200001;
CREATE SEQUENCE backfeed.seq_bf_und_ver_id increment by 1 minvalue 200000 no maxvalue start with 200001;
CREATE SEQUENCE backfeed.seq_bf_und_atr_ver_id increment by 1 minvalue 200000 no maxvalue start with 200001;
CREATE SEQUENCE backfeed.seq_bf_tra_ver_id increment by 1 minvalue 200000 no maxvalue start with 200001;
CREATE SEQUENCE backfeed.seq_bf_tra_atr_ver_id increment by 1 minvalue 200000 no maxvalue start with 200001;

CREATE SEQUENCE backfeed.seq_bf_atr_map_id increment by 1 minvalue 200000 no maxvalue start with 200001;
CREATE SEQUENCE backfeed.seq_bf_mtd_nda_map_id increment by 1 minvalue 200000 no maxvalue start with 200001;

CREATE SEQUENCE backfeed.seq_bf_aws_rpc_nda_id increment by 1 minvalue 200000 no maxvalue start with 200001;
CREATE SEQUENCE backfeed.seq_blk_feed_start_point_id increment by 1 minvalue 200000 no maxvalue start with 200001;
CREATE SEQUENCE backfeed.seq_iqm_nav_log_id increment by 1 minvalue 200000 no maxvalue start with 200001;
CREATE SEQUENCE backfeed.seq_blk_feed_file_status_id increment by 1 minvalue 200000 no maxvalue start with 200001;
CREATE SEQUENCE backfeed.seq_rep_blk_file_status_id increment by 1 minvalue 200000 no maxvalue start with 200001;




CREATE TABLE backfeed.bf_instrument_version
(
   id                      bigint        NOT NULL PRIMARY KEY DEFAULT nextval('backfeed.seq_bf_ins_ver_id'),
   xid                     bigint        NOT NULL,
   version_id              bigint        NOT NULL,
   entity_id               bigint        NOT NULL,
   is_stub                 boolean       NOT NULL,
   is_quotable             boolean       NOT NULL,
   active_from             timestamp     NOT NULL,
   active_to               timestamp     NOT NULL,
   effective_from          timestamp     NOT NULL,
   effective_to            timestamp     NOT NULL,
   effective_from_nacode   varchar(20),
   effective_to_nacode     varchar(20),
   created                 timestamp     NOT NULL,
   created_by              varchar(80)   NOT NULL,
   last_modified           timestamp     NOT NULL,
   last_modified_by        varchar(80)   NOT NULL,
   revision                bigint
);

comment on table backfeed.bf_instrument_version is 'This table stores all the in-scope warrant change data from inserv.instrument_version';
comment on column backfeed.bf_instrument_version.id is 'ID of the record';
comment on column backfeed.bf_instrument_version.xid is 'DB Trasaction ID';

-- Create index
create index idx_bf_iv_ent on backfeed.bf_instrument_version(entity_id);

CREATE TABLE backfeed.bf_instrument_version_current
(
   id                      bigint        NOT NULL PRIMARY KEY,
   xid                     bigint        NOT NULL,
   action                  varchar(20)   NOT NULL,
   status                  character(1)  NOT NULL DEFAULT 'I',
   version_id              bigint        NOT NULL,
   entity_id               bigint        NOT NULL,
   is_stub                 boolean       NOT NULL,
   is_quotable             boolean       NOT NULL,
   active_from             timestamp     NOT NULL,
   active_to               timestamp     NOT NULL,
   effective_from          timestamp     NOT NULL,
   effective_to            timestamp     NOT NULL,
   effective_from_nacode   varchar(20),
   effective_to_nacode     varchar(20),
   created                 timestamp     NOT NULL,
   created_by              varchar(80)   NOT NULL,
   last_modified           timestamp     NOT NULL,
   last_modified_by        varchar(80)   NOT NULL,
   revision                bigint

);
comment on table backfeed.bf_instrument_version_current is 'This table stores all valid in-scope warrant  change data which will be backed feed to NDA' ;
comment on column backfeed.bf_instrument_version_current.id is 'ID of the record';
comment on column backfeed.bf_instrument_version_current.xid is 'DB Trasaction ID';
comment on column backfeed.bf_instrument_version_current.action is 'Business action for the data backfeed to NDA';
comment on column backfeed.bf_instrument_version_current.status is 'Record process status, default "I" ';

-- Create index idx_bf_ins_ver_cur
create index idx_bf_ivc_ent on backfeed.bf_instrument_version_current(entity_id);


CREATE TABLE backfeed.bf_instrument_version_future
(
   id                      bigint        NOT NULL PRIMARY KEY,
   xid                     bigint        NOT NULL,
   action                  varchar(20)   NOT NULL,
   status                  character(1)  NOT NULL DEFAULT 'I',
   version_id              bigint        NOT NULL,
   entity_id               bigint        NOT NULL,
   is_stub                 boolean       NOT NULL,
   is_quotable             boolean       NOT NULL,
   active_from             timestamp     NOT NULL,
   active_to               timestamp     NOT NULL,
   effective_from          timestamp     NOT NULL,
   effective_to            timestamp     NOT NULL,
   effective_from_nacode   varchar(20),
   effective_to_nacode     varchar(20),
   created                 timestamp     NOT NULL,
   created_by              varchar(80)   NOT NULL,
   last_modified           timestamp     NOT NULL,
   last_modified_by        varchar(80)   NOT NULL,
   revision                bigint
);
comment on table backfeed.bf_instrument_version_future is 'This table stores all in-scope warrant change data which will be backed feed to NDA in the future' ;
comment on column backfeed.bf_instrument_version_future.id is 'ID of the record';
comment on column backfeed.bf_instrument_version_future.xid is 'DB Trasaction ID';
comment on column backfeed.bf_instrument_version_future.action is 'Business action for the data backfeed to NDA';
comment on column backfeed.bf_instrument_version_future.status is 'Record process status, default "I" ';

-- Create index idx_bf_ivf_ent
create index idx_bf_ivf_ent on backfeed.bf_instrument_version_future(entity_id);


CREATE TABLE backfeed.bf_instrument_version_archive
(
   id                      bigint        NOT NULL PRIMARY KEY,
   xid                     bigint        NOT NULL,
   action                  varchar(20)   NOT NULL,
   status                  character(1)  NOT NULL DEFAULT 'I',
   version_id              bigint        NOT NULL,
   entity_id               bigint        NOT NULL,
   is_stub                 boolean       NOT NULL,
   is_quotable             boolean       NOT NULL,
   active_from             timestamp     NOT NULL,
   active_to               timestamp     NOT NULL,
   effective_from          timestamp     NOT NULL,
   effective_to            timestamp     NOT NULL,
   effective_from_nacode   varchar(20),
   effective_to_nacode     varchar(20),
   created                 timestamp     NOT NULL,
   created_by              varchar(80)   NOT NULL,
   last_modified           timestamp     NOT NULL,
   last_modified_by        varchar(80)   NOT NULL,
   revision                bigint,
   result_desc             varchar(500)
);
comment on table backfeed.bf_instrument_version_archive is 'This table stores all processed in-scope warrant change data which will be backed feed to NDA' ;
comment on column backfeed.bf_instrument_version_archive.id is 'ID of the record';
comment on column backfeed.bf_instrument_version_archive.xid is 'DB Trasaction ID';
comment on column backfeed.bf_instrument_version_archive.action is 'Business action for the data backfeed to NDA';
comment on column backfeed.bf_instrument_version_archive.status is 'Record process status, default "I" ';
comment on column backfeed.bf_instrument_version_archive.result_desc is 'Data process result description from NDA';

-- Create index idx_bf_iva_ent
create index idx_bf_iva_ent on backfeed.bf_instrument_version_archive(entity_id);




-- Create staging tables for the instrument_attribute_version
CREATE TABLE backfeed.bf_instrument_attribute_version
(
   id                       bigint              NOT NULL PRIMARY KEY DEFAULT nextval('backfeed.seq_bf_ins_atr_ver_id'),
   xid                      bigint              NOT NULL,
   version_id               bigint              NOT NULL,
   entity_id                bigint              NOT NULL,
   attribute_id             bigint              NOT NULL,
   attribute_definition_id  bigint              NOT NULL,
   language_id              bigint,
   attribute_type           varchar(80)         NOT NULL,
   payload                  varchar(1048576)    NOT NULL,
   description              varchar(1048576),
   active_from              timestamp           NOT NULL,
   active_to                timestamp           NOT NULL,
   effective_from           timestamp           NOT NULL,
   effective_to             timestamp           NOT NULL,
   effective_from_nacode    varchar(20),
   effective_to_nacode      varchar(20),
   created                  timestamp           NOT NULL,
   created_by               varchar(80)         NOT NULL,
   last_modified            timestamp           NOT NULL,
   last_modified_by         varchar(80)         NOT NULL,
   revision                 bigint
);

comment on table backfeed.bf_instrument_attribute_version is 'This table stores all the in-scope warrant attribute change data from inserv.instrument_attribute_version';
comment on column backfeed.bf_instrument_attribute_version.id is 'ID of the record';
comment on column backfeed.bf_instrument_attribute_version.xid is 'DB Trasaction ID';

-- Create index
create index idx_bf_iav_ent on backfeed.bf_instrument_attribute_version(entity_id);
create index idx_bf_iav_ent_att on backfeed.bf_instrument_attribute_version(entity_id,attribute_definition_id);

CREATE TABLE backfeed.bf_instrument_attribute_version_current
(
   id                       bigint              NOT NULL PRIMARY KEY,
   xid                      bigint              NOT NULL,
   action                   varchar(20)         NOT NULL,
   status                   character(1)  		NOT NULL DEFAULT 'I',
   version_id               bigint              NOT NULL,
   entity_id                bigint              NOT NULL,
   attribute_id             bigint              NOT NULL,
   attribute_definition_id  bigint              NOT NULL,
   language_id              bigint,
   attribute_type           varchar(80)         NOT NULL,
   payload                  varchar(1048576)    NOT NULL,
   description              varchar(1048576),
   active_from              timestamp           NOT NULL,
   active_to                timestamp           NOT NULL,
   effective_from           timestamp           NOT NULL,
   effective_to             timestamp           NOT NULL,
   effective_from_nacode    varchar(20),
   effective_to_nacode      varchar(20),
   created                  timestamp           NOT NULL,
   created_by               varchar(80)         NOT NULL,
   last_modified            timestamp           NOT NULL,
   last_modified_by         varchar(80)         NOT NULL,
   revision                 bigint
);
comment on table backfeed.bf_instrument_attribute_version_current is 'This table stores all valid in-scope warrant attribute change data which will be backed feed to NDA' ;
comment on column backfeed.bf_instrument_attribute_version_current.id is 'ID of the record';
comment on column backfeed.bf_instrument_attribute_version_current.xid is 'DB Trasaction ID';
comment on column backfeed.bf_instrument_attribute_version_current.action is 'Business action for the data backfeed to NDA';
comment on column backfeed.bf_instrument_attribute_version_current.status is 'Record process status, default "I" ';

-- Create index
create index idx_bf_iavc_ent on backfeed.bf_instrument_attribute_version_current(entity_id);
create index idx_bf_iavc_ent_att on backfeed.bf_instrument_attribute_version_current(entity_id,attribute_definition_id);


CREATE TABLE backfeed.bf_instrument_attribute_version_future
(
   id                       bigint              NOT NULL PRIMARY KEY,
   xid                      bigint              NOT NULL,
   action                   varchar(20)         NOT NULL,
   status                   character(1)  		NOT NULL DEFAULT 'I',
   version_id               bigint              NOT NULL,
   entity_id                bigint              NOT NULL,
   attribute_id             bigint              NOT NULL,
   attribute_definition_id  bigint              NOT NULL,
   language_id              bigint,
   attribute_type           varchar(80)         NOT NULL,
   payload                  varchar(1048576)    NOT NULL,
   description              varchar(1048576),
   active_from              timestamp           NOT NULL,
   active_to                timestamp           NOT NULL,
   effective_from           timestamp           NOT NULL,
   effective_to             timestamp           NOT NULL,
   effective_from_nacode    varchar(20),
   effective_to_nacode      varchar(20),
   created                  timestamp           NOT NULL,
   created_by               varchar(80)         NOT NULL,
   last_modified            timestamp           NOT NULL,
   last_modified_by         varchar(80)         NOT NULL,
   revision                 bigint
);
comment on table backfeed.bf_instrument_attribute_version_future is 'This table stores all in-scope warrant change data which will be backed feed to NDA in the future' ;
comment on column backfeed.bf_instrument_attribute_version_future.id is 'ID of the record';
comment on column backfeed.bf_instrument_attribute_version_future.xid is 'DB Trasaction ID';
comment on column backfeed.bf_instrument_attribute_version_future.action is 'Business action for the data backfeed to NDA';
comment on column backfeed.bf_instrument_attribute_version_future.status is 'Record process status, default "I" ';

-- Create index
create index idx_bf_iavf_ent on backfeed.bf_instrument_attribute_version_future(entity_id);
create index idx_bf_iavf_ent_att on backfeed.bf_instrument_attribute_version_future(entity_id,attribute_definition_id);


CREATE TABLE backfeed.bf_instrument_attribute_version_archive
(
   id                       bigint              NOT NULL PRIMARY KEY,
   xid                      bigint              NOT NULL,
   action                   varchar(20)         NOT NULL,
   status                   character(1)  		NOT NULL DEFAULT 'I',
   version_id               bigint              NOT NULL,
   entity_id                bigint              NOT NULL,
   attribute_id             bigint              NOT NULL,
   attribute_definition_id  bigint              NOT NULL,
   language_id              bigint,
   attribute_type           varchar(80)         NOT NULL,
   payload                  varchar(1048576)    NOT NULL,
   description              varchar(1048576),
   active_from              timestamp           NOT NULL,
   active_to                timestamp           NOT NULL,
   effective_from           timestamp           NOT NULL,
   effective_to             timestamp           NOT NULL,
   effective_from_nacode    varchar(20),
   effective_to_nacode      varchar(20),
   created                  timestamp           NOT NULL,
   created_by               varchar(80)         NOT NULL,
   last_modified            timestamp           NOT NULL,
   last_modified_by         varchar(80)         NOT NULL,
   revision                 bigint,
   result_desc              varchar(500)
);
comment on table backfeed.bf_instrument_attribute_version_archive is 'This table stores all in-scope warrant change data which will be backed feed to NDA in the future' ;
comment on column backfeed.bf_instrument_attribute_version_archive.id is 'ID of the record';
comment on column backfeed.bf_instrument_attribute_version_archive.xid is 'DB Trasaction ID';
comment on column backfeed.bf_instrument_attribute_version_archive.action is 'Business action for the data backfeed to NDA';
comment on column backfeed.bf_instrument_attribute_version_archive.status is 'Record process status, default "I" ';
comment on column backfeed.bf_instrument_attribute_version_archive.result_desc is 'Data process result description from NDA';

-- Create index
create index idx_bf_iava_ent on backfeed.bf_instrument_attribute_version_archive(entity_id);
create index idx_bf_iava_ent_att on backfeed.bf_instrument_attribute_version_archive(entity_id,attribute_definition_id);


--Create staging tables for the underlying_version
CREATE TABLE backfeed.bf_underlying_version
(
   id                        bigint        NOT NULL PRIMARY KEY DEFAULT nextval('backfeed.seq_bf_und_ver_id'),
   xid                       bigint        NOT NULL,
   version_id                bigint        NOT NULL,
   entity_id                 bigint        NOT NULL,
   composite_type            varchar(80),
   derivative_instrument_id  bigint        NOT NULL,
   underlying_instrument_id  bigint,
   composite_id              bigint,
   active_from               timestamp     NOT NULL,
   active_to                 timestamp     NOT NULL,
   effective_from            timestamp     NOT NULL,
   effective_to              timestamp     NOT NULL,
   effective_from_nacode     varchar(20),
   effective_to_nacode       varchar(20),
   created                   timestamp     NOT NULL,
   created_by                varchar(80)   NOT NULL,
   last_modified             timestamp     NOT NULL,
   last_modified_by          varchar(80)   NOT NULL,
   revision                  bigint
);

comment on table backfeed.bf_underlying_version is 'This table stores all the in-scope warrant underlying change data from inserv.underlying_version';
comment on column backfeed.bf_underlying_version.id is 'ID of the record';
comment on column backfeed.bf_underlying_version.xid is 'DB Trasaction ID';

-- Create index
create index idx_bf_uv_ent on backfeed.bf_underlying_version(entity_id);


CREATE TABLE backfeed.bf_underlying_version_current
(
   id                        bigint        NOT NULL PRIMARY KEY,
   xid                       bigint        NOT NULL,
   action                    varchar(20)   NOT NULL,
   status                    character(1)  NOT NULL DEFAULT 'I',
   version_id                bigint        NOT NULL,
   entity_id                 bigint        NOT NULL,
   composite_type            varchar(80),
   derivative_instrument_id  bigint        NOT NULL,
   underlying_instrument_id  bigint,
   composite_id              bigint,
   active_from               timestamp     NOT NULL,
   active_to                 timestamp     NOT NULL,
   effective_from            timestamp     NOT NULL,
   effective_to              timestamp     NOT NULL,
   effective_from_nacode     varchar(20),
   effective_to_nacode       varchar(20),
   created                   timestamp     NOT NULL,
   created_by                varchar(80)   NOT NULL,
   last_modified             timestamp     NOT NULL,
   last_modified_by          varchar(80)   NOT NULL,
   revision                  bigint

);
comment on table backfeed.bf_underlying_version_current is 'This table stores all valid in-scope warrant underlying change data which will be backed feed to NDA' ;
comment on column backfeed.bf_underlying_version_current.id is 'ID of the record';
comment on column backfeed.bf_underlying_version_current.xid is 'DB Trasaction ID';
comment on column backfeed.bf_underlying_version_current.action is 'Business action for the data backfeed to NDA';
comment on column backfeed.bf_underlying_version_current.status is 'Record process status, default "I" ';

-- Create index idx_bf_ins_ver_cur
create index idx_bf_uvc_ent on backfeed.bf_underlying_version_current(entity_id);


CREATE TABLE backfeed.bf_underlying_version_future
(
   id                        bigint        NOT NULL PRIMARY KEY,
   xid                       bigint        NOT NULL,
   action                    varchar(20)   NOT NULL,
   status                    character(1)  NOT NULL DEFAULT 'I',
   version_id                bigint        NOT NULL,
   entity_id                 bigint        NOT NULL,
   composite_type            varchar(80),
   derivative_instrument_id  bigint        NOT NULL,
   underlying_instrument_id  bigint,
   composite_id              bigint,
   active_from               timestamp     NOT NULL,
   active_to                 timestamp     NOT NULL,
   effective_from            timestamp     NOT NULL,
   effective_to              timestamp     NOT NULL,
   effective_from_nacode     varchar(20),
   effective_to_nacode       varchar(20),
   created                   timestamp     NOT NULL,
   created_by                varchar(80)   NOT NULL,
   last_modified             timestamp     NOT NULL,
   last_modified_by          varchar(80)   NOT NULL,
   revision                  bigint
);
comment on table backfeed.bf_underlying_version_future is 'This table stores all in-scope warrant underlying change data which will be backed feed to NDA in the future' ;
comment on column backfeed.bf_underlying_version_future.id is 'ID of the record';
comment on column backfeed.bf_underlying_version_future.xid is 'DB Trasaction ID';
comment on column backfeed.bf_underlying_version_future.action is 'Business action for the data backfeed to NDA';
comment on column backfeed.bf_underlying_version_future.status is 'Record process status, default "I" ';

-- Create index idx_bf_ivf_fut
create index idx_bf_uvf_fut on backfeed.bf_underlying_version_future(entity_id);


CREATE TABLE backfeed.bf_underlying_version_archive
(
   id                        bigint        NOT NULL PRIMARY KEY,
   xid                       bigint        NOT NULL,
   action                    varchar(20)   NOT NULL,
   status                    character(1)  NOT NULL DEFAULT 'I',
   version_id                bigint        NOT NULL,
   entity_id                 bigint        NOT NULL,
   composite_type            varchar(80),
   derivative_instrument_id  bigint        NOT NULL,
   underlying_instrument_id  bigint,
   composite_id              bigint,
   active_from               timestamp     NOT NULL,
   active_to                 timestamp     NOT NULL,
   effective_from            timestamp     NOT NULL,
   effective_to              timestamp     NOT NULL,
   effective_from_nacode     varchar(20),
   effective_to_nacode       varchar(20),
   created                   timestamp     NOT NULL,
   created_by                varchar(80)   NOT NULL,
   last_modified             timestamp     NOT NULL,
   last_modified_by          varchar(80)   NOT NULL,
   revision                  bigint,
   result_desc               varchar(500)
);
comment on table backfeed.bf_underlying_version_archive is 'This table stores all processed in-scope warrant underlying change data which backfeed to NDA' ;
comment on column backfeed.bf_underlying_version_archive.id is 'ID of the record';
comment on column backfeed.bf_underlying_version_archive.xid is 'DB Trasaction ID';
comment on column backfeed.bf_underlying_version_archive.action is 'Business action for the data backfeed to NDA';
comment on column backfeed.bf_underlying_version_archive.status is 'Record process status, default "I" ';
comment on column backfeed.bf_underlying_version_archive.result_desc is 'Data process result description from NDA';

-- Create index idx_bf_iva_ver_arc
create index idx_bf_uva_ver_arc on backfeed.bf_underlying_version_archive(entity_id);



-- Create staging tables for the underlying_attribute_version
CREATE TABLE backfeed.bf_underlying_attribute_version
(
   id                       bigint              NOT NULL PRIMARY KEY DEFAULT nextval('backfeed.seq_bf_und_atr_ver_id'),
   xid                      bigint              NOT NULL,
   version_id               bigint              NOT NULL,
   entity_id                bigint              NOT NULL,
   attribute_id             bigint              NOT NULL,
   attribute_definition_id  bigint              NOT NULL,
   language_id              bigint,
   attribute_type           varchar(80)         NOT NULL,
   payload                  varchar(1048576)    NOT NULL,
   description              varchar(1048576),
   active_from              timestamp           NOT NULL,
   active_to                timestamp           NOT NULL,
   effective_from           timestamp           NOT NULL,
   effective_to             timestamp           NOT NULL,
   effective_from_nacode    varchar(20),
   effective_to_nacode      varchar(20),
   created                  timestamp           NOT NULL,
   created_by               varchar(80)         NOT NULL,
   last_modified            timestamp           NOT NULL,
   last_modified_by         varchar(80)         NOT NULL,
   revision                 bigint
);

comment on table backfeed.bf_underlying_attribute_version is 'This table stores all the in-scope warrant underlying attribute change data from inserv.underlying_attribute_version';
comment on column backfeed.bf_underlying_attribute_version.id is 'ID of the record';
comment on column backfeed.bf_underlying_attribute_version.xid is 'DB Trasaction ID';

-- Create index
create index idx_bf_uav_ent on backfeed.bf_underlying_attribute_version(entity_id);
create index idx_bf_uav_ent_att on backfeed.bf_underlying_attribute_version(entity_id,attribute_definition_id);

CREATE TABLE backfeed.bf_underlying_attribute_version_current
(
   id                       bigint              NOT NULL PRIMARY KEY,
   xid                      bigint              NOT NULL,
   action                   varchar(20)         NOT NULL,
   status                   character(1)  		NOT NULL DEFAULT 'I',
   version_id               bigint              NOT NULL,
   entity_id                bigint              NOT NULL,
   attribute_id             bigint              NOT NULL,
   attribute_definition_id  bigint              NOT NULL,
   language_id              bigint,
   attribute_type           varchar(80)         NOT NULL,
   payload                  varchar(1048576)    NOT NULL,
   description              varchar(1048576),
   active_from              timestamp           NOT NULL,
   active_to                timestamp           NOT NULL,
   effective_from           timestamp           NOT NULL,
   effective_to             timestamp           NOT NULL,
   effective_from_nacode    varchar(20),
   effective_to_nacode      varchar(20),
   created                  timestamp           NOT NULL,
   created_by               varchar(80)         NOT NULL,
   last_modified            timestamp           NOT NULL,
   last_modified_by         varchar(80)         NOT NULL,
   revision                 bigint

);
comment on table backfeed.bf_underlying_attribute_version_current is 'This table stores in-scope warrant underlying attribute change data which will be backed feed to NDA' ;
comment on column backfeed.bf_underlying_attribute_version_current.id is 'ID of the record';
comment on column backfeed.bf_underlying_attribute_version_current.xid is 'DB Trasaction ID';
comment on column backfeed.bf_underlying_attribute_version_current.action is 'Business action for the data backfeed to NDA';
comment on column backfeed.bf_underlying_attribute_version_current.status is 'Record process status, default "I" ';

-- Create index
create index idx_bf_uavc_ent on backfeed.bf_underlying_attribute_version_current(entity_id);
create index idx_bf_uavc_ent_att on backfeed.bf_underlying_attribute_version_current(entity_id,attribute_definition_id);


CREATE TABLE backfeed.bf_underlying_attribute_version_future
(
   id                       bigint              NOT NULL PRIMARY KEY,
   xid                      bigint              NOT NULL,
   action                   varchar(20)         NOT NULL,
   status                   character(1)  		NOT NULL DEFAULT 'I',
   version_id               bigint              NOT NULL,
   entity_id                bigint              NOT NULL,
   attribute_id             bigint              NOT NULL,
   attribute_definition_id  bigint              NOT NULL,
   language_id              bigint,
   attribute_type           varchar(80)         NOT NULL,
   payload                  varchar(1048576)    NOT NULL,
   description              varchar(1048576),
   active_from              timestamp           NOT NULL,
   active_to                timestamp           NOT NULL,
   effective_from           timestamp           NOT NULL,
   effective_to             timestamp           NOT NULL,
   effective_from_nacode    varchar(20),
   effective_to_nacode      varchar(20),
   created                  timestamp           NOT NULL,
   created_by               varchar(80)         NOT NULL,
   last_modified            timestamp           NOT NULL,
   last_modified_by         varchar(80)         NOT NULL,
   revision                 bigint
);
comment on table backfeed.bf_underlying_attribute_version_future is 'This table stores in-scope warrant underlying attribute change data which will be backed feed to NDA in the future' ;
comment on column backfeed.bf_underlying_attribute_version_future.id is 'ID of the record';
comment on column backfeed.bf_underlying_attribute_version_future.xid is 'DB Trasaction ID';
comment on column backfeed.bf_underlying_attribute_version_future.action is 'Business action for the data backfeed to NDA';
comment on column backfeed.bf_underlying_attribute_version_future.status is 'Record process status, default "I" ';

-- Create index
create index idx_bf_uavf_ent on backfeed.bf_underlying_attribute_version_future(entity_id);
create index idx_bf_uavf_ent_att on backfeed.bf_underlying_attribute_version_future(entity_id,attribute_definition_id);


CREATE TABLE backfeed.bf_underlying_attribute_version_archive
(
   id                       bigint              NOT NULL PRIMARY KEY,
   xid                      bigint              NOT NULL,
   action                   varchar(20)         NOT NULL,
   status                   character(1)  		NOT NULL DEFAULT 'I',
   version_id               bigint              NOT NULL,
   entity_id                bigint              NOT NULL,
   attribute_id             bigint              NOT NULL,
   attribute_definition_id  bigint              NOT NULL,
   language_id              bigint,
   attribute_type           varchar(80)         NOT NULL,
   payload                  varchar(1048576)    NOT NULL,
   description              varchar(1048576),
   active_from              timestamp           NOT NULL,
   active_to                timestamp           NOT NULL,
   effective_from           timestamp           NOT NULL,
   effective_to             timestamp           NOT NULL,
   effective_from_nacode    varchar(20),
   effective_to_nacode      varchar(20),
   created                  timestamp           NOT NULL,
   created_by               varchar(80)         NOT NULL,
   last_modified            timestamp           NOT NULL,
   last_modified_by         varchar(80)         NOT NULL,
   revision                 bigint,
   result_desc              varchar(500)
);
comment on table backfeed.bf_underlying_attribute_version_archive is 'This table stores all processed in-scope warrant underling change data which backfeed to NDA' ;
comment on column backfeed.bf_underlying_attribute_version_archive.id is 'ID of the record';
comment on column backfeed.bf_underlying_attribute_version_archive.xid is 'DB Trasaction ID';
comment on column backfeed.bf_underlying_attribute_version_archive.action is 'Business action for the data backfeed to NDA';
comment on column backfeed.bf_underlying_attribute_version_archive.status is 'Record process status, default "I" ';
comment on column backfeed.bf_underlying_attribute_version_archive.result_desc is 'Data process result description from NDA';

-- Create index
create index idx_bf_uava_ent on backfeed.bf_underlying_attribute_version_archive(entity_id);
create index idx_bf_uava_ent_att on backfeed.bf_underlying_attribute_version_archive(entity_id,attribute_definition_id);



-- Create staging tables for  tranche_version
CREATE TABLE backfeed.bf_tranche_version
(
   id                      bigint        NOT NULL PRIMARY KEY DEFAULT nextval('backfeed.seq_bf_tra_ver_id'),
   xid                     bigint        NOT NULL,
   version_id              bigint        NOT NULL,
   entity_id               bigint        NOT NULL,
   instrument_id           bigint        NOT NULL,
   active_from             timestamp     NOT NULL,
   active_to               timestamp     NOT NULL,
   effective_from          timestamp     NOT NULL,
   effective_to            timestamp     NOT NULL,
   effective_from_nacode   varchar(20),
   effective_to_nacode     varchar(20),
   created                 timestamp     NOT NULL,
   created_by              varchar(80)   NOT NULL,
   last_modified           timestamp     NOT NULL,
   last_modified_by        varchar(80)   NOT NULL,
   revision                bigint
);

comment on table backfeed.bf_tranche_version is 'This table stores all the in-scope warrant tranche change data from inserv.tranche_version';
comment on column backfeed.bf_tranche_version.id is 'ID of the record';
comment on column backfeed.bf_tranche_version.xid is 'DB Trasaction ID';

-- Create index
create index idx_bf_tv_ent on backfeed.bf_tranche_version(entity_id);

CREATE TABLE backfeed.bf_tranche_version_current
(
   id                      bigint        NOT NULL PRIMARY KEY,
   xid                     bigint        NOT NULL,
   action                  varchar(20)   NOT NULL,
   status                  character(1)  NOT NULL DEFAULT 'I',
   version_id              bigint        NOT NULL,
   entity_id               bigint        NOT NULL,
   instrument_id           bigint        NOT NULL,
   active_from             timestamp     NOT NULL,
   active_to               timestamp     NOT NULL,
   effective_from          timestamp     NOT NULL,
   effective_to            timestamp     NOT NULL,
   effective_from_nacode   varchar(20),
   effective_to_nacode     varchar(20),
   created                 timestamp     NOT NULL,
   created_by              varchar(80)   NOT NULL,
   last_modified           timestamp     NOT NULL,
   last_modified_by        varchar(80)   NOT NULL,
   revision                bigint
);
comment on table backfeed.bf_tranche_version_current is 'This table stores all valid in-scope warrant tranche change data which will be backed feed to NDA' ;
comment on column backfeed.bf_tranche_version_current.id is 'ID of the record';
comment on column backfeed.bf_tranche_version_current.xid is 'DB Trasaction ID';
comment on column backfeed.bf_tranche_version_current.action is 'Business action for the data backfeed to NDA';
comment on column backfeed.bf_tranche_version_current.status is 'Record process status, default "I" ';

-- Create index idx_bf_tvc_ent
create index idx_bf_tvc_ent on backfeed.bf_tranche_version_current(entity_id);


CREATE TABLE backfeed.bf_tranche_version_future
(
   id                      bigint        NOT NULL PRIMARY KEY,
   xid                     bigint        NOT NULL,
   action                  varchar(20)   NOT NULL,
   status                  character(1)  NOT NULL DEFAULT 'I',
   version_id              bigint        NOT NULL,
   entity_id               bigint        NOT NULL,
   instrument_id           bigint        NOT NULL,
   active_from             timestamp     NOT NULL,
   active_to               timestamp     NOT NULL,
   effective_from          timestamp     NOT NULL,
   effective_to            timestamp     NOT NULL,
   effective_from_nacode   varchar(20),
   effective_to_nacode     varchar(20),
   created                 timestamp     NOT NULL,
   created_by              varchar(80)   NOT NULL,
   last_modified           timestamp     NOT NULL,
   last_modified_by        varchar(80)   NOT NULL,
   revision                bigint
);
comment on table backfeed.bf_tranche_version_future is 'This table stores all in-scope warrant tranche change data which will be backed feed to NDA in the future' ;
comment on column backfeed.bf_tranche_version_future.id is 'ID of the record';
comment on column backfeed.bf_tranche_version_future.xid is 'DB Trasaction ID';
comment on column backfeed.bf_tranche_version_future.action is 'Business action for the data backfeed to NDA';
comment on column backfeed.bf_tranche_version_future.status is 'Record process status, default "I" ';

-- Create index idx_bf_tvf_ent
create index idx_bf_tvf_ent on backfeed.bf_tranche_version_future(entity_id);


CREATE TABLE backfeed.bf_tranche_version_archive
(
   id                      bigint        NOT NULL PRIMARY KEY,
   xid                     bigint        NOT NULL,
   action                  varchar(20)   NOT NULL,
   status                  character(1)  NOT NULL DEFAULT 'I',
   version_id              bigint        NOT NULL,
   entity_id               bigint        NOT NULL,
   instrument_id           bigint        NOT NULL,
   active_from             timestamp     NOT NULL,
   active_to               timestamp     NOT NULL,
   effective_from          timestamp     NOT NULL,
   effective_to            timestamp     NOT NULL,
   effective_from_nacode   varchar(20),
   effective_to_nacode     varchar(20),
   created                 timestamp     NOT NULL,
   created_by              varchar(80)   NOT NULL,
   last_modified           timestamp     NOT NULL,
   last_modified_by        varchar(80)   NOT NULL,
   revision                bigint
);
comment on table backfeed.bf_tranche_version_archive is 'This table stores all processed in-scope warrant tranche change data which backfeed to NDA' ;
comment on column backfeed.bf_tranche_version_archive.id is 'ID of the record';
comment on column backfeed.bf_tranche_version_archive.xid is 'DB Trasaction ID';
comment on column backfeed.bf_tranche_version_archive.action is 'Business action for the data backfeed to NDA';
comment on column backfeed.bf_tranche_version_archive.status is 'Record process status, default "I" ';

-- Create index idx_bf_tva_ent
create index idx_bf_tva_ent on backfeed.bf_tranche_version_archive(entity_id);




-- Create staging tables for the tranche_attribute_version
CREATE TABLE backfeed.bf_tranche_attribute_version
(
   id                       bigint              NOT NULL PRIMARY KEY DEFAULT nextval('backfeed.seq_bf_tra_atr_ver_id'),
   xid                      bigint              NOT NULL,
   version_id               bigint              NOT NULL,
   entity_id                bigint              NOT NULL,
   attribute_id             bigint              NOT NULL,
   attribute_definition_id  bigint              NOT NULL,
   language_id              bigint,
   attribute_type           varchar(80)         NOT NULL,
   payload                  varchar(1048576)    NOT NULL,
   description              varchar(1048576),
   active_from              timestamp           NOT NULL,
   active_to                timestamp           NOT NULL,
   effective_from           timestamp           NOT NULL,
   effective_to             timestamp           NOT NULL,
   effective_from_nacode    varchar(20),
   effective_to_nacode      varchar(20),
   created                  timestamp           NOT NULL,
   created_by               varchar(80)         NOT NULL,
   last_modified            timestamp           NOT NULL,
   last_modified_by         varchar(80)         NOT NULL,
   revision                 bigint
);

comment on table backfeed.bf_tranche_attribute_version is 'This table stores all the in-scope warrant tranche attribute change data from inserv.tranche_attribute_version';
comment on column backfeed.bf_tranche_attribute_version.id is 'ID of the record';
comment on column backfeed.bf_tranche_attribute_version.xid is 'DB Trasaction ID';

-- Create index
create index idx_bf_tav_ent on backfeed.bf_tranche_attribute_version(entity_id);
create index idx_bf_tav_ent_att on backfeed.bf_tranche_attribute_version(entity_id,attribute_definition_id);

CREATE TABLE backfeed.bf_tranche_attribute_version_current
(
   id                       bigint              NOT NULL PRIMARY KEY,
   xid                      bigint              NOT NULL,
   action                   varchar(20)         NOT NULL,
   status                   character(1)  		NOT NULL DEFAULT 'I',
   version_id               bigint              NOT NULL,
   entity_id                bigint              NOT NULL,
   attribute_id             bigint              NOT NULL,
   attribute_definition_id  bigint              NOT NULL,
   language_id              bigint,
   attribute_type           varchar(80)         NOT NULL,
   payload                  varchar(1048576)    NOT NULL,
   description              varchar(1048576),
   active_from              timestamp           NOT NULL,
   active_to                timestamp           NOT NULL,
   effective_from           timestamp           NOT NULL,
   effective_to             timestamp           NOT NULL,
   effective_from_nacode    varchar(20),
   effective_to_nacode      varchar(20),
   created                  timestamp           NOT NULL,
   created_by               varchar(80)         NOT NULL,
   last_modified            timestamp           NOT NULL,
   last_modified_by         varchar(80)         NOT NULL,
   revision                 bigint

);
comment on table backfeed.bf_tranche_attribute_version_current is 'This table stores all valid in-scope warrant attribute change data which will be backed feed to NDA' ;
comment on column backfeed.bf_tranche_attribute_version_current.id is 'ID of the record';
comment on column backfeed.bf_tranche_attribute_version_current.xid is 'DB Trasaction ID';
comment on column backfeed.bf_tranche_attribute_version_current.action is 'Business action for the data backfeed to NDA';
comment on column backfeed.bf_tranche_attribute_version_current.status is 'Record process status, default "I" ';

-- Create index
create index idx_bf_tavc_ent on backfeed.bf_tranche_attribute_version_current(entity_id);
create index idx_bf_tavc_ent_att on backfeed.bf_tranche_attribute_version_current(entity_id,attribute_definition_id);


CREATE TABLE backfeed.bf_tranche_attribute_version_future
(
   id                       bigint              NOT NULL PRIMARY KEY,
   xid                      bigint              NOT NULL,
   action                   varchar(20)         NOT NULL,
   status                   character(1)  		NOT NULL DEFAULT 'I',
   version_id               bigint              NOT NULL,
   entity_id                bigint              NOT NULL,
   attribute_id             bigint              NOT NULL,
   attribute_definition_id  bigint              NOT NULL,
   language_id              bigint,
   attribute_type           varchar(80)         NOT NULL,
   payload                  varchar(1048576)    NOT NULL,
   description              varchar(1048576),
   active_from              timestamp           NOT NULL,
   active_to                timestamp           NOT NULL,
   effective_from           timestamp           NOT NULL,
   effective_to             timestamp           NOT NULL,
   effective_from_nacode    varchar(20),
   effective_to_nacode      varchar(20),
   created                  timestamp           NOT NULL,
   created_by               varchar(80)         NOT NULL,
   last_modified            timestamp           NOT NULL,
   last_modified_by         varchar(80)         NOT NULL,
   revision                 bigint
);
comment on table backfeed.bf_tranche_attribute_version_future is 'This table stores all in-scope warrant tranche change data which will be backed feed to NDA in the future' ;
comment on column backfeed.bf_tranche_attribute_version_future.id is 'ID of the record';
comment on column backfeed.bf_tranche_attribute_version_future.xid is 'DB Trasaction ID';
comment on column backfeed.bf_tranche_attribute_version_future.action is 'Business action for the data backfeed to NDA';
comment on column backfeed.bf_tranche_attribute_version_future.status is 'Record process status, default "I" ';

-- Create index
create index idx_bf_tavf_ent on backfeed.bf_tranche_attribute_version_future(entity_id);
create index idx_bf_tavf_ent_att on backfeed.bf_tranche_attribute_version_future(entity_id,attribute_definition_id);


CREATE TABLE backfeed.bf_tranche_attribute_version_archive
(
   id                       bigint              NOT NULL PRIMARY KEY,
   xid                      bigint              NOT NULL,
   action                   varchar(20)         NOT NULL,
   status                   character(1)  		NOT NULL DEFAULT 'I',
   version_id               bigint              NOT NULL,
   entity_id                bigint              NOT NULL,
   attribute_id             bigint              NOT NULL,
   attribute_definition_id  bigint              NOT NULL,
   language_id              bigint,
   attribute_type           varchar(80)         NOT NULL,
   payload                  varchar(1048576)    NOT NULL,
   description              varchar(1048576),
   active_from              timestamp           NOT NULL,
   active_to                timestamp           NOT NULL,
   effective_from           timestamp           NOT NULL,
   effective_to             timestamp           NOT NULL,
   effective_from_nacode    varchar(20),
   effective_to_nacode      varchar(20),
   created                  timestamp           NOT NULL,
   created_by               varchar(80)         NOT NULL,
   last_modified            timestamp           NOT NULL,
   last_modified_by         varchar(80)         NOT NULL,
   revision                 bigint,
   result_desc              varchar(500)
);
comment on table backfeed.bf_tranche_attribute_version_archive is 'This table stores all processed in-scope warrant tranche change data which backfeed to NDA' ;
comment on column backfeed.bf_tranche_attribute_version_archive.id is 'ID of the record';
comment on column backfeed.bf_tranche_attribute_version_archive.xid is 'DB Trasaction ID';
comment on column backfeed.bf_tranche_attribute_version_archive.action is 'Business action for the data backfeed to NDA';
comment on column backfeed.bf_tranche_attribute_version_archive.status is 'Record process status, default "I" ';
comment on column backfeed.bf_tranche_attribute_version_archive.result_desc is 'Data process result description from NDA';

-- Create index
create index idx_bf_tava_ent on backfeed.bf_tranche_attribute_version_archive(entity_id);
create index idx_bf_tava_ent_att on backfeed.bf_tranche_attribute_version_archive(entity_id,attribute_definition_id);


CREATE TABLE backfeed.bf_attribute_mapping
(
   id                       bigint              NOT NULL PRIMARY KEY DEFAULT NEXTVAL('backfeed.seq_bf_atr_map_id'),
   warrant_attribute_id     bigint              NOT NULL,
   warrant_attribute_name   varchar(100)        NOT NULL,
   nda_property_nda_id      bigint              NOT NULL,
   nda_property_name        varchar(100)        NOT NULL,
   transformation_rule      varchar(100),
   enable                   boolean             NOT NULL DEFAULT 'false'
);
comment on table backfeed.bf_attribute_mapping is 'This table stores warrant attributes mappig to NDA property and falg to indicate the attribute would be backed feed to NDA or not';
comment on column backfeed.bf_attribute_mapping.warrant_attribute_id is 'Defined Myna warrant attribute id';
comment on column backfeed.bf_attribute_mapping.warrant_attribute_name is 'Defined Myna warrant attribute name';
comment on column backfeed.bf_attribute_mapping.nda_property_nda_id is 'The NDA BDM property nda_id';
comment on column backfeed.bf_attribute_mapping.nda_property_name is 'The NDA BDM property name';
comment on column backfeed.bf_attribute_mapping.transformation_rule is 'The rule to transform the warrant attribute to NDA property';
comment on column backfeed.bf_attribute_mapping.enable is 'The flag to indicate a warrant attribute would be backfeed to NDA or not';

create index idx_bf_atr_map_wai on backfeed.bf_attribute_mapping(warrant_attribute_id);


CREATE TABLE backfeed.bf_metadata_ndacla_mapping
(
   id                       bigint              NOT NULL PRIMARY KEY DEFAULT NEXTVAL('backfeed.seq_bf_atr_map_id'),
   metadata_perm_id         bigint              NOT NULL,
   metadata_value           varchar(100)        NOT NULL,
   --nda_cla_nda_id           bigint              NOT NULL,
   nda_cla_value            varchar(100)        NOT NULL,
   nda_cla_meaning          varchar(200),
   nda_cla_schema           varchar(100)
);
comment on table backfeed.bf_metadata_ndacla_mapping is 'This table stores metadata data mapping to NDA classifer';
comment on column backfeed.bf_metadata_ndacla_mapping.nda_cla_schema is 'The NDA official classification schema name';
create index idx_bf_mnm_mpi on backfeed.bf_metadata_ndacla_mapping(metadata_perm_id);

CREATE TABLE backfeed.bf_aws_rpc_nda_mapping (
    ID             bigint   NOT NULL PRIMARY KEY DEFAULT nextval('backfeed.seq_bf_aws_rpc_nda_id'),
    AWS_ATTRIBUTE  varchar(50),
    AWS_VALUE      varchar(200),
    NDA_PROPERTY   varchar(50),
    NDA_VALUE      varchar(200),
    COMMENT_INFO   varchar(200),
    CREATE_DATE    timestamp
);
comment on table backfeed.bf_aws_rpc_nda_mapping is 'This table stores mapping data, eg: from trcs to type,category,rcs etc. ';


ALTER TABLE backfeed.bf_instrument_version   OWNER to myna;
ALTER TABLE backfeed.bf_instrument_version_current   OWNER to myna;
ALTER TABLE backfeed.bf_instrument_version_future    OWNER to myna;
ALTER TABLE backfeed.bf_instrument_version_archive   OWNER to myna;
ALTER TABLE backfeed.bf_instrument_attribute_version  OWNER to myna;
ALTER TABLE backfeed.bf_instrument_attribute_version_current   OWNER to myna;
ALTER TABLE backfeed.bf_instrument_attribute_version_future    OWNER to myna;
ALTER TABLE backfeed.bf_instrument_attribute_version_archive   OWNER to myna;

ALTER TABLE backfeed.bf_underlying_version   OWNER to myna;
ALTER TABLE backfeed.bf_underlying_version_current   OWNER to myna;
ALTER TABLE backfeed.bf_underlying_version_future    OWNER to myna;
ALTER TABLE backfeed.bf_underlying_version_archive   OWNER to myna;
ALTER TABLE backfeed.bf_underlying_attribute_version  OWNER to myna;
ALTER TABLE backfeed.bf_underlying_attribute_version_current   OWNER to myna;
ALTER TABLE backfeed.bf_underlying_attribute_version_future    OWNER to myna;
ALTER TABLE backfeed.bf_underlying_attribute_version_archive   OWNER to myna;

ALTER TABLE backfeed.bf_tranche_version   OWNER to myna;
ALTER TABLE backfeed.bf_tranche_version_current   OWNER to myna;
ALTER TABLE backfeed.bf_tranche_version_future    OWNER to myna;
ALTER TABLE backfeed.bf_tranche_version_archive   OWNER to myna;
ALTER TABLE backfeed.bf_tranche_attribute_version  OWNER to myna;
ALTER TABLE backfeed.bf_tranche_attribute_version_current   OWNER to myna;
ALTER TABLE backfeed.bf_tranche_attribute_version_future    OWNER to myna;
ALTER TABLE backfeed.bf_tranche_attribute_version_archive   OWNER to myna;

ALTER TABLE backfeed.bf_attribute_mapping   OWNER to myna;
ALTER TABLE backfeed.bf_metadata_ndacla_mapping   OWNER to myna;
ALTER TABLE backfeed.bf_aws_rpc_nda_mapping   OWNER to myna;



CREATE TABLE backfeed.asc_nda_mapping_log
(
    log_id 		bigint NOT NULL,
    log_type 	varchar(10),
    log_title   varchar(100),
    error_code  varchar(5),
    log_desc 	varchar(4000),
    log_user 	varchar(20),
    log_date 	timestamp
);

ALTER TABLE backfeed.asc_nda_mapping_log
    OWNER to myna;


CREATE TABLE backfeed.bf_staging
(
    id 				bigint,
    master_id 		bigint,
    property_name 	varchar(200),
    property_value 	varchar(500),
    language_id 	bigint
);

ALTER TABLE backfeed.bf_staging
    OWNER to myna;


CREATE TABLE backfeed.bf_staging_master
(
    id 					bigint,
    bf_staging_source 	varchar(200),
    key_permid 			varchar(50) NOT NULL,
    entity_id 			bigint,
    source_table 		varchar(100),
    status 				varchar(10),
    create_date 		timestamp without time zone,
    create_by 			varchar(100)
);

ALTER TABLE backfeed.bf_staging_master
    OWNER to myna;



CREATE TABLE backfeed.blk_feed_start_point
(
    id 			bigint NOT NULL DEFAULT nextval('backfeed.seq_blk_feed_start_point_id'),
    feed_name 	varchar(200),
    start_point varchar(200),
    create_date timestamp without time zone,
    create_by 	varchar(200),
    modify_date timestamp without time zone,
    modify_by 	varchar(20),
    CONSTRAINT blk_feed_start_point_pkey PRIMARY KEY (id)
);

ALTER TABLE backfeed.blk_feed_start_point
    OWNER to myna;


CREATE OR REPLACE FUNCTION backfeed.blk_feed_start_point_audit()
  RETURNS trigger AS $BODY$

BEGIN
       IF (TG_OP = 'INSERT') THEN
		   NEW.create_date := current_timestamp;
		   NEW.create_by := current_user;
		   NEW.modify_date := current_timestamp;
		   NEW.modify_by := current_user;
		   RETURN NEW;
	   ELSIF (TG_OP = 'UPDATE') THEN
		   NEW.modify_date := current_timestamp;
		   NEW.modify_by := current_user;
		   RETURN NEW;
	   END IF;
	   RETURN NULL;
END;

$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

CREATE TRIGGER blk_feed_start_point_audit_trg
    BEFORE INSERT OR UPDATE
    ON backfeed.blk_feed_start_point
    FOR EACH ROW
    EXECUTE PROCEDURE backfeed.blk_feed_start_point_audit();



CREATE TABLE backfeed.blk_feed_status
(
    id 			bigint NOT NULL,
    feed_name 	varchar(200)	NOT NULL,
    file_name 	varchar(130) 	NOT NULL,
    processing_start_time timestamp without time zone,
    processing_end_time timestamp without time zone,
    change_total_count 		bigint,
    change_combined_count 	bigint,
    change_success_count 	bigint,
    change_error_count 	bigint,
    status varchar(10)  	NOT NULL,
    create_timestamp timestamp without time zone,
    create_by 	varchar(200) ,
    modify_timestamp timestamp without time zone,
    modify_by 	varchar(20) ,
    CONSTRAINT blk_feed_status_pkey PRIMARY KEY (id)
);

ALTER TABLE backfeed.blk_feed_status
    OWNER to myna;


CREATE TABLE backfeed.iqm_nav_log
(
    log_id 	bigint NOT NULL DEFAULT nextval('backfeed.seq_iqm_nav_log_id'),
    log_type varchar(10) ,
    log_composite_name varchar(256) ,
    log_file_type varchar(256) ,
    log_composite_instance_id varchar(256) ,
    log_activity_name varchar(256) ,
    log_user varchar(30) ,
    log_title varchar(256) ,
    log_desc varchar(4000) ,
    log_timestamp timestamp without time zone,
    log_class character(1) ,
    ich_id bigint,
    CONSTRAINT iqm_nav_log_pkey PRIMARY KEY (log_id)
);

ALTER TABLE backfeed.iqm_nav_log
    OWNER to myna;


CREATE TABLE backfeed.rep_blk_file_status
(
    id 					bigint NOT NULL,
    file_name 			varchar(300) ,
    application_name 	varchar(50) ,
    file_set_id 		bigint,
    file_set_sequence bigint,
    create_date 		timestamp without time zone,
    status 				varchar(20) ,
    file_set_start_date timestamp without time zone,
    file_set_end_date 	timestamp without time zone
);

ALTER TABLE backfeed.rep_blk_file_status
    OWNER to myna;


/**
 * Author:  Bruce Wang
 * Created: Apr 6, 2018
 */
--------------------------------------------------
-- Sequence: rules.seq_rule_id
--------------------------------------------------
CREATE SEQUENCE rules.seq_rule_id
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 100
  CACHE 1;

--------------------------------------------------
-- Table: rules.rule_table_descriptor
--------------------------------------------------
CREATE TABLE rules.rule_table_descriptor
(
    id character varying(64) NOT NULL DEFAULT nextval('rules.seq_rule_id')::varchar,
    name character varying(50) NOT NULL,
    display_name character varying(80) NOT NULL,
    description character varying(200),
    hidden boolean NOT NULL DEFAULT 'false',
    expert boolean NOT NULL DEFAULT 'false',
    read_only boolean NOT NULL DEFAULT 'false',
    CONSTRAINT rule_table_descriptor_pkey PRIMARY KEY (id),
    CONSTRAINT uni_index_rule_tbl_desc_name UNIQUE (name)
);

--------------------------------------------------
-- Table: rules.rule_attribute_descriptor
--------------------------------------------------
CREATE TABLE rules.rule_attribute_descriptor
(
    id character varying(64) NOT NULL DEFAULT nextval('rules.seq_rule_id')::varchar,
    table_name character varying(50) NOT NULL,
    name character varying(50) NOT NULL,
    display_name character varying(80) NOT NULL,
    description character varying(200),
    hidden boolean NOT NULL DEFAULT 'false',
    expert boolean NOT NULL DEFAULT 'false',
    read_only boolean NOT NULL DEFAULT 'false',
    optional boolean NOT NULL DEFAULT 'false',
    data_type character varying(20) NOT NULL,
    value_space character varying(30),
    indexed boolean NOT NULL DEFAULT 'false',
    CONSTRAINT rule_attribute_descriptor_pkey PRIMARY KEY (id),
    CONSTRAINT uni_index_rule_attr_desc_name UNIQUE (table_name,name)
);

--------------------------------------------------
-- Table: rules.list_model_descriptor
--------------------------------------------------
CREATE TABLE rules.list_model_descriptor
(
  id character varying(64) NOT NULL DEFAULT nextval('rules.seq_rule_id')::varchar,
  table_name character varying(50) NOT NULL,
  attribute_name character varying(50) NOT NULL,
  value character varying(80) NOT NULL,
  display_name character varying(80) NOT NULL, 
  description character varying(200),
  sort_order smallint NOT NULL,
  CONSTRAINT list_model_descriptor_pkey PRIMARY KEY (id)
);

--------------------------------------------------
-- Table: rules.issuer_symbol_rule
--------------------------------------------------
CREATE TABLE rules.issuer_symbol_rule
(
  id character varying(64) NOT NULL DEFAULT nextval('rules.seq_rule_id')::varchar,
  issuerCode character varying(80) NOT NULL,
  issuerName character varying(80) NOT NULL,
  issuerSymbol character varying(100) NOT NULL,
  created timestamp NOT NULL,
  createdBy character varying(80) NOT NULL,
  lastModified timestamp NOT NULL,
  lastModifiedBy character varying(80) NOT NULL,
  CONSTRAINT issuer_symbol_rule_pkey PRIMARY KEY (id)
);

--------------------------------------------------
-- Table: rules.issuercode_orgid_rule
--------------------------------------------------
CREATE TABLE rules.issuercode_orgid_rule
(
  id character varying(64) NOT NULL DEFAULT nextval('rules.seq_rule_id')::varchar,
  issuerCode character varying(80) NOT NULL,
  issuerName character varying(80) NOT NULL,
  orgId character varying(100) NOT NULL,
  permId character varying(100) NOT NULL,
  created timestamp NOT NULL,
  createdBy character varying(80) NOT NULL,
  lastModified timestamp NOT NULL,
  lastModifiedBy character varying(80) NOT NULL,
  CONSTRAINT issuercode_orgid_rule_pkey PRIMARY KEY (id)
);

--------------------------------------------------
-- Table: rules.paying_agent_code_orgid_rule
--------------------------------------------------
CREATE TABLE rules.paying_agent_code_orgid_rule
(
  id character varying(64) NOT NULL DEFAULT nextval('rules.seq_rule_id')::varchar,
  payingAgentCode character varying(80) NOT NULL,
  underwriterOrgId character varying(80) NOT NULL,
  permId character varying(100) NOT NULL,
  created timestamp NOT NULL,
  createdBy character varying(80) NOT NULL,
  lastModified timestamp NOT NULL,
  lastModifiedBy character varying(80) NOT NULL,
  CONSTRAINT paying_agent_code_orgid_rule_pkey PRIMARY KEY (id)
);

--------------------------------------------------
-- Table: rules.liquidity_provider_code_orgid_rule
--------------------------------------------------
CREATE TABLE rules.liquidity_provider_code_orgid_rule
(
  id character varying(64) NOT NULL DEFAULT nextval('rules.seq_rule_id')::varchar,
  code character varying(80) NOT NULL,
  member character varying(200) NOT NULL,
  orgId character varying(80) NOT NULL,
  permId character varying(80) NOT NULL,
  created timestamp NOT NULL,
  createdBy character varying(80) NOT NULL,
  lastModified timestamp NOT NULL,
  lastModifiedBy character varying(80) NOT NULL,
  CONSTRAINT liquidity_provider_code_orgid_rule_pkey PRIMARY KEY (id)
);

--------------------------------------------------
-- Table: rules.trading_group_asset_type_rule
--------------------------------------------------
CREATE TABLE rules.trading_group_asset_type_rule
(
  id character varying(64) NOT NULL DEFAULT nextval('rules.seq_rule_id')::varchar,
  tradingGroup character varying(32) NOT NULL,
  assetType character varying(32) NOT NULL,
  created timestamp NOT NULL,
  createdBy character varying(80) NOT NULL,
  lastModified timestamp NOT NULL,
  lastModifiedBy character varying(80) NOT NULL,
  CONSTRAINT trading_group_asset_type_rule_pkey PRIMARY KEY (id)
);

--------------------------------------------------
-- Table: rules.marketing_product_name_trcs_rule
--------------------------------------------------
CREATE TABLE rules.marketing_product_name_trcs_rule
(
  id character varying(64) NOT NULL DEFAULT nextval('rules.seq_rule_id')::varchar,
  marketingProductName character varying(256) NOT NULL,
  trcsIfCert character varying(64),
  permId1 character varying(32),
  trcsIfWarr character varying(64),
  permId2 character varying(32),
  created timestamp NOT NULL,
  createdBy character varying(80) NOT NULL,
  lastModified timestamp NOT NULL,
  lastModifiedBy character varying(80) NOT NULL,
  CONSTRAINT marketing_product_name_trcs_rule_pkey PRIMARY KEY (id)
);

CREATE OR REPLACE FUNCTION rules.check_mkt_prod_name_trcs_rule() RETURNS trigger AS $check_mkt_prod_name_trcs_rule$
    BEGIN
        IF (NEW.trcsIfCert IS NULL or NEW.permId1 IS NULL) and (NEW.trcsIfWarr IS NULL or NEW.permId2 IS NULL) THEN
            RAISE EXCEPTION 'either trcsIfCert/permId1 or trcsIfWarr/permId2 cannot be null';
        END IF;
        RETURN NEW;
    END;
$check_mkt_prod_name_trcs_rule$ LANGUAGE plpgsql;

CREATE TRIGGER check_mkt_prod_name_trcs_rule_trg
BEFORE INSERT OR UPDATE ON rules.marketing_product_name_trcs_rule
    FOR EACH ROW EXECUTE PROCEDURE rules.check_mkt_prod_name_trcs_rule();

--------------------------------------------------
-- Table: rules.marketing_product_name_eusipa_code_rule
--------------------------------------------------
CREATE TABLE rules.marketing_product_name_eusipa_code_rule
(
  id character varying(64) NOT NULL DEFAULT nextval('rules.seq_rule_id')::varchar,
  marketingProductName character varying(256) NOT NULL,
  eusipaCode character varying(32) NOT NULL,
  created timestamp NOT NULL,
  createdBy character varying(80) NOT NULL,
  lastModified timestamp NOT NULL,
  lastModifiedBy character varying(80) NOT NULL,
  CONSTRAINT marketing_product_name_eusipa_code_rule_pkey PRIMARY KEY (id)
);

--------------------------------------------------
-- Table: rules.underlying_permid_rule
--------------------------------------------------
CREATE TABLE rules.underlying_permid_rule
(
  id character varying(64) NOT NULL DEFAULT nextval('rules.seq_rule_id')::varchar,
  exchangeUnderlyingName character varying(256),
  exchangeUnderlyingCode character varying(64),
  underlyingName character varying(256),
  ric character varying(64),
  permId character varying(32),
  isin  character varying(64),
  currency character varying(8),
  created timestamp NOT NULL,
  createdBy character varying(80) NOT NULL,
  lastModified timestamp NOT NULL,
  lastModifiedBy character varying(80) NOT NULL,
  CONSTRAINT underlying_permid_rule_pkey PRIMARY KEY (id)
);

CREATE OR REPLACE FUNCTION rules.check_underlying_permid_rule() RETURNS trigger AS $check_underlying_permid_rule$
    BEGIN
        IF NEW.exchangeUnderlyingName IS NULL and NEW.exchangeUnderlyingCode IS NULL and NEW.underlyingName IS NULL THEN
            RAISE EXCEPTION 'exchangeUnderlyingName,exchangeUnderlyingCode,underlyingName cannot be all null';
        END IF;
        RETURN NEW;
    END;
$check_underlying_permid_rule$ LANGUAGE plpgsql;

CREATE TRIGGER check_underlying_permid_rule_trg
BEFORE INSERT OR UPDATE ON rules.underlying_permid_rule
    FOR EACH ROW EXECUTE PROCEDURE rules.check_underlying_permid_rule();

--------------------------------------------------
-- Table: rules.evaluation_parameters_rule
--------------------------------------------------
CREATE TABLE rules.evaluation_parameters_rule
(
  id character varying(64) NOT NULL DEFAULT nextval('rules.seq_rule_id')::varchar,
  marketingProductName character varying(256) NOT NULL,
  strike1 character varying(64),
  barrier1Unit character varying(32),
  strike2 character varying(64),
  barrier2Unit character varying(32),
  strike3 character varying(64),
  barrier3Unit character varying(32),
  strike4 character varying(64),
  barrier4Unit character varying(32),
  created timestamp NOT NULL,
  createdBy character varying(80) NOT NULL,
  lastModified timestamp NOT NULL,
  lastModifiedBy character varying(80) NOT NULL,
  CONSTRAINT evaluation_parameters_rule_pkey PRIMARY KEY (id)
);

--------------------------------------------------
-- Table: rules.marketing_product_name_note_description
--------------------------------------------------
CREATE TABLE rules.marketing_product_name_note_description
(
  id character varying(64) NOT NULL DEFAULT nextval('rules.seq_rule_id')::varchar,
  note character varying(32) NOT NULL,
  description character varying(4096) NOT NULL,
  created timestamp NOT NULL,
  createdBy character varying(80) NOT NULL,
  lastModified timestamp NOT NULL,
  lastModifiedBy character varying(80) NOT NULL,
  CONSTRAINT marketing_product_name_note_description_pkey PRIMARY KEY (id)
);

--------------------------------------------------
-- Table: rules.marketing_product_name_note_rule
--------------------------------------------------
CREATE TABLE rules.marketing_product_name_note_rule
(
  id character varying(64) NOT NULL DEFAULT nextval('rules.seq_rule_id')::varchar,
  marketingProductName character varying(256) NOT NULL,
  note character varying(32) NOT NULL,
  created timestamp NOT NULL,
  createdBy character varying(80) NOT NULL,
  lastModified timestamp NOT NULL,
  lastModifiedBy character varying(80) NOT NULL,
  CONSTRAINT marketing_product_name_note_rule_pkey PRIMARY KEY (id)
);

--------------------------------------------------
-- Table: rules.location_code_orgid_rule
--------------------------------------------------
CREATE TABLE rules.location_code_orgid_rule
(
  id character varying(64) NOT NULL DEFAULT nextval('rules.seq_rule_id')::varchar,
  locationCode character varying(64) NOT NULL,
  clearinghouseOrgId character varying(32),
  permId character varying(32) NOT NULL,
  created timestamp NOT NULL,
  createdBy character varying(80) NOT NULL,
  lastModified timestamp NOT NULL,
  lastModifiedBy character varying(80) NOT NULL,
  CONSTRAINT location_code_orgid_rule_pkey PRIMARY KEY (id)
);

--------------------------------------------------
-- Table: rules.orgid_permid_rule
--------------------------------------------------
CREATE TABLE rules.orgid_permid_rule
(
  id character varying(64) NOT NULL DEFAULT nextval('rules.seq_rule_id')::varchar,
  orgId character varying(32) NOT NULL,
  permId character varying(32) NOT NULL,
  created timestamp NOT NULL,
  createdBy character varying(80) NOT NULL,
  lastModified timestamp NOT NULL,
  lastModifiedBy character varying(80) NOT NULL,
  CONSTRAINT orgid_permid_rule_pkey PRIMARY KEY (id)
);

--------------------------------------------------
-- Table: rules.market_maker_rule
--------------------------------------------------
CREATE TABLE rules.market_maker_rule
(
  id character varying(64) NOT NULL DEFAULT nextval('rules.seq_rule_id')::varchar,
  products character varying(64),
  productsType character varying(128),
  nxtCode character varying(64),
  nameOfSecurity character varying(128),
  place character varying(64),
  tradingGroup character varying(32),
  code character varying(64),
  memberName character varying(512),
  created timestamp NOT NULL,
  createdBy character varying(80) NOT NULL,
  lastModified timestamp NOT NULL,
  lastModifiedBy character varying(80) NOT NULL,
  CONSTRAINT market_maker_rule_pkey PRIMARY KEY (id)
);


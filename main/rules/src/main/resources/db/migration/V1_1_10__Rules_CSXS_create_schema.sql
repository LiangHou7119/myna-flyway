/**
 * Author:  Zhenguang Fan
 * Created: Oct 23, 2018
 */
--------------------------------------------------
-- Table: ibt_type_code_rule
--------------------------------------------------
CREATE TABLE rules.ibt_type_code_rule
(
  id character varying(64) NOT NULL DEFAULT nextval('rules.seq_rule_id')::varchar,
  code character varying(80) UNIQUE NOT NULL,
  description character varying(256),
  basicType character varying(100),
  scopeRICGeneration character varying(64) NOT NULL,
  created timestamp NOT NULL,
  createdBy character varying(80) NOT NULL,
  lastModified timestamp NOT NULL,
  lastModifiedBy character varying(80) NOT NULL,
  CONSTRAINT ibt_type_code_rule_pkey PRIMARY KEY (id)
);

--------------------------------------------------
-- Table: warrantType_callPut_rule
--------------------------------------------------
CREATE TABLE rules.warrantType_callPut_rule
(
  id character varying(64) NOT NULL DEFAULT nextval('rules.seq_rule_id')::varchar,
  warrantType character varying(4) UNIQUE NOT NULL,
  warrantTypeName character varying(80),
  callPut character varying(8),
  created timestamp NOT NULL,
  createdBy character varying(80) NOT NULL,
  lastModified timestamp NOT NULL,
  lastModifiedBy character varying(80) NOT NULL,
  CONSTRAINT warrantType_callPut_rule_pkey PRIMARY KEY (id)
);

--------------------------------------------------
-- Table: rules.tkpartykey_issuercode_rule
--------------------------------------------------
CREATE TABLE rules.tkpartykey_issuercode_rule
(
  id character varying(64) PRIMARY KEY NOT NULL DEFAULT nextval('rules.seq_rule_id')::varchar,
  tkPartyKey character varying(80) UNIQUE NOT NULL,
  partyName character varying(200) NOT NULL,
  issuerCode character varying(100) NOT NULL,
  created timestamp NOT NULL,
  createdBy character varying(80) NOT NULL,
  lastModified timestamp NOT NULL,
  lastModifiedBy character varying(80) NOT NULL
);

--------------------------------------------------
-- Table: rules.tkpartykey_org_permid_rule
--------------------------------------------------
CREATE TABLE rules.tkpartykey_org_permid_rule
(
  id character varying(64) NOT NULL DEFAULT nextval('rules.seq_rule_id')::varchar,
  tkPartyKey character varying(80) UNIQUE NOT NULL,
  partyName character varying(200) NOT NULL,
  orgId character varying(100),
  permId character varying(100) NOT NULL,
  created timestamp NOT NULL,
  createdBy character varying(80) NOT NULL,
  lastModified timestamp NOT NULL,
  lastModifiedBy character varying(80) NOT NULL,
  CONSTRAINT tkpartykey_org_permid_rule_pkey PRIMARY KEY (id)
);

--------------------------------------------------
-- Table: rules.ccd_enum_value_domain_rule
--------------------------------------------------
CREATE TABLE rules.ccd_enum_value_domain_rule
(
  id character varying(64) PRIMARY KEY NOT NULL DEFAULT nextval('rules.seq_rule_id')::varchar,
  schemaType character varying(80) NOT NULL,
  sourceValue character varying(200) NOT NULL,
  sourceDescription character varying(500),
  valueDomainId character varying(100) NOT NULL,
  valueDomainEnumId character varying(100) NOT NULL,
  created timestamp NOT NULL,
  createdBy character varying(80) NOT NULL,
  lastModified timestamp NOT NULL,
  lastModifiedBy character varying(80) NOT NULL
);
CREATE UNIQUE INDEX value_domain_idx on rules.ccd_enum_value_domain_rule(schemaType, sourceValue, valueDomainId);


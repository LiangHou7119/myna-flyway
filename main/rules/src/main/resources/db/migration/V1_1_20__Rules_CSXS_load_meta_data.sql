/**
 * Author:  Zhenguang Fan
 * Created: Oct 23, 2018
 */
------------------------------------------------
-- table rule_table_descriptor
------------------------------------------------
insert into rules.rule_table_descriptor(name, display_name, description,hidden,expert,read_only)
values('ibt_type_code_rule', 'IBT Type Code Rule', null, false, false, false);

insert into rules.rule_table_descriptor(name, display_name, description,hidden,expert,read_only)
values('warrantType_callPut_rule', 'Warrant Type Call Put Rule', null, false, false, false);

insert into rules.rule_table_descriptor(name, display_name, description,hidden,expert,read_only)
values('tkpartykey_issuercode_rule', 'TK Party Key Issuer Code Rule', null, false, false, false );

insert into rules.rule_table_descriptor(name, display_name, description,hidden,expert,read_only)
values('tkpartykey_org_permid_rule', 'TK Party Key Org PermId Rule', null, false, false, false );

------------------------------------------------
-- table rule_attribute_descriptor
------------------------------------------------
-- Table: ibt_type_code_rule
insert into rules.rule_attribute_descriptor(table_name, name, display_name, description, hidden, expert, optional,indexed, data_type, value_space)
values('ibt_type_code_rule', 'code', 'IBT Type Code', null, false, false, false, true, 'STRING', null);

insert into rules.rule_attribute_descriptor(table_name, name, display_name, description, hidden, expert, optional,indexed, data_type, value_space)
values('ibt_type_code_rule', 'description', 'IBT Type Code Description', null, false, false, true, true, 'STRING', null);

insert into rules.rule_attribute_descriptor(table_name, name, display_name, description, hidden, expert, optional,indexed, data_type, value_space)
values('ibt_type_code_rule', 'basicType', 'Basic Type', null, false, false, true, true, 'STRING', 'ListModel');

insert into rules.rule_attribute_descriptor(table_name, name, display_name, description, hidden, expert, optional,indexed, data_type, value_space)
values('ibt_type_code_rule', 'scopeRICGeneration', 'Scope|RIC Generation', null, false, false, false, true, 'STRING', 'ListModel');

-- Table: warrantType_callPut_rule
insert into rules.rule_attribute_descriptor(table_name, name, display_name, description, hidden, expert, optional,indexed, data_type, value_space)
values('warrantType_callPut_rule', 'warrantType', 'Warrant Type', null, false, false, false, true, 'STRING', null);

insert into rules.rule_attribute_descriptor(table_name, name, display_name, description, hidden, expert, optional,indexed, data_type, value_space)
values('warrantType_callPut_rule', 'warrantTypeName', 'Warrant Type Name', null, false, false, true, true, 'STRING', null);

insert into rules.rule_attribute_descriptor(table_name, name, display_name, description, hidden, expert, optional,indexed, data_type, value_space)
values('warrantType_callPut_rule', 'callPut', 'Call Put', null, false, false, false, true, 'STRING', 'ListModel');

-- tkpartykey_issuercode_rule
insert into rules.rule_attribute_descriptor(table_name, name, display_name, description, hidden, expert, optional,indexed, data_type, value_space)
values('tkpartykey_issuercode_rule', 'tkPartyKey', 'Tk Party Key', null, false, false, false, true, 'STRING', null);

insert into rules.rule_attribute_descriptor(table_name, name, display_name, description, hidden, expert, optional,indexed, data_type, value_space)
values('tkpartykey_issuercode_rule', 'partyName', 'Party Name', null, false, false, false, true, 'STRING', null);

insert into rules.rule_attribute_descriptor(table_name, name, display_name, description, hidden, expert, optional,indexed, data_type, value_space)
values('tkpartykey_issuercode_rule', 'issuerCode', 'Issuer Code', null, false, false, false, true, 'STRING', null);

-- tkpartykey_org_permid_rule
insert into rules.rule_attribute_descriptor(table_name, name, display_name, description, hidden, expert, optional,indexed, data_type, value_space)
values('tkpartykey_org_permid_rule', 'tkPartyKey', 'Tk Party Key', null, false, false, false, true, 'STRING', null);

insert into rules.rule_attribute_descriptor(table_name, name, display_name, description, hidden, expert, optional,indexed, data_type, value_space)
values('tkpartykey_org_permid_rule', 'partyName', 'Party Name', null, false, false, false, true, 'STRING', null);

insert into rules.rule_attribute_descriptor(table_name, name, display_name, description, hidden, expert, optional,indexed, data_type, value_space)
values('tkpartykey_org_permid_rule', 'orgId', 'ORGID', null, false, false, true, true, 'NUMBER', null);

insert into rules.rule_attribute_descriptor(table_name, name, display_name, description, hidden, expert, optional,indexed, data_type, value_space)
values('tkpartykey_org_permid_rule', 'permId', 'PERMID', null, false, false, false, true, 'NUMBER', null);


------------------------------------------------
-- table rules.list_model_descriptor
------------------------------------------------
-- Scope and RIC Generation
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('ibt_type_code_rule','scopeRICGeneration','Regular','Regular',null,1);
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('ibt_type_code_rule','scopeRICGeneration','Revcon','Revcon',null,2);
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('ibt_type_code_rule','scopeRICGeneration','Out of scope','Out of scope',null,3);


-- Call Put
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('warrantType_callPut_rule','callPut','CALL','Call',null,1);
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('warrantType_callPut_rule','callPut','PUT','Put',null,2);

-- ibt_type_code_rule.basicType
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('ibt_type_code_rule','basicType','1','1:MiniFuture',null,1);
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('ibt_type_code_rule','basicType','2','2:ProtectionParticipation',null,2);
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('ibt_type_code_rule','basicType','3','3:ReverseConvertible',null,3);
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('ibt_type_code_rule','basicType','4','4:StructuredNote',null,4);
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('ibt_type_code_rule','basicType','5','5:UnderlyingTracker',null,5);
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('ibt_type_code_rule','basicType','6','6:Warrant',null,6);
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('ibt_type_code_rule','basicType','7','7:Forward',null,7);
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('ibt_type_code_rule','basicType','8','8:Option',null,8);
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('ibt_type_code_rule','basicType','9','9:Swap',null,9);
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('ibt_type_code_rule','basicType','10','10:Bond',null,10);


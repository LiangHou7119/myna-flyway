/**
 * Author:  Bruce Wang
 * Created: Apr 6, 2018
 */
------------------------------------------------
-- table rule_table_descriptor
------------------------------------------------
insert into rules.rule_table_descriptor(name, display_name, description)
values('issuer_symbol_rule', 'Issuer Symbol Rule', NULL);

insert into rules.rule_table_descriptor(name, display_name, description)
values('issuercode_orgid_rule', 'IssuerCode OrgId Rule', NULL);

insert into rules.rule_table_descriptor(name, display_name, description)
values('paying_agent_code_orgid_rule', 'Paying Agent Code OrgId Rule', NULL);

insert into rules.rule_table_descriptor(name, display_name, description)
values('liquidity_provider_code_orgid_rule', 'Liquidity Provider Code OrgId Rule', NULL);

insert into rules.rule_table_descriptor(name, display_name, description)
values('trading_group_asset_type_rule', 'Trading Group Asset Type Rule', NULL);

insert into rules.rule_table_descriptor(name, display_name, description)
values('marketing_product_name_trcs_rule', 'Marketing Product Name TRCS Rule', NULL);

insert into rules.rule_table_descriptor(name, display_name, description)
values('marketing_product_name_eusipa_code_rule', 'Marketing Product Name Eusipa Code Rule', NULL);

insert into rules.rule_table_descriptor(name, display_name, description)
values('underlying_permid_rule', 'Underlying PermId Rule', NULL);

insert into rules.rule_table_descriptor(name, display_name, description)
values('evaluation_parameters_rule', 'Evaluation Parameters Rule', NULL);

insert into rules.rule_table_descriptor(name, display_name, description)
values('marketing_product_name_note_description', 'Marketing Product Name Note Description Rule', NULL);

insert into rules.rule_table_descriptor(name, display_name, description)
values('marketing_product_name_note_rule', 'Marketing Product Name Note Rule', NULL);

insert into rules.rule_table_descriptor(name, display_name, description)
values('location_code_orgid_rule', 'Location Code OrgId Rule', NULL);

insert into rules.rule_table_descriptor(name, display_name, description)
values('orgid_permid_rule', 'OrgId PermID Rule', NULL);

insert into rules.rule_table_descriptor(name, display_name, description, hidden)
values('market_maker_rule', 'Market Maker Rule', NULL,'true');

------------------------------------------------
-- table rule_attribute_descriptor
------------------------------------------------
-- issuer_symbol_rule
insert into rules.rule_attribute_descriptor(table_name, name, display_name, description, optional, data_type)
values('issuer_symbol_rule', 'issuerCode', 'Issuer Code', NULL, 'false', 'NUMBER');

insert into rules.rule_attribute_descriptor(table_name, name, display_name, description, optional, data_type)
values('issuer_symbol_rule', 'issuerName', 'Issuer Name', NULL, 'false', 'STRING');

insert into rules.rule_attribute_descriptor(table_name, name, display_name, description, optional, data_type)
values('issuer_symbol_rule', 'issuerSymbol', 'Issuer Symbol', NULL, 'false', 'STRING');

-- issuercode_orgid_rule
insert into rules.rule_attribute_descriptor(table_name, name, display_name, description, optional, data_type)
values('issuercode_orgid_rule', 'issuerCode', 'Issuer Code', NULL, 'false', 'NUMBER');

insert into rules.rule_attribute_descriptor(table_name, name, display_name, description, optional, data_type)
values('issuercode_orgid_rule', 'issuerName', 'Issuer Name', NULL, 'false', 'STRING');

insert into rules.rule_attribute_descriptor(table_name, name, display_name, description, optional, data_type)
values('issuercode_orgid_rule', 'orgId', 'OrgId', NULL, 'false', 'NUMBER');

insert into rules.rule_attribute_descriptor(table_name, name, display_name, description, optional, data_type)
values('issuercode_orgid_rule', 'permId', 'PermID', NULL, 'false', 'NUMBER');

-- paying_agent_code_orgid_rule
insert into rules.rule_attribute_descriptor(table_name, name, display_name, description, optional, data_type)
values('paying_agent_code_orgid_rule', 'payingAgentCode', 'Paying Agent Code', NULL, 'false', 'NUMBER');

insert into rules.rule_attribute_descriptor(table_name, name, display_name, description, optional, data_type)
values('paying_agent_code_orgid_rule', 'underwriterOrgId', 'Underwriter OrgId', NULL, 'false', 'NUMBER');

insert into rules.rule_attribute_descriptor(table_name, name, display_name, description, optional, data_type)
values('paying_agent_code_orgid_rule', 'permId', 'PermID', NULL, 'false', 'NUMBER');

-- liquidity_provider_code_orgid_rule
insert into rules.rule_attribute_descriptor(table_name, name, display_name, description, optional, data_type)
values('liquidity_provider_code_orgid_rule', 'code', 'Code', NULL, 'false', 'NUMBER');

insert into rules.rule_attribute_descriptor(table_name, name, display_name, description, optional, data_type)
values('liquidity_provider_code_orgid_rule', 'member', 'Member', NULL, 'false', 'STRING');

insert into rules.rule_attribute_descriptor(table_name, name, display_name, description, optional, data_type)
values('liquidity_provider_code_orgid_rule', 'orgId', 'OrgId', NULL, 'false', 'NUMBER');

insert into rules.rule_attribute_descriptor(table_name, name, display_name, description, optional, data_type)
values('liquidity_provider_code_orgid_rule', 'permId', 'PermID', NULL, 'false', 'NUMBER');

-- trading_group_asset_type_rule
insert into rules.rule_attribute_descriptor(table_name, name, display_name, description, optional, data_type)
values('trading_group_asset_type_rule', 'tradingGroup', 'Trading Group', NULL, 'false', 'STRING');

insert into rules.rule_attribute_descriptor(table_name, name, display_name, description, optional, data_type)
values('trading_group_asset_type_rule', 'assetType', 'Asset Type', NULL, 'false', 'STRING');

-- marketing_product_name_trcs_rule
insert into rules.rule_attribute_descriptor(table_name, name, display_name, description, optional, data_type)
values('marketing_product_name_trcs_rule', 'marketingProductName', 'Marketing Product Name', NULL, 'false', 'STRING');

insert into rules.rule_attribute_descriptor(table_name, name, display_name, description, optional, data_type)
values('marketing_product_name_trcs_rule', 'trcsIfCert', 'TRCS If Cert', NULL, 'true', 'STRING');

insert into rules.rule_attribute_descriptor(table_name, name, display_name, description, optional, data_type)
values('marketing_product_name_trcs_rule', 'permId1', 'PermID1', NULL, 'true', 'NUMBER');

insert into rules.rule_attribute_descriptor(table_name, name, display_name, description, optional, data_type)
values('marketing_product_name_trcs_rule', 'trcsIfWarr', 'TRCS If Warr', NULL, 'true', 'STRING');

insert into rules.rule_attribute_descriptor(table_name, name, display_name, description, optional, data_type)
values('marketing_product_name_trcs_rule', 'permId2', 'PermID2', NULL, 'true', 'NUMBER');

-- marketing_product_name_eusipa_code_rule
insert into rules.rule_attribute_descriptor(table_name, name, display_name, description, optional, data_type)
values('marketing_product_name_eusipa_code_rule', 'marketingProductName', 'Marketing Product Name', NULL, 'false', 'STRING');

insert into rules.rule_attribute_descriptor(table_name, name, display_name, description, optional, data_type)
values('marketing_product_name_eusipa_code_rule', 'eusipaCode', 'EUSIPA Code', NULL, 'false', 'NUMBER');

-- underlying_permid_rule
insert into rules.rule_attribute_descriptor(table_name, name, display_name, description, optional, data_type)
values('underlying_permid_rule', 'exchangeUnderlyingName', 'Exchange Underlying Name', NULL, 'true', 'STRING');

insert into rules.rule_attribute_descriptor(table_name, name, display_name, description, optional, data_type)
values('underlying_permid_rule', 'exchangeUnderlyingCode', 'Exchange Underlying Code', NULL, 'true', 'STRING');

insert into rules.rule_attribute_descriptor(table_name, name, display_name, description, optional, data_type)
values('underlying_permid_rule', 'underlyingName', 'Underlying Name', NULL, 'true', 'STRING');

insert into rules.rule_attribute_descriptor(table_name, name, display_name, description, optional, data_type)
values('underlying_permid_rule', 'ric', 'RIC', NULL, 'true', 'STRING');

insert into rules.rule_attribute_descriptor(table_name, name, display_name, description, optional, data_type)
values('underlying_permid_rule', 'permId', 'PermID', NULL, 'true', 'NUMBER');

insert into rules.rule_attribute_descriptor(table_name, name, display_name, description, optional, data_type)
values('underlying_permid_rule', 'isin', 'ISIN', NULL, 'true', 'STRING');

insert into rules.rule_attribute_descriptor(table_name, name, display_name, description, optional, data_type)
values('underlying_permid_rule', 'currency', 'Currency', NULL, 'true', 'STRING');

-- evaluation_parameters_rule
insert into rules.rule_attribute_descriptor(table_name, name, display_name, description, optional, data_type)
values('evaluation_parameters_rule', 'marketingProductName', 'Marketing Product Name', NULL, 'false', 'STRING');

insert into rules.rule_attribute_descriptor(table_name, name, display_name, description, optional, data_type, value_space)
values('evaluation_parameters_rule', 'strike1', 'Strike1', NULL, 'true', 'STRING', 'ListModel');

insert into rules.rule_attribute_descriptor(table_name, name, display_name, description, optional, data_type, value_space)
values('evaluation_parameters_rule', 'barrier1Unit', 'Barrier1 Unit', NULL, 'true', 'STRING', 'ListModel');

insert into rules.rule_attribute_descriptor(table_name, name, display_name, description, optional, data_type, value_space)
values('evaluation_parameters_rule', 'strike2', 'Strike2', NULL, 'true', 'STRING', 'ListModel');

insert into rules.rule_attribute_descriptor(table_name, name, display_name, description, optional, data_type, value_space)
values('evaluation_parameters_rule', 'barrier2Unit', 'Barrier2 Unit', NULL, 'true', 'STRING', 'ListModel');

insert into rules.rule_attribute_descriptor(table_name, name, display_name, description, optional, data_type, value_space)
values('evaluation_parameters_rule', 'strike3', 'Strike3', NULL, 'true', 'STRING', 'ListModel');

insert into rules.rule_attribute_descriptor(table_name, name, display_name, description, optional, data_type, value_space)
values('evaluation_parameters_rule', 'barrier3Unit', 'Barrier3 Unit', NULL, 'true', 'STRING', 'ListModel');

insert into rules.rule_attribute_descriptor(table_name, name, display_name, description, optional, data_type, value_space)
values('evaluation_parameters_rule', 'strike4', 'Strike4', NULL, 'true', 'STRING', 'ListModel');

insert into rules.rule_attribute_descriptor(table_name, name, display_name, description, optional, data_type, value_space)
values('evaluation_parameters_rule', 'barrier4Unit', 'Barrier4 Unit', NULL, 'true', 'STRING', 'ListModel');

-- table marketing_product_name_note_description
insert into rules.rule_attribute_descriptor(table_name, name, display_name, description, optional, data_type)
values('marketing_product_name_note_description', 'note', 'Note', NULL, 'false', 'STRING');

insert into rules.rule_attribute_descriptor(table_name, name, display_name, description, optional, data_type)
values('marketing_product_name_note_description', 'description', 'Description', NULL, 'false', 'STRING');

-- table marketing_product_name_note_rule
insert into rules.rule_attribute_descriptor(table_name, name, display_name, description, optional, data_type)
values('marketing_product_name_note_rule', 'marketingProductName', 'Marketing Product Name', NULL, 'false', 'STRING');

insert into rules.rule_attribute_descriptor(table_name, name, display_name, description, optional, data_type)
values('marketing_product_name_note_rule', 'note', 'Note', NULL, 'false', 'STRING');

-- table location_code_orgid_rule
insert into rules.rule_attribute_descriptor(table_name, name, display_name, description, optional, data_type)
values('location_code_orgid_rule', 'locationCode', 'Location Code', NULL, 'false', 'STRING');

insert into rules.rule_attribute_descriptor(table_name, name, display_name, description, optional, data_type)
values('location_code_orgid_rule', 'clearinghouseOrgId', 'Clearinghouse OrgId', NULL, 'true', 'STRING');

insert into rules.rule_attribute_descriptor(table_name, name, display_name, description, optional, data_type)
values('location_code_orgid_rule', 'permId', 'PermID', NULL, 'false', 'NUMBER');

-- table orgid_permid_rule
insert into rules.rule_attribute_descriptor(table_name, name, display_name, description, optional, data_type)
values('orgid_permid_rule', 'orgId', 'OrgId', NULL, 'false', 'STRING');

insert into rules.rule_attribute_descriptor(table_name, name, display_name, description, optional, data_type)
values('orgid_permid_rule', 'permId', 'PermID', NULL, 'false', 'NUMBER');

-- table market_maker_rule
insert into rules.rule_attribute_descriptor(table_name, name, display_name, description, optional, data_type)
values('market_maker_rule', 'products', 'Products', NULL, 'true', 'STRING');

insert into rules.rule_attribute_descriptor(table_name, name, display_name, description, optional, data_type)
values('market_maker_rule', 'productsType', 'Products Type', NULL, 'true', 'STRING');

insert into rules.rule_attribute_descriptor(table_name, name, display_name, description, optional, data_type)
values('market_maker_rule', 'nxtCode', 'Nxt Code', NULL, 'true', 'STRING');

insert into rules.rule_attribute_descriptor(table_name, name, display_name, description, optional, data_type)
values('market_maker_rule', 'nameOfSecurity', 'Name Of Security', NULL, 'true', 'STRING');

insert into rules.rule_attribute_descriptor(table_name, name, display_name, description, optional, data_type)
values('market_maker_rule', 'place', 'Place', NULL, 'true', 'STRING');

insert into rules.rule_attribute_descriptor(table_name, name, display_name, description, optional, data_type)
values('market_maker_rule', 'tradingGroup', 'Trading Group', NULL, 'true', 'STRING');

insert into rules.rule_attribute_descriptor(table_name, name, display_name, description, optional, data_type)
values('market_maker_rule', 'code', 'code', NULL, 'true', 'STRING');

insert into rules.rule_attribute_descriptor(table_name, name, display_name, description, optional, data_type)
values('market_maker_rule', 'memberName', 'Member Name', NULL, 'true', 'STRING');

------------------------------------------------
-- table rules.list_model_descriptor
------------------------------------------------
-- strike1
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('evaluation_parameters_rule','strike1','222','Upper Knock Out Level',NULL,1);
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('evaluation_parameters_rule','strike1','223','Lower Knock Out Level',NULL,2);
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('evaluation_parameters_rule','strike1','213','Protection Level',NULL,3);
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('evaluation_parameters_rule','strike1','220','Strike Price',NULL,4);
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('evaluation_parameters_rule','strike1','215','Bonus Level',NULL,5);
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('evaluation_parameters_rule','strike1','218','Lower Barrier',NULL,6);
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('evaluation_parameters_rule','strike1','217','CAP',NULL,7);
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('evaluation_parameters_rule','strike1','219','Upper Barrier',NULL,8);
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('evaluation_parameters_rule','strike1','226','Coupon',NULL,9);
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('evaluation_parameters_rule','strike1','216','Reference Level',NULL,10);
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('evaluation_parameters_rule','strike1','221','Participation Level',NULL,11);
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('evaluation_parameters_rule','strike1','224','Lower Knock In Level',NULL,12);
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('evaluation_parameters_rule','strike1','225','Upper Knock In Level',NULL,13);

-- barrier1Unit
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('evaluation_parameters_rule','barrier1Unit','1','Currency',NULL,1);
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('evaluation_parameters_rule','barrier1Unit','2','Percentage',NULL,2);
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('evaluation_parameters_rule','barrier1Unit','3','Index Points',NULL,3);

-- strike2
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('evaluation_parameters_rule','strike2','222','Upper Knock Out Level',NULL,1);
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('evaluation_parameters_rule','strike2','223','Lower Knock Out Level',NULL,2);
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('evaluation_parameters_rule','strike2','213','Protection Level',NULL,3);
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('evaluation_parameters_rule','strike2','220','Strike Price',NULL,4);
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('evaluation_parameters_rule','strike2','215','Bonus Level',NULL,5);
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('evaluation_parameters_rule','strike2','218','Lower Barrier',NULL,6);
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('evaluation_parameters_rule','strike2','217','CAP',NULL,7);
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('evaluation_parameters_rule','strike2','219','Upper Barrier',NULL,8);
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('evaluation_parameters_rule','strike2','226','Coupon',NULL,9);
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('evaluation_parameters_rule','strike2','216','Reference Level',NULL,10);
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('evaluation_parameters_rule','strike2','221','Participation Level',NULL,11);
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('evaluation_parameters_rule','strike2','224','Lower Knock In Level',NULL,12);
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('evaluation_parameters_rule','strike2','225','Upper Knock In Level',NULL,13);

-- barrier2Unit
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('evaluation_parameters_rule','barrier2Unit','1','Currency',NULL,1);
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('evaluation_parameters_rule','barrier2Unit','2','Percentage',NULL,2);
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('evaluation_parameters_rule','barrier2Unit','3','Index Points',NULL,3);

 -- strike3
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('evaluation_parameters_rule','strike3','222','Upper Knock Out Level',NULL,1);
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('evaluation_parameters_rule','strike3','223','Lower Knock Out Level',NULL,2);
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('evaluation_parameters_rule','strike3','213','Protection Level',NULL,3);
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('evaluation_parameters_rule','strike3','220','Strike Price',NULL,4);
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('evaluation_parameters_rule','strike3','215','Bonus Level',NULL,5);
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('evaluation_parameters_rule','strike3','218','Lower Barrier',NULL,6);
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('evaluation_parameters_rule','strike3','217','CAP',NULL,7);
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('evaluation_parameters_rule','strike3','219','Upper Barrier',NULL,8);
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('evaluation_parameters_rule','strike3','226','Coupon',NULL,9);
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('evaluation_parameters_rule','strike3','216','Reference Level',NULL,10);
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('evaluation_parameters_rule','strike3','221','Participation Level',NULL,11);
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('evaluation_parameters_rule','strike3','224','Lower Knock In Level',NULL,12);
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('evaluation_parameters_rule','strike3','225','Upper Knock In Level',NULL,13);

-- barrier3Unit
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('evaluation_parameters_rule','barrier3Unit','1','Currency',NULL,1);
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('evaluation_parameters_rule','barrier3Unit','2','Percentage',NULL,2);
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('evaluation_parameters_rule','barrier3Unit','3','Index Points',NULL,3);

-- strike4
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('evaluation_parameters_rule','strike4','222','Upper Knock Out Level',NULL,1);
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('evaluation_parameters_rule','strike4','223','Lower Knock Out Level',NULL,2);
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('evaluation_parameters_rule','strike4','213','Protection Level',NULL,3);
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('evaluation_parameters_rule','strike4','220','Strike Price',NULL,4);
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('evaluation_parameters_rule','strike4','215','Bonus Level',NULL,5);
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('evaluation_parameters_rule','strike4','218','Lower Barrier',NULL,6);
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('evaluation_parameters_rule','strike4','217','CAP',NULL,7);
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('evaluation_parameters_rule','strike4','219','Upper Barrier',NULL,8);
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('evaluation_parameters_rule','strike4','226','Coupon',NULL,9);
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('evaluation_parameters_rule','strike4','216','Reference Level',NULL,10);
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('evaluation_parameters_rule','strike4','221','Participation Level',NULL,11);
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('evaluation_parameters_rule','strike4','224','Lower Knock In Level',NULL,12);
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('evaluation_parameters_rule','strike4','225','Upper Knock In Level',NULL,13);

-- barrier4Unit
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('evaluation_parameters_rule','barrier4Unit','1','Currency',NULL,1);
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('evaluation_parameters_rule','barrier4Unit','2','Percentage',NULL,2);
insert into rules.list_model_descriptor(table_name,attribute_name,value,display_name,description,sort_order)
 values('evaluation_parameters_rule','barrier4Unit','3','Index Points',NULL,3);


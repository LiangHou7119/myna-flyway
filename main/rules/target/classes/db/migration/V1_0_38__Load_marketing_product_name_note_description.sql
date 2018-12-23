/**
 * Author:  Bruce Wang
 * Created: Apr 6, 2018
 */

truncate table rules.marketing_product_name_note_description;

INSERT INTO rules.marketing_product_name_note_description(note,description,created,createdBy,lastModified,lastModifiedBy) VALUES('Note 1','Delivers stock if the price at expiry is below a cap aka strike short call set ATM. If price at expiry is equal to or above the cap pays cash equal to the difference between a strike long call set to a nominal amount and the cap.','now()','10000','now()','10000');
INSERT INTO rules.marketing_product_name_note_description(note,description,created,createdBy,lastModified,lastModifiedBy) VALUES('Note 2','Pays an amount equal to the number of days the asset price remains in a range defined by upper and lower barrier levels over a specified period multiplied by a daily accrual amount limited by a specified maximum pay-off amount.','now()','10000','now()','10000');
INSERT INTO rules.marketing_product_name_note_description(note,description,created,createdBy,lastModified,lastModifiedBy) VALUES('Note 3','Pays the difference if positive between the asset price at exercise and a fixed strike price provided that the minimum price achieved at exercise is greater than or equal to a specified barrier else zero.','now()','10000','now()','10000');
INSERT INTO rules.marketing_product_name_note_description(note,description,created,createdBy,lastModified,lastModifiedBy) VALUES('Note 4','Pays the difference if positive between the price of asset 1 and the price of asset 2 at exercise else zero.','now()','10000','now()','10000');
INSERT INTO rules.marketing_product_name_note_description(note,description,created,createdBy,lastModified,lastModifiedBy) VALUES('Note 5','Pays the nth power of the difference if positive between the asset price at maturity and a fixed strike price (or a proportion of this difference) else zero.','now()','10000','now()','10000');
INSERT INTO rules.marketing_product_name_note_description(note,description,created,createdBy,lastModified,lastModifiedBy) VALUES('Note 6','Pays the nth power of the difference if positive between a fixed strike price and the asset price at maturity (or a proportion of this difference) else zero.','now()','10000','now()','10000');
INSERT INTO rules.marketing_product_name_note_description(note,description,created,createdBy,lastModified,lastModifiedBy) VALUES('Note 7','Pays the difference if positive between a fixed strike price and an asset price at maturity converted to another currency based on an exchange rate specified at issue.','now()','10000','now()','10000');
INSERT INTO rules.marketing_product_name_note_description(note,description,created,createdBy,lastModified,lastModifiedBy) VALUES('Note 8','Pays the difference if positive between a fixed strike price and the asset price at maturity provided that the maximum price achieved at maturity is less than or equal to a specified barrier else zero.','now()','10000','now()','10000');

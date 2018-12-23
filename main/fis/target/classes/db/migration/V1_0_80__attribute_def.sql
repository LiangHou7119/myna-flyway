/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  u8017655
 * Created: Jun 12, 2018
 */

create table inserv.attribute_def(def_id bigint not null primary key, def_name varchar(100) not null );
insert into inserv.attribute_def values(100, 'RIC');
insert into inserv.attribute_def values(101, 'ISIN');
insert into inserv.attribute_def values(102, 'CUSIP');
insert into inserv.attribute_def values(103, 'Ticker Symbol');
insert into inserv.attribute_def values(104, 'CIN CUSIP');
insert into inserv.attribute_def values(105, 'Marketing Product Name');
insert into inserv.attribute_def values(106, 'RTR CFI CODE');
insert into inserv.attribute_def values(107, 'VALOREN');
insert into inserv.attribute_def values(108, 'WERT');
insert into inserv.attribute_def values(109, 'Short Name');
insert into inserv.attribute_def values(110, 'Common Name');
insert into inserv.attribute_def values(111, 'Issue Currency');
insert into inserv.attribute_def values(112, 'Is Quote Of');
insert into inserv.attribute_def values(113, 'Trading Status');
insert into inserv.attribute_def values(114, 'First Trading Date');
insert into inserv.attribute_def values(115, 'Market Maker');
insert into inserv.attribute_def values(116, 'Issuer');
insert into inserv.attribute_def values(117, '144A Registered Flag');
insert into inserv.attribute_def values(118, 'Asset Class');
insert into inserv.attribute_def values(119, 'Trades on Market');
insert into inserv.attribute_def values(120, 'Trades On Submarket');
insert into inserv.attribute_def values(121, 'PermID');
insert into inserv.attribute_def values(122, 'Round Lot Size');
insert into inserv.attribute_def values(123, 'Instrument Status');
insert into inserv.attribute_def values(125, 'Underwriter');
insert into inserv.attribute_def values(126, 'Guarantor');
insert into inserv.attribute_def values(127, 'Clearing House');
insert into inserv.attribute_def values(128, 'Secondary Listing Place');
insert into inserv.attribute_def values(129, 'ISMA Number');
insert into inserv.attribute_def values(130, 'Admin Status');
insert into inserv.attribute_def values(131, 'EUSIPA Classification');
insert into inserv.attribute_def values(132, 'Form');
insert into inserv.attribute_def values(134, 'Call Put Option');
insert into inserv.attribute_def values(135, 'Exercise Style');
insert into inserv.attribute_def values(136, 'Expiry Date');
insert into inserv.attribute_def values(137, 'Private Placement Indicator');
insert into inserv.attribute_def values(138, 'Warrant Note');
insert into inserv.attribute_def values(139, 'Trading Symbol');
insert into inserv.attribute_def values(140, 'Trading Group');
insert into inserv.attribute_def values(141, 'Delist Date');
insert into inserv.attribute_def values(142, 'Trading Type');
insert into inserv.attribute_def values(143, 'Price Convention');
insert into inserv.attribute_def values(144, 'PAKO Period');
insert into inserv.attribute_def values(145, 'ANNA CFI Code');
insert into inserv.attribute_def values(146, 'LSE CFI Code');
insert into inserv.attribute_def values(147, 'Common Code');
insert into inserv.attribute_def values(148, 'FTT Applied');
insert into inserv.attribute_def values(149, 'Fully Funded Flag');
insert into inserv.attribute_def values(150, 'Quotation Currency');
insert into inserv.attribute_def values(151, 'Issue Date');
insert into inserv.attribute_def values(152, 'Issue Quantity');
insert into inserv.attribute_def values(154, 'Settlement Currency');
insert into inserv.attribute_def values(155, 'Settlement Period');
insert into inserv.attribute_def values(156, 'Stamp Duty');
insert into inserv.attribute_def values(157, 'Warrant Main Quote');
insert into inserv.attribute_def values(158, 'SEDOL');
insert into inserv.attribute_def values(159, 'Issue Price');
insert into inserv.attribute_def values(160, 'Exercise Schedule');
insert into inserv.attribute_def values(161, 'Stub ISIN');
insert into inserv.attribute_def values(162, 'Stub RIC');
insert into inserv.attribute_def values(163, 'Stub Listing Place');
insert into inserv.attribute_def values(164, 'Stub Currency');
insert into inserv.attribute_def values(165, 'Delisting Reason');
insert into inserv.attribute_def values(2, 'Underlying Type');
insert into inserv.attribute_def values(133, 'Settlement Type');
insert into inserv.attribute_def values(200, 'Ratio');
insert into inserv.attribute_def values(205, 'Weighting');
insert into inserv.attribute_def values(206, 'Common Name');
insert into inserv.attribute_def values(209, 'Asset Class');
insert into inserv.attribute_def values(212, 'Exercise Quantity');
insert into inserv.attribute_def values(213, 'Protection Level');
insert into inserv.attribute_def values(214, 'Coupon Level');
insert into inserv.attribute_def values(215, 'Bonus Level');
insert into inserv.attribute_def values(216, 'Reference Level');
insert into inserv.attribute_def values(217, 'CAP');
insert into inserv.attribute_def values(218, 'Lower Barrier');
insert into inserv.attribute_def values(219, 'Upper Barrier');
insert into inserv.attribute_def values(220, 'Strike Price');
insert into inserv.attribute_def values(221, 'Participation Level');
insert into inserv.attribute_def values(222, 'Upper Knock Out Level');
insert into inserv.attribute_def values(223, 'Lower Knock Out Level');
insert into inserv.attribute_def values(224, 'Lower Knock In Level');
insert into inserv.attribute_def values(225, 'Upper Knock In Level');
insert into inserv.attribute_def values(226, 'Coupon');
insert into inserv.attribute_def values(227, 'Exchange Underlying Type');
insert into inserv.attribute_def values(228, 'Designation');
insert into inserv.attribute_def values(229, 'Alternative Code');
insert into inserv.attribute_def values(1001, 'Tranche Issue');
insert into inserv.attribute_def values(1002, 'Tranche Price');
insert into inserv.attribute_def values(1003, 'Tranche Listing Date');
insert into inserv.attribute_def values(1004, 'Tranche Reference');

commit;


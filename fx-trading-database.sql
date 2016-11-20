-- Host: localhost
-- Server version: 5.0.45
-- PHP Version: 5.2.5-0.dotdeb.2

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `fx_trading_core`
--

CREATE TABLE IF NOT EXISTS `admin_users` (
  `user_id` int(11) NOT NULL auto_increment,
  `invited_by` int(11) NOT NULL,
  `institution_id` int(11) default NULL,
  `is_institution_admin` tinyint(1) NOT NULL,
  `child_of_id` int(11) default NULL,
  `user_photo` varchar(256) NOT NULL,
  `first_name` varchar(128) default NULL,
  `middle_name` varchar(64) NOT NULL,
  `last_name` varchar(128) default NULL,
  `title` varchar(32) default NULL,
  `position` varchar(128) NOT NULL,
  `desk` varchar(32) default NULL,
  `email` varchar(128) NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(256) NOT NULL,
  `salt` varchar(3) NOT NULL,
  `address_1` varchar(128) default NULL,
  `address_2` varchar(128) default NULL,
  `city` varchar(64) default NULL,
  `state_providence` varchar(64) default NULL,
  `postal_code` varchar(32) default NULL,
  `country_code` varchar(2) default NULL,
  `phone_1` varchar(32) default NULL,
  `phone_2` varchar(32) default NULL,
  `fax` varchar(32) default NULL,
  `cell_area_code` int(4) default NULL,
  `cell_pre_fix` int(3) default NULL,
  `cell_last_four` int(5) default NULL,
  `signup_ip_address` varchar(16) default NULL,
  `activation_date` datetime NOT NULL,
  `creation_date` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `modification_date` datetime NOT NULL,
  `lastlogin_date` datetime NOT NULL,
  `lastlogout_date` datetime NOT NULL,
  `remember_me` tinyint(1) NOT NULL,
  `is_hidden` tinyint(1) NOT NULL,

CREATE TABLE IF NOT EXISTS `asset` (
  `asset_id` int(11) NOT NULL auto_increment,
  `symbol` char(2) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` varchar(128) NOT NULL,
  `creation_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `modification_date` timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`asset_id`),
  UNIQUE KEY `symbol` (`symbol`)
) ;

--
-- Dumping data for table `asset`
--

INSERT INTO `asset` (`asset_id`, `symbol`, `name`, `description`, `creation_date`, `modification_date`) VALUES
(1, 'F', 'FOREIGN CURRENCY', 'FOREIGN CURRENCY', '2008-04-15 13:23:55', '0000-00-00 00:00:00'),
(2, 'M', 'PRECIOUS METAL', 'PRECIOUS METAL', '2008-04-15 13:23:55', '0000-00-00 00:00:00'),
(3, 'C', 'COMMODITY', 'COMMODITY', '2008-04-15 13:24:23', '0000-00-00 00:00:00'),
(4, 'S', 'SECURITY ', 'SECURITY ', '2008-04-15 13:24:23', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `atomic_market`
--

CREATE TABLE IF NOT EXISTS `atomic_market` (
  `atomic_market_id` int(11) NOT NULL auto_increment,
  `market_id` int(11) default '0',
  `user_id` int(11) default '0',
  `institution_id` int(11) default '0',
  `parent_id` int(11) default '0',
  `internal_id` int(11) default '0',
  `version` int(11) NOT NULL default '1',
  `atomic_market_name` varchar(128) default NULL,
  `atomic_market_description` text,
  `instrument_name` varchar(64) default NULL,
  `instrument_description` text,
  `keyword` text,
  `market_definition` longblob NOT NULL,
  `performance` varchar(255) NOT NULL,
  `status` enum('test','prod') NOT NULL,
  `allowBidOfferLimitOrder` tinyint(1) NOT NULL,
  `allowBuySellLimitIocOrder` tinyint(1) NOT NULL,
  `allowBuySellFillOrKillOrder` tinyint(1) NOT NULL,
  `allowIcebergOrder` tinyint(1) NOT NULL,
  `allowBuySellStopLimitOrder` tinyint(1) NOT NULL,
  `dealing_data_qualifier_id` int(11) default '0',
  `dealing_data_transparency_id` int(11) default '0',
  `market_book_data_transparency_id` int(11) default '0',
  `market_type_id` int(11) default '0',
  `asset_id` int(11) default '0',
  `take_price_defined_as_id` int(11) default '0',
  `perTradeUnit` decimal(10,2) NOT NULL,
  `pipsEnd` tinyint(2) NOT NULL,
  `typicalSpread` decimal(10,3) NOT NULL,
  `wideSpread` decimal(10,3) NOT NULL,
  `marketThreshold` decimal(10,3) NOT NULL,
  `typicalPrice` decimal(10,4) NOT NULL,
  `pipGranularity` tinyint(1) NOT NULL,
  `separatePips` tinyint(1) NOT NULL,
  `pipsStart` tinyint(2) NOT NULL,
  `inputDifferentToDisplay` tinyint(1) NOT NULL,
  `pipsInputStart` tinyint(2) NOT NULL,
  `allPipsMustBeEntered` tinyint(1) NOT NULL,
  `commodityTraded_name` varchar(32) default NULL,
  `commodityTraded_description` varchar(64) default NULL,
  `commodityTraded_decimalPlaces` tinyint(3) NOT NULL,
  `commodityTraded_scaleFactor` tinyint(2) NOT NULL,
  `commodityTraded_lotSizeName` varchar(32) default NULL,
  `commodityTraded_lotSizeNameShort` varchar(64) default NULL,
  `commodityTraded_measurement_type_id` tinyint(11) default '0',
  `commodityTraded_increment` decimal(5,3) NOT NULL,
  `commodityTraded_maximum` decimal(5,3) NOT NULL,
  `commodityTraded_minimum` decimal(5,3) NOT NULL,
  `commodityPayment_name` varchar(32) default NULL,
  `commodityPayment_description` varchar(64) default NULL,
  `commodityPayment_decimalPlaces` tinyint(3) NOT NULL,
  `commodityPayment_scaleFactor` tinyint(2) NOT NULL,
  `commodityPayment_lotSizeName` varchar(32) default NULL,
  `commodityPayment_lotSizeNameShort` varchar(64) default NULL,
  `commodityPayment_measurement_type_id` tinyint(11) default '0',
  `commodityPayment_increment` decimal(5,3) NOT NULL,
  `commodityPayment_maximum` decimal(5,3) NOT NULL,
  `commodityPayment_minimum` decimal(5,3) NOT NULL,
  `is_complete` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `creation_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `modification_date` timestamp NOT NULL default '0000-00-00 00:00:00',
  `market_data_id` int(11) default '0',
  `filter_id` int(11) default '0',
  `markedForDeletion` tinyint(1) NOT NULL,
  PRIMARY KEY  (`atomic_market_id`),
  KEY `market_id` (`market_id`)
) ;

-- --------------------------------------------------------

--
-- Table structure for table `commodity`
--

CREATE TABLE IF NOT EXISTS `commodity` (
  `commodity_id` int(11) NOT NULL auto_increment,
  `commodity_name` varchar(128) NOT NULL,
  `commodity_description` text NOT NULL,
  `creation_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`commodity_id`)
) ;

--
-- Dumping data for table `commodity`
--


-- --------------------------------------------------------

--
-- Table structure for table `component`
--
-- Creation: Apr 22, 2008 at 02:39 PM
-- Last update: Apr 29, 2008 at 12:37 PM
-- Last check: Apr 29, 2008 at 12:37 PM
--

CREATE TABLE IF NOT EXISTS `component` (
  `component_id` int(11) NOT NULL auto_increment,
  `name` varchar(32) NOT NULL,
  `type` enum('DAD','ORP','ARM','MKD','TRC') NOT NULL,
  `region_id` int(11) default NULL,
  `MKD_component_id` int(11) NOT NULL,
  `note` text NOT NULL,
  `max_bandwidth` int(11) default NULL,
  `min_bandwidth` int(11) default NULL,
  `ip_address` varchar(16) NOT NULL,
  `status` varchar(16) NOT NULL,
  `creation_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `modification_date` timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`component_id`),
  UNIQUE KEY `name` (`name`),
  KEY `region_id` (`region_id`),
  KEY `MKD_component_id` (`MKD_component_id`)
) ;

--
-- Dumping data for table `component`
--

INSERT INTO `component` (`component_id`, `name`, `type`, `region_id`, `MKD_component_id`, `note`, `max_bandwidth`, `min_bandwidth`, `ip_address`, `status`, `creation_date`, `modification_date`) VALUES
(1, 'ARM001', 'ARM', 1, 6, '', 0, 0, '', '', '2008-03-31 16:02:22', '0000-00-00 00:00:00'),
(2, 'ARM002', 'ARM', 1, 6, '', NULL, NULL, '', '', '2008-03-31 16:03:10', '0000-00-00 00:00:00'),
(3, 'DAD001', 'DAD', 1, 6, '', NULL, NULL, '', '', '2008-03-31 16:03:53', '0000-00-00 00:00:00'),
(4, 'ORP001', 'ORP', 1, 6, '', NULL, NULL, '', '', '2008-03-31 16:04:31', '0000-00-00 00:00:00'),
(5, 'ORP002', 'ORP', 1, 6, '', NULL, NULL, '', '', '2008-03-31 16:05:03', '0000-00-00 00:00:00'),
(6, 'MKD001', 'MKD', 1, 6, '', NULL, NULL, '', '', '2008-03-31 16:07:29', '0000-00-00 00:00:00'),
(7, 'ARM003', 'ARM', 2, 8, '', NULL, NULL, '', '', '2008-04-01 14:50:46', '0000-00-00 00:00:00');

-- --------------------------------------------------------

CREATE TABLE IF NOT EXISTS `dealing_data_transparency` (
  `dealing_data_transparency_id` int(11) NOT NULL auto_increment,
  `name` varchar(32) NOT NULL,
  `description` varchar(128) NOT NULL,
  `creation_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `modification_date` timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`dealing_data_transparency_id`)
) ;

--
-- Dumping data for table `dealing_data_transparency`
--

-- --------------------------------------------------------

--
-- Table structure for table `deals`
--


CREATE TABLE IF NOT EXISTS `deals` (
  `deal_id` int(11) NOT NULL auto_increment,
  `order_buy_id` int(11) default NULL,
  `order_sell_id` int(11) default NULL,
  `deal_amount` int(11) default NULL,
  `deal_price` decimal(20,2) default NULL,
  `deal_date` int(20) default NULL,
  `settlement_date` datetime default NULL,
  `settlement_type` varchar(32) default NULL,
  `payment_bank_id` int(11) default NULL,
  `receive_bank_id` int(11) default NULL,
  `counterparty_trader_id` int(11) default NULL,
  `institution_id` int(11) default NULL,
  PRIMARY KEY  (`deal_id`)
) ;


-- --------------------------------------------------------


--
-- Table structure for table `institution_types`
--

CREATE TABLE IF NOT EXISTS `institution_types` (
  `institution_type_id` int(11) NOT NULL auto_increment,
  `institution_type` enum('CUST','SUPPLIER') NOT NULL,
  `institution_type_name` varchar(128) NOT NULL,
  `institution_type_desc` text NOT NULL,
  `institution_type_action` varchar(32) NOT NULL,
  PRIMARY KEY  (`institution_type_id`)
) ;

--
-- Dumping data for table `institution_types`
--

INSERT INTO `institution_types` (`institution_type_id`, `institution_type`, `institution_type_name`, `institution_type_desc`, `institution_type_action`) VALUES
(1, 'CUST', 'Bank Sell-Side Desk', 'Bank Sell-Side Desk:', ''),
(2, 'CUST', 'Bank Prop Desk', 'Bank Prop Desk: ', ''),
(3, 'CUST', 'Bank affiliated Fund/ Asset Manager', 'Bank affiliated Fund/ Asset Manager:', ''),
(4, 'CUST', 'Hedge Fund', 'Hedge Fund:', ''),
(5, 'CUST', 'Proprietary Trading Firm', 'Proprietary Trading Firm:', ''),
(6, 'CUST', 'Asset Manager', 'Asset Manager:', ''),
(7, 'CUST', 'Mutual Fund', 'Mutual Fund', ''),
(8, 'SUPPLIER', 'Broker-Dealer', '', ''),
(9, 'SUPPLIER', 'Exchange / Electronic Broker', 'Exchange / Electronic Broker:', ''),
(10, 'SUPPLIER', 'Voice Broker', 'Voice Broker:', ''),
(11, 'SUPPLIER', 'Prime Broker - Equities', 'Prime Broker - Equities:', 'define asset class'),
(12, 'SUPPLIER', 'Prime Broker - Futures', 'Prime Broker - Futures', 'define asset class'),
(13, 'SUPPLIER', 'Prime Broker - Not Futures or Futures', 'Prime Broker - Not Futures or Futures', 'define asset class');

-- --------------------------------------------------------

--
-- Table structure for table `market`
--

CREATE TABLE IF NOT EXISTS `market` (
  `market_id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL default '-1',
  `asset_id` int(11) NOT NULL default '-1',
  `market_type_id` int(11) NOT NULL default '-1',
  `market_name` varchar(128) default NULL,
  `market_description` text,
  `status` enum('test','prod','retired') NOT NULL,
  `market_open` time NOT NULL,
  `market_close` time NOT NULL,
  `is_test` tinyint(1) NOT NULL,
  `organization_level_1_name` varchar(128) NOT NULL,
  `organization_level_1_description` varchar(256) NOT NULL,
  `organization_level_2_name` varchar(128) NOT NULL,
  `organization_level_2_description` varchar(256) NOT NULL,
  `organization_level_3_name` varchar(128) NOT NULL,
  `organization_level_3_description` varchar(256) NOT NULL,
  `organization_level_4_name` varchar(128) NOT NULL,
  `organization_level_4_description` varchar(256) NOT NULL,
  `organization_level_5_name` varchar(128) NOT NULL,
  `organization_level_5_description` varchar(256) NOT NULL,
  `notes` text NOT NULL,
  `extra` text NOT NULL,
  `filter_id` int(11) NOT NULL default '-1',
  `creation_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `modification_date` datetime NOT NULL,
  PRIMARY KEY  (`market_id`)
) ;

--
-- Dumping data for table `market`
--

INSERT INTO `market` (`market_id`, `user_id`, `asset_id`, `market_type_id`, `market_name`, `market_description`, `status`, `market_open`, `market_close`, `is_test`, `organization_level_1_name`, `organization_level_1_description`, `organization_level_2_name`, `organization_level_2_description`, `organization_level_3_name`, `organization_level_3_description`, `organization_level_4_name`, `organization_level_4_description`, `organization_level_5_name`, `organization_level_5_description`, `notes`, `extra`, `filter_id`, `creation_date`, `modification_date`) VALUES
(12, 1, 1, 1, 'Tokyo Spot', '', 'test', '00:00:00', '00:00:00', 1, 'Global FX', 'Subi Bank Global FX', 'Tokyo FX', 'Subi Bank Tokyo FX', 'Tokyo Spot Desk', '', '', '', '', '', '', '', -1, '2008-05-06 17:03:48', '2008-05-06 17:09:27'),
(11, 1, 1, 1, 'New York Spot', '', 'test', '00:00:00', '00:00:00', 1, 'Global FX', 'Subi Bank Global FX', 'New York FX', 'Subi Bank New York FX', 'New York Spot Desk', '', '', '', '', '', '', '', -1, '2008-05-06 17:00:24', '2008-05-06 17:09:27'),
(10, 1, 1, 1, 'Spot Emerging Markets', 'Subi Bank London FX Spot G7 Emerging Markets', 'test', '00:00:00', '00:00:00', 1, 'Global FX', 'Subi Bank Global FX', 'London FX', 'Subi Bank London FX', 'London Spot Desk', 'Subi Bank London FX Spot Desk', '', '', '', '', '', '', -1, '2008-05-06 16:52:49', '2008-05-06 17:14:35'),
(13, 1, 1, 1, 'Stockholm Spot', '', 'test', '00:00:00', '00:00:00', 1, 'Global FX', 'Subi Bank Global FX', 'Stockholm FX', 'Subi Bank Stockholm\r FX', 'Stockholm Spot Desk', '', '', '', '', '', '', '', -1, '2008-05-06 17:06:21', '2008-05-06 17:10:45'),
(9, 1, 1, 1, 'Spot G7', 'Subi Bank London FX Spot G7 Market', 'test', '00:00:00', '00:00:00', 1, 'Global FX', 'Subi Bank Global FX', 'London FX', 'Subi Bank London FX', 'London Spot Desk', 'Subi Bank London FX Spot Desk', '', '', '', '', '', '', -1, '2008-05-06 16:41:26', '2008-05-06 17:10:45'),
(15, 1, 1, 1, 'Cayman Islands', 'Slush funds', 'test', '00:00:00', '00:00:00', 1, 'Other Activities', '', '', '', '', '', '', '', '', '', '', '', -1, '2008-05-13 12:34:48', '0000-00-00 00:00:00'),
(16, 1, 1, 1, 'St Peter Port - Guernsey', '', 'test', '00:00:00', '00:00:00', 1, 'Other Activities', '', '', '', '', '', '', '', '', '', '', '', -1, '2008-05-13 12:51:32', '0000-00-00 00:00:00'),
(17, 1, 1, 1, 'Gibraltar', '', 'test', '00:00:00', '00:00:00', 1, 'Other Activities', '', '', '', '', '', '', '', '', '', '', '', -1, '2008-05-13 14:18:11', '0000-00-00 00:00:00'),
(18, 1, 1, 1, 'Isle of Man', '', 'test', '00:00:00', '00:00:00', 1, 'Other Activities', '', '', '', '', '', '', '', '', '', '', '', -1, '2008-05-13 14:20:48', '0000-00-00 00:00:00'),
(24, 1, 1, 1, 'Bermuda', '', 'test', '00:00:00', '00:00:00', 1, 'Other Activities', '', '', '', '', '', '', '', '', '', '', '', -1, '2008-05-13 14:58:32', '2008-05-13 15:00:47');

-- --------------------------------------------------------

--
-- Table structure for table `market_book_data_transparency`
--

CREATE TABLE IF NOT EXISTS `market_book_data_transparency` (
  `market_book_data_transparency_id` int(11) NOT NULL auto_increment,
  `name` varchar(32) NOT NULL,
  `description` varchar(128) NOT NULL,
  `creation_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `modification_date` timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`market_book_data_transparency_id`)
) ;

--
-- Dumping data for table `market_book_data_transparency`
--

INSERT INTO `market_book_data_transparency` (`market_book_data_transparency_id`, `name`, `description`, `creation_date`, `modification_date`) VALUES
(1, 'NONE', 'NONE', '2008-04-15 13:01:17', '0000-00-00 00:00:00'),
(2, 'ORDER PRESENCE', 'ORDER PRESENCE', '2008-04-15 13:01:17', '0000-00-00 00:00:00'),
(3, 'BID/OFFER PRESENCE', 'BID/OFFER PRESENCE', '2008-04-15 13:01:42', '0000-00-00 00:00:00'),
(4, 'BEST BID/OFFER', 'BEST BID/OFFER', '2008-04-15 13:01:42', '0000-00-00 00:00:00'),
(5, 'REGULAR BID/OFFER', 'REGULAR BID/OFFER', '2008-04-15 13:02:04', '0000-00-00 00:00:00'),
(6, 'BID/OFFER PRICE & AMOUNT', 'BID/OFFER PRICE & AMOUNT', '2008-04-15 13:02:04', '0000-00-00 00:00:00'),
(7, 'LIQUIDITY LEVELS', 'LIQUIDITY LEVELS', '2008-04-15 13:02:27', '0000-00-00 00:00:00'),
(8, 'ANONYMOUS MARKET BOOK', 'ANONYMOUS MARKET BOOK', '2008-04-15 13:02:27', '0000-00-00 00:00:00'),
(9, 'FULL MARKET BOOK', 'FULL MARKET BOOK', '2008-04-15 13:02:40', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `market_configuration`
--

CREATE TABLE IF NOT EXISTS `market_configuration` (
  `market_configuration_id` int(11) NOT NULL auto_increment,
  `atomic_market_id` int(11) NOT NULL,
  `component_id` int(11) NOT NULL,
  `component_name` varchar(32) NOT NULL,
  `date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `notes` text NOT NULL,
  PRIMARY KEY  (`market_configuration_id`),
  KEY `atomic_market_id` (`atomic_market_id`,`component_id`)
) ;


-- --------------------------------------------------------

--
-- Table structure for table `market_places`
--

CREATE TABLE IF NOT EXISTS `market_places` (
  `market_place_id` int(11) NOT NULL auto_increment,
  `institution_id` int(11) NOT NULL,
  `creator_id` int(11) NOT NULL,
  `market_place_name` varchar(128) NOT NULL,
  `market_place_description` text NOT NULL,
  `is_live` tinyint(4) NOT NULL,
  `creation_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `modification_date` datetime NOT NULL,
  `notes` text NOT NULL,
  PRIMARY KEY  (`market_place_id`)
)  ;

--
-- Dumping data for table `market_places`
--
-- --------------------------------------------------------

--
-- Table structure for table `market_type`
--

CREATE TABLE IF NOT EXISTS `market_type` (
  `market_type_id` int(11) NOT NULL auto_increment,
  `name` varchar(32) NOT NULL,
  `description` varchar(128) NOT NULL,
  `creation_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `modification_date` timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`market_type_id`)
) ;

--
-- Dumping data for table `market_type`
--

INSERT INTO `market_type` (`market_type_id`, `name`, `description`, `creation_date`, `modification_date`) VALUES
(1, 'SPOT', 'SPOT', '2008-04-15 12:52:45', '0000-00-00 00:00:00'),
(2, 'OUTRIGHT FORWARD', 'OUTRIGHT FORWARD', '2008-04-15 12:52:45', '0000-00-00 00:00:00'),
(3, 'FORWARD SWAP', 'FORWARD SWAP', '2008-04-15 12:53:12', '0000-00-00 00:00:00'),
(4, 'NDF/CFD/FRA', 'NDF/CFD/FRA', '2008-04-15 12:53:12', '0000-00-00 00:00:00'),
(5, 'OPTIONS', 'OPTIONS', '2008-04-15 12:53:38', '0000-00-00 00:00:00'),
(6, 'GENERALIZED SWAPS', 'GENERALIZED SWAPS', '2008-04-15 12:53:38', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `measurement_type`
--

CREATE TABLE IF NOT EXISTS `measurement_type` (
  `measurement_type_id` int(11) NOT NULL auto_increment,
  `name` varchar(32) NOT NULL,
  `description` varchar(64) NOT NULL,
  `creation_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `modification_date` timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`measurement_type_id`)
)  ;

--
-- Dumping data for table `measurement_type`
--

INSERT INTO `measurement_type` (`measurement_type_id`, `name`, `description`, `creation_date`, `modification_date`) VALUES
(1, 'CUSTOM', 'CUSTOM', '2008-04-16 16:32:00', '0000-00-00 00:00:00'),
(2, 'CURRENCY', 'CURRENCY', '2008-04-16 16:32:00', '0000-00-00 00:00:00'),
(3, 'VOLUME', 'VOLUME', '2008-04-16 16:32:17', '0000-00-00 00:00:00'),
(4, 'WEIGHT', 'WEIGHT', '2008-04-16 16:32:17', '0000-00-00 00:00:00'),
(5, 'POWER', 'POWER', '2008-04-16 16:32:29', '0000-00-00 00:00:00'),
(6, 'POWER', 'POWER', '2008-04-16 16:32:29', '0000-00-00 00:00:00'),
(7, 'TEMPERATURE', 'TEMPERATURE', '2008-04-16 16:32:47', '0000-00-00 00:00:00'),
(8, 'TIME', 'TIME', '2008-04-16 16:32:47', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `order_id` int(11) NOT NULL auto_increment,
  `order_interruption_reason` int(11) default NULL,
  `order_interruption_result` int(11) default NULL,
  `order_price` decimal(20,2) default NULL,
  `order_status` int(11) default NULL,
  `order_submission_result` int(11) default NULL,
  `order_type` enum('BID/OFFER LIMIT','BUY/SELL IOC','BUY/SELL FILL OR KILL','ICEBERG','BUY/SELL STOP LIMIT') default NULL,
  `order_date` datetime default NULL,
  `order_amount` int(25) default NULL,
  `atomic_market_id` int(11) default NULL,
  `creator_id` int(11) default NULL,
  `institution_id` int(11) default NULL,
  PRIMARY KEY  (`order_id`)
) ;

--
-- Dumping data for table `orders`
--


-- --------------------------------------------------------

--
-- Table structure for table `region`
--

CREATE TABLE IF NOT EXISTS `region` (
  `region_id` int(11) NOT NULL auto_increment,
  `region_name` varchar(64) character set armscii8 NOT NULL,
  `country_code` varchar(3) character set armscii8 NOT NULL,
  `time_zone` varchar(16) character set armscii8 NOT NULL,
  PRIMARY KEY  (`region_id`)
) ;

--
-- Dumping data for table `region`
--

INSERT INTO `region` (`region_id`, `region_name`, `country_code`, `time_zone`) VALUES
(1, 'NY', 'US', ''),
(2, 'LN', 'UK', '');

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE IF NOT EXISTS `session` (
  `session_id` int(11) NOT NULL auto_increment,
  `component_name` varchar(32) character set armscii8 NOT NULL,
  `started` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `ended` timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`session_id`)
) ;

--
-- Dumping data for table `session`
--

INSERT INTO `session` (`session_id`, `component_name`, `started`, `ended`) VALUES
(1, 'BAD001', '2008-04-09 17:59:44', '0000-00-00 00:00:00'),
(2, 'DAD002', '2008-04-09 17:59:59', '0000-00-00 00:00:00'),
(3, 'TRC001', '2008-04-27 08:46:47', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `take_price_defined_as`
--

CREATE TABLE IF NOT EXISTS `take_price_defined_as` (
  `take_price_defined_as_id` int(11) NOT NULL auto_increment,
  `name` varchar(32) NOT NULL,
  `description` varchar(128) NOT NULL,
  `creation_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `modification_date` timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`take_price_defined_as_id`)
) ;

--
-- Dumping data for table `take_price_defined_as`
--

INSERT INTO `take_price_defined_as` (`take_price_defined_as_id`, `name`, `description`, `creation_date`, `modification_date`) VALUES
(1, 'Average Price Obtained', 'Average Price Obtained', '2008-04-15 18:57:35', '0000-00-00 00:00:00'),
(2, 'Best Price Obtained', 'Best Price Obtained"', '2008-04-15 18:57:35', '0000-00-00 00:00:00'),
(3, 'worst Price Obtained', 'orst Price Obtained', '2008-04-15 18:57:49', '0000-00-00 00:00:00');

-- --------------------------------------------------------




--
-- Table structure for table `traders`
--

CREATE TABLE IF NOT EXISTS `traders` (
  `trader_id` int(11) NOT NULL auto_increment,
  `trading_floor_id` int(11) NOT NULL,
  `institution_id` int(11) NOT NULL,
  `user_id` int(11) default NULL,
  `is_admin` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `creation_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `modification_date` timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`trader_id`),
  UNIQUE KEY `trading_floor_id-user_id` (`trading_floor_id`,`user_id`)
) ;

--
-- Dumping data for table `traders`
--

-- --------------------------------------------------------

--
-- Table structure for table `trading_floors`
--

CREATE TABLE IF NOT EXISTS `trading_floors` (
  `trading_floor_id` int(11) NOT NULL auto_increment,
  `trading_code` varchar(16) default NULL,
  `institution_id` int(11) default '0',
  `trading_floor_name` varchar(128) NOT NULL,
  `trading_floor_description` text NOT NULL,
  `creation_date` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `modification_date` timestamp NULL default NULL,
  `filter_id` int(11) default NULL,
  PRIMARY KEY  (`trading_floor_id`)
) ;

--
-- Dumping data for table `trading_floors`
--


-- --------------------------------------------------------

--
-- Table structure for table `trading_groups`
--
-

CREATE TABLE IF NOT EXISTS `trading_groups` (
  `trading_group_id` int(11) NOT NULL auto_increment,
  `market_group_name` varchar(64) default NULL,
  `atomic_market_id` int(11) default NULL,
  `trading_floor_id` int(11) default NULL,
  `market_group_description` text,
  `creation_date` datetime default NULL,
  `institution_id` int(11) default NULL,
  `single_prime_broker` int(11) default NULL,
  `trader_id` int(11) default NULL,
  PRIMARY KEY  (`trading_group_id`)
) ;



-- --------------------------------------------------------

--
-- Table structure for table `users`
--
-- Creation: Apr 11, 2008 at 03:35 PM
-- Last update: May 14, 2008 at 11:12 AM
-- Last check: May 14, 2008 at 11:12 AM
--

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL auto_increment,
  `invited_by` int(11) NOT NULL,
  `institution_id` int(11) default NULL,
  `is_institution_admin` tinyint(1) NOT NULL,
  `child_of_id` int(11) default NULL,
  `user_photo` varchar(256) NOT NULL,
  `first_name` varchar(128) default NULL,
  `middle_name` varchar(64) NOT NULL,
  `last_name` varchar(128) default NULL,
  `title` varchar(32) default NULL,
  `position` varchar(128) NOT NULL,
  `desk` varchar(32) default NULL,
  `email` varchar(128) NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(256) NOT NULL,
  `salt` varchar(3) NOT NULL,
  `address_1` varchar(128) default NULL,
  `address_2` varchar(128) default NULL,
  `city` varchar(64) default NULL,
  `state_providence` varchar(64) default NULL,
  `postal_code` varchar(32) default NULL,
  `country_code` varchar(2) default NULL,
  `phone_1` varchar(32) default NULL,
  `phone_2` varchar(32) default NULL,
  `fax` varchar(32) default NULL,
  `cell_area_code` int(4) default NULL,
  `cell_pre_fix` int(3) default NULL,
  `cell_last_four` int(5) default NULL,
  `signup_ip_address` varchar(16) default NULL,
  `activation_date` datetime NOT NULL,
  `creation_date` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `modification_date` datetime NOT NULL,
  `lastlogin_date` datetime NOT NULL,
  `lastlogout_date` datetime NOT NULL,
  `remember_me` tinyint(1) NOT NULL,
  `is_hidden` tinyint(1) NOT NULL,
  `is_confirmed` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_private` tinyint(1) NOT NULL,
  `filter_id` int(11) default NULL,
  `is_name_private` tinyint(1) default NULL,
  `is_email_private` tinyint(1) default NULL,
  `is_username_private` tinyint(1) NOT NULL,
  `is_email_domain_private` tinyint(1) NOT NULL,
  `is_company_name_private` tinyint(1) default NULL,
  `is_position_private` tinyint(1) NOT NULL,
  `is_address_private` tinyint(1) NOT NULL,
  `is_desk_private` tinyint(1) default NULL,
  `is_phone_1_private` tinyint(1) NOT NULL,
  `is_phone_2_private` tinyint(1) NOT NULL,
  `is_fax_private` tinyint(1) NOT NULL,
  `is_cell_private` tinyint(1) NOT NULL,
  `is_personal_email_private` tinyint(1) NOT NULL,
  `region_id` int(11) default NULL,
  `ranking` int(4) default NULL,
  `personal_emails` varchar(128) default NULL,
  `asset_class` varchar(32) default NULL,
  `company_type` varchar(32) default NULL,
  PRIMARY KEY  (`user_id`),
  KEY `filter_id` (`filter_id`),
  KEY `institution_id` (`institution_id`),
  KEY `invited_by` (`invited_by`),
  KEY `child_of_id` (`child_of_id`)
) ;

--
-- Dumping data for table `users`
--



--
-- Table structure for table `version`
--
--

CREATE TABLE IF NOT EXISTS `version` (
  `number` decimal(5,3) NOT NULL,
  `svn_previous_revision` int(5) NOT NULL,
  `name` varchar(32) NOT NULL,
  `status` enum('DEV','BETA','ALPHA','PRODUCTION') NOT NULL,
  `comment` varchar(255) NOT NULL,
  `added` text NOT NULL,
  `dropped` text NOT NULL,
  `altered` text NOT NULL,
  `sp_log` text NOT NULL,
  `date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`number`)
) ;


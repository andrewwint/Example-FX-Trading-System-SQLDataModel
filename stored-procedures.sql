--
-- Procedures
--
DELIMITER $$
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllMyMarketDefs`(arm_name CHAR(16) )
BEGIN 
      SELECT 
      b.atomic_market_id,
	  b.market_id,
	  b.user_id,
	  b.institution_id,
	  b.parent_id,
	  b.internal_id,
	  b.version,
	  b.atomic_market_name,
	  b.atomic_market_description,
	  b.instrument_name,
	  b.instrument_description,
	  b.keyword,
	  b.market_definition,
	  b.performance,
	  b.status,
	  b.allowBidOfferLimitOrder,
	  b.allowBuySellLimitIocOrder,
	  b.allowBuySellFillOrKillOrder,
	  b.allowIcebergOrder,
	  b.allowBuySellStopLimitOrder,
	  b.dealing_data_qualifier_id,
	  b.dealing_data_transparency_id,
	  b.market_book_data_transparency_id,
	  b.market_type_id,
	  b.asset_id,
	  b.take_price_defined_as_id,
	  b.perTradeUnit,
	  b.pipsEnd,
	  b.typicalSpread,
	  b.wideSpread,
	  b.marketThreshold,
	  b.typicalPrice,
	  b.pipGranularity,
	  b.separatePips,
	  b.pipsStart,
	  b.inputDifferentToDisplay,
	  b.pipsInputStart,
	  b.allPipsMustBeEntered,
	  b.commodityTraded_name,
	  b.commodityTraded_description,
	  b.commodityTraded_decimalPlaces,
	  b.commodityTraded_scaleFactor,
	  b.commodityTraded_lotSizeName,
	  b.commodityTraded_lotSizeNameShort,
	  b.commodityTraded_measurement_type_id,
	  b.commodityTraded_increment,
	  b.commodityTraded_maximum,
	  b.commodityTraded_minimum,
	  b.commodityPayment_name,
	  b.commodityPayment_description,
	  b.commodityPayment_decimalPlaces,
	  b.commodityPayment_scaleFactor,
	  b.commodityPayment_lotSizeName,
	  b.commodityPayment_lotSizeNameShort,
	  b.commodityPayment_measurement_type_id,
	  b.commodityPayment_increment,
	  b.commodityPayment_maximum,
	  b.commodityPayment_minimum,
	  b.is_complete,
	  b.is_active,
	  b.creation_date,
	  b.modification_date,
	  b.market_data_id,
	  b.filter_id,
	  b.markedForDeletion
       FROM 
          market_configuration AS a 
       LEFT JOIN 
          atomic_market AS b 
       ON 
          a.atomic_market_id = b.atomic_market_id 
       AND 
          b.markedForDeletion = 0 
       WHERE 
          a.component_id = (SELECT component_id FROM component WHERE name = arm_name);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllMyMarkets`(arm_name CHAR(50) )
BEGIN SELECT b.atomic_market_id, b.version  FROM market_configuration AS a LEFT JOIN atomic_markets AS b ON a.atomic_market_id = b.atomic_market_id WHERE a.component_id = (SELECT component_id FROM component WHERE name = arm_name);  END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllOrderProcessors`( )
BEGIN SELECT component_id, name FROM component WHERE type = 'ORP'; END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllTraderMarketDefs`(trader_id INT )
BEGIN
  SELECT 
	  a.market_id,
	  a.user_id,
	  a.asset_id,
	  a.market_type_id,
	  a.market_name,
	  a.market_description,
	  a.status,
	  a.market_open,
	  a.market_close,
	  a.is_test,
	  a.organization_level_1_name,
	  a.organization_level_1_description,
	  a.organization_level_2_name,
	  a.organization_level_2_description,
	  a.organization_level_3_name,
	  a.organization_level_3_description,
	  a.organization_level_4_name,
	  a.organization_level_4_description,
	  a.organization_level_5_name,
	  a.organization_level_5_description,
	  a.notes,
	  a.extra,
	  a.filter_id,
	  a.creation_date,
	  a.modification_date,
	  b.atomic_market_id,
	  b.market_id,
	  b.user_id,
	  b.institution_id,
	  b.parent_id,
	  b.internal_id,
	  b.version,
	  b.atomic_market_name,
	  b.atomic_market_description,
	  b.instrument_name,
	  b.instrument_description,
	  b.keyword,
	  b.market_definition,
	  b.performance,
	  b.status,
	  b.allowBidOfferLimitOrder,
	  b.allowBuySellLimitIocOrder,
	  b.allowBuySellFillOrKillOrder,
	  b.allowIcebergOrder,
	  b.allowBuySellStopLimitOrder,
	  b.dealing_data_qualifier_id,
	  b.dealing_data_transparency_id,
	  b.market_book_data_transparency_id,
	  b.market_type_id,
	  b.asset_id,
	  b.take_price_defined_as_id,
	  b.perTradeUnit,
	  b.pipsEnd,
	  b.typicalSpread,
	  b.wideSpread,
	  b.marketThreshold,
	  b.typicalPrice,
	  b.pipGranularity,
	  b.separatePips,
	  b.pipsStart,
	  b.inputDifferentToDisplay,
	  b.pipsInputStart,
	  b.allPipsMustBeEntered,
	  b.commodityTraded_name,
	  b.commodityTraded_description,
	  b.commodityTraded_decimalPlaces,
	  b.commodityTraded_scaleFactor,
	  b.commodityTraded_lotSizeName,
	  b.commodityTraded_lotSizeNameShort,
	  b.commodityTraded_measurement_type_id,
	  b.commodityTraded_increment,
	  b.commodityTraded_maximum,
	  b.commodityTraded_minimum,
	  b.commodityPayment_name,
	  b.commodityPayment_description,
	  b.commodityPayment_decimalPlaces,
	  b.commodityPayment_scaleFactor,
	  b.commodityPayment_lotSizeName,
	  b.commodityPayment_lotSizeNameShort,
	  b.commodityPayment_measurement_type_id,
	  b.commodityPayment_increment,
	  b.commodityPayment_maximum,
	  b.commodityPayment_minimum,
	  b.is_complete,
	  b.is_active,
	  b.creation_date,
	  b.modification_date,
	  b.market_data_id,
	  b.filter_id,
	  b.markedForDeletion
  FROM 
	  market AS a 
  LEFT JOIN 
	  atomic_market AS b 
  ON 
	  a.market_id = b.market_id
  AND
      b.markedForDeletion = 0;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllUserMarketDefs`(creator_id INT )
BEGIN
  SELECT 
	  a.market_id,
	  a.user_id,
	  a.asset_id,
	  a.market_type_id,
	  a.market_name,
	  a.market_description,
	  a.status,
	  a.market_open,
	  a.market_close,
	  a.is_test,
	  a.organization_level_1_name,
	  a.organization_level_1_description,
	  a.organization_level_2_name,
	  a.organization_level_2_description,
	  a.organization_level_3_name,
	  a.organization_level_3_description,
	  a.organization_level_4_name,
	  a.organization_level_4_description,
	  a.organization_level_5_name,
	  a.organization_level_5_description,
	  a.notes,
	  a.extra,
	  a.filter_id,
	  a.creation_date,
	  a.modification_date,
	  b.atomic_market_id,
	  b.market_id,
	  b.user_id,
	  b.institution_id,
	  b.parent_id,
	  b.internal_id,
	  b.version,
	  b.atomic_market_name,
	  b.atomic_market_description,
	  b.instrument_name,
	  b.instrument_description,
	  b.keyword,
	  b.market_definition,
	  b.performance,
	  b.status,
	  b.allowBidOfferLimitOrder,
	  b.allowBuySellLimitIocOrder,
	  b.allowBuySellFillOrKillOrder,
	  b.allowIcebergOrder,
	  b.allowBuySellStopLimitOrder,
	  b.dealing_data_qualifier_id,
	  b.dealing_data_transparency_id,
	  b.market_book_data_transparency_id,
	  b.market_type_id,
	  b.asset_id,
	  b.take_price_defined_as_id,
	  b.perTradeUnit,
	  b.pipsEnd,
	  b.typicalSpread,
	  b.wideSpread,
	  b.marketThreshold,
	  b.typicalPrice,
	  b.pipGranularity,
	  b.separatePips,
	  b.pipsStart,
	  b.inputDifferentToDisplay,
	  b.pipsInputStart,
	  b.allPipsMustBeEntered,
	  b.commodityTraded_name,
	  b.commodityTraded_description,
	  b.commodityTraded_decimalPlaces,
	  b.commodityTraded_scaleFactor,
	  b.commodityTraded_lotSizeName,
	  b.commodityTraded_lotSizeNameShort,
	  b.commodityTraded_measurement_type_id,
	  b.commodityTraded_increment,
	  b.commodityTraded_maximum,
	  b.commodityTraded_minimum,
	  b.commodityPayment_name,
	  b.commodityPayment_description,
	  b.commodityPayment_decimalPlaces,
	  b.commodityPayment_scaleFactor,
	  b.commodityPayment_lotSizeName,
	  b.commodityPayment_lotSizeNameShort,
	  b.commodityPayment_measurement_type_id,
	  b.commodityPayment_increment,
	  b.commodityPayment_maximum,
	  b.commodityPayment_minimum,
	  b.is_complete,
	  b.is_active,
	  b.creation_date,
	  b.modification_date,
	  b.market_data_id,
	  b.filter_id,
	  b.markedForDeletion
  FROM 
	  market AS a 
  LEFT JOIN 
	  atomic_market AS b 
  ON 
	  a.market_id = b.market_id 
  AND 
	  b.markedForDeletion = 0 
  WHERE 
	  a.user_id = creator_id
  ORDER BY
          a.market_id;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllUserMarketDefsSimple`(creator_id INT )
BEGIN
  SELECT 
	  a.market_id,
	  a.user_id,
	  a.asset_id,
	  a.market_type_id,
	  a.market_name,
	  a.market_description,
	  a.organization_level_1_name,
	  a.organization_level_2_name,
	  a.organization_level_3_name,
	  a.organization_level_4_name,
	  a.organization_level_5_name,
	  a.creation_date,
	  a.modification_date,
	  b.atomic_market_id,
	  b.market_id,
	  b.user_id,
	  b.institution_id,
	  b.atomic_market_name,
	  b.atomic_market_description,
	  b.instrument_name,
	  b.instrument_description,
	  b.performance,
	  b.status,
	  b.market_type_id,
	  b.asset_id,
	  b.take_price_defined_as_id,
	  b.perTradeUnit,
	  b.pipsEnd,
	  b.typicalSpread,
	  b.wideSpread,
	  b.marketThreshold,
	  b.typicalPrice,
	  b.pipGranularity,
	  b.separatePips,
	  b.pipsStart,
	  b.inputDifferentToDisplay,
	  b.pipsInputStart,
	  b.allPipsMustBeEntered,
	  b.commodityTraded_name,
	  b.commodityTraded_description,
	  b.commodityTraded_decimalPlaces,
	  b.commodityPayment_name,
	  b.commodityPayment_description,
	  b.creation_date,
	  b.market_data_id,
	  b.markedForDeletion
  FROM 
	  market AS a 
  LEFT JOIN 
	  atomic_market AS b 
  ON 
	  a.market_id = b.market_id
  AND
          b.markedForDeletion = 0
  WHERE 
	  a.user_id = creator_id
  ORDER BY
          a.market_id;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getARMsforMarket`(param_atomic_market_id INT )
BEGIN SELECT b.name FROM market_configuration AS a JOIN component AS b ON a.component_id = b.component_id WHERE a.atomic_market_id = param_atomic_market_id; END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getARMsWithSameMarkets`(arm_name CHAR(50) )
BEGIN SELECT b.name, a.atomic_market_id FROM market_configuration AS a LEFT JOIN component AS b ON a.component_id = b.component_id  WHERE atomic_market_id IN (SELECT atomic_market_id FROM market_configuration WHERE component_id = (SELECT component_id FROM component WHERE name = arm_name)) AND a.component_id != (SELECT component_id FROM component WHERE name = arm_name);  END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getAtomicMarket`()
BEGIN SELECT * FROM atomic_markets; END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getAtomicMarketByID`( param_atomic_market_id INT )
BEGIN SELECT * FROM atomic_markets WHERE atomic_market_id = param_atomic_market_id; END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getAtomicMarketDef`(atomicmkt_id INT)
BEGIN SELECT atomic_market_id, version, market_id, atomic_market_name, market_definition FROM atomic_markets WHERE atomic_market_id = atomicmkt_id;  END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getMKDComponents`( mkd_name CHAR(50) )
BEGIN SELECT component_id, name FROM component WHERE MKD_component_id = (SELECT component_id FROM component WHERE name = mkd_name) AND name != mkd_name; END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getMyRegion`(ARM_NAME CHAR(50) )
BEGIN SELECT a.region_id, b.region_name FROM component AS a JOIN region AS b ON a.region_id = b.region_id  WHERE a.name = ARM_NAME; END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getSessionId`( node_name CHAR(10))
BEGIN 
 DECLARE return_val CHAR(10); 
 DECLARE error INT; 
 DECLARE a, b CHAR(10); 
 DECLARE cur_1 CURSOR FOR SELECT type FROM component WHERE name = node_name; 
 DECLARE CONTINUE HANDLER FOR NOT FOUND SET b = 1; 
 SET error = 0;
 
 OPEN cur_1; 
  REPEAT FETCH cur_1 INTO a; 
   UNTIL b = 1 
  END REPEAT; 
 CLOSE cur_1; 

 SET return_val = a; 

 CASE return_val 
  WHEN 'ARM' THEN INSERT INTO session_ARM SET component_name = node_name; 
  WHEN 'DAD' THEN INSERT INTO session_DAD SET component_name = node_name; 
  WHEN 'MKD' THEN INSERT INTO session_MKD SET component_name = node_name; 
  WHEN 'ORP' THEN INSERT INTO session_ORP SET component_name = node_name; 
  WHEN 'TRC' THEN INSERT INTO session_TRC SET component_name = node_name; 
  ELSE SET error = 1;    
 END CASE; 
 
 IF error = 1 THEN
  INSERT INTO session SET component_name = node_name; 
  SELECT LAST_INSERT_ID() AS session_id, 'true' AS error, 'Node type not found' AS message;
 ELSE
  SELECT LAST_INSERT_ID() AS session_id, 'false' AS error, '' AS message;
 END IF;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getUserPreferences`(myuser_id INT)
BEGIN 
   SELECT section, name, value, JSON AS JSONstr  FROM user_preference WHERE user_id = myuser_id; 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getUserSectionPreferences`(myuser_id INT, mysection CHAR(16))
BEGIN 
   SELECT section, name, value, JSON AS JSONstr FROM user_preference WHERE user_id = myuser_id AND section = mysection; 
END$$

--
DELIMITER ;
--
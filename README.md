# FX Trading System Database and Tables

**This is for learning purposes only**

## Database Table
This database was designed for institutional trading for FX currency trading; key tables to look at are:

> fx-trading-database.sql

* asset
* atomic_market
* commodity
* component
* deals
* market
* market_book_data_transparency
* orders

<img src="./table-diagram.png" />

## Store Procedures Used
These are the stored procedures used in the application; they are 15 altogether. Benchmarking all your queries using `EXPLAIN` while developing your queries to ensure performance is essential. [EXPLAIN Statement](https://dev.mysql.com/doc/refman/8.0/en/explain.html).

## Performance

**Stored procedures and functions improve performance by precompilation and reducing network overhead**

Define an execution time for all your queries. For example, all database calls should return under 4 to 6 milliseconds without database caching, while your database is in development mode. Hence, stored procedures and functions encapsulating logic and executing multiple queries are used. This approach will ensure that your data and business logic are processed and executed quickly. For a deep dive into performance, become familiar with [Roy Fielding, Network-based Application Architectures](https://www.ics.uci.edu/~fielding/pubs/dissertation/net_app_arch.htm) and [MySQL Optimization Tips](https://dev.mysql.com/doc/refman/5.7/en/miscellaneous-optimization-tips.html)



> stored-procedures.sql

### Example 
``` sql
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
```

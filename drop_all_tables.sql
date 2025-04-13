DELIMITER $$

CREATE PROCEDURE drop_all_tables()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE tableName VARCHAR(255);
    DECLARE cur CURSOR FOR 
        SELECT table_name 
        FROM information_schema.tables 
        WHERE table_schema = DATABASE();
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    SET FOREIGN_KEY_CHECKS = 0;
    OPEN cur;
    
    read_loop: LOOP
        FETCH cur INTO tableName;
        IF done THEN
            LEAVE read_loop;
        END IF;
        SET @stmt = CONCAT('DROP TABLE IF EXISTS `', tableName, '`');
        PREPARE stmt FROM @stmt;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;
    END LOOP;
    
    CLOSE cur;
    SET FOREIGN_KEY_CHECKS = 1;
END$$

DELIMITER ;

-- Execute the procedure
CALL drop_all_tables();
DROP PROCEDURE IF EXISTS drop_all_tables;

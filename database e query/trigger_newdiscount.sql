DROP TRIGGER IF EXISTS NewDiscount;

DELIMITER $

CREATE TRIGGER NewDiscount 
AFTER INSERT ON Utenti
FOR EACH ROW
BEGIN

INSERT INTO Sconti VALUES (NEW.idu,0);

END$

DELIMITER ;
DELIMITER $

DROP PROCEDURE IF EXISTS AddCart;

CREATE PROCEDURE AddCart (user VARCHAR(15),Idprod INT)
BEGIN
 DECLARE Idut INT;
 SELECT idu INTO Idut FROM Utenti WHERE Username=user;
 INSERT INTO Carrello VALUES (Idut,Idprod);
END$

DELIMITER ;
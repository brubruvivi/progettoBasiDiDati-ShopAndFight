DROP TRIGGER IF EXISTS Discount;

DELIMITER $

CREATE TRIGGER Discount 
AFTER INSERT ON Ordini
FOR EACH ROW
BEGIN
DECLARE Idut INT;
DECLARE Totale DOUBLE(5,2);

SELECT DISTINCT NEW.idu INTO Idut FROM Ordini;

SELECT DISTINCT NEW.totalepagato INTO Totale FROM Ordini;

IF (Totale >= 50.00 AND Totale < 100.00) THEN
  UPDATE Sconti
  SET scontoaccumulato = (scontoaccumulato + 5)
  WHERE idu = Idut;
  ELSEIF (Totale >= 100.00 AND Totale < 150.00) THEN
    UPDATE Sconti
    SET scontoaccumulato = (scontoaccumulato + 10)
    WHERE idu = Idut;
    ELSEIF (Totale >= 150.00) THEN
      UPDATE Sconti
      SET scontoaccumulato = (scontoaccumulato + 15)
      WHERE idu = Idut;
END IF;

END$

DELIMITER ;
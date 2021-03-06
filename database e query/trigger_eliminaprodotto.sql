DROP TRIGGER IF EXISTS EliminaProdotto;

DELIMITER $

CREATE TRIGGER EliminaProdotto
AFTER INSERT ON Prodotti_venduti
FOR EACH ROW
BEGIN
  DELETE FROM Prodotti
  WHERE idp=NEW.idp;
END$

DELIMITER ;
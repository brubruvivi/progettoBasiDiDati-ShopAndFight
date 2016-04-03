DELIMITER $

DROP FUNCTION IF EXISTS TotaleOrdine;

CREATE FUNCTION TotaleOrdine (idutente INT, applicasconto BOOLEAN) RETURNS DOUBLE(7,2)
BEGIN
  DECLARE totale DOUBLE(7,2);
  DECLARE sconto INT;

  SELECT SUM(prezzo) INTO totale FROM Carrello natural join Prodotti where idu=idutente;
  
  IF(applicasconto) THEN
    SELECT scontoaccumulato INTO sconto FROM Sconti WHERE idu=idutente;
    IF (totale > sconto) THEN
      SET totale = (totale - sconto);
    ELSE SET totale = 0;
    END IF;
    UPDATE Sconti SET scontoaccumulato=0 WHERE idu=idutente;
  END IF;
  RETURN totale;
END$

DELIMITER ;
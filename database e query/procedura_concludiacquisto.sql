DELIMITER $

DROP PROCEDURE IF EXISTS ConcludiAcquisto;

CREATE PROCEDURE ConcludiAcquisto (IN idordine INT,idprodotto INT)
BEGIN
  DECLARE nomeprod VARCHAR(40);
  DECLARE tipoprod CHAR(20);
  DECLARE sottotipoprod CHAR(20);
  DECLARE marcaprod CHAR(20);
  DECLARE descrizioneprod VARCHAR(100);
  DECLARE prezzoprod DOUBLE(7,2);

  INSERT INTO Prodotti_ordine
  VALUES (idordine,idprodotto);

  SELECT nomeprodotto, tipo, sottotipo, marca, prezzo
  INTO nomeprod, tipoprod, sottotipoprod, marcaprod, prezzoprod
  FROM Prodotti
  WHERE idp=idprodotto;

  IF (tipoprod="Attrezzatura") THEN
    SELECT concat_ws(', ',peso,materiale,misure,livello)
    INTO descrizioneprod
    FROM Attrezzatura
    WHERE idp=idprodotto;
  ELSE
    SELECT concat_ws(', ',taglia,numero,sesso)
    INTO descrizioneprod
    FROM Indumenti
    WHERE idp=idprodotto;
  END IF;
  
  INSERT INTO Prodotti_venduti
  VALUES (idprodotto,nomeprod,tipoprod,sottotipoprod,marcaprod,descrizioneprod,prezzoprod);

END$

DELIMITER ;
SET FOREIGN_KEY_CHECKS=0;   

DROP TABLE IF EXISTS Carrello;
DROP TABLE IF EXISTS Marche;
DROP TABLE IF EXISTS Prodotti;
DROP TABLE IF EXISTS Utenti;
DROP TABLE IF EXISTS Sconti;
DROP TABLE IF EXISTS Indumenti;
DROP TABLE IF EXISTS Attrezzatura;
DROP TABLE IF EXISTS Ordini;
DROP TABLE IF EXISTS Prodotti_ordine;
DROP TABLE IF EXISTS Sport;
DROP TABLE IF EXISTS Prodotti_sport;
DROP TABLE IF EXISTS Prodotti_venduti;

CREATE TABLE Marche(
       NomeMarca CHAR(20) PRIMARY KEY	
)ENGINE=InnoDB;

CREATE TABLE Prodotti(
       IDp INT(10) PRIMARY KEY,
       NomeProdotto VARCHAR(40) NOT NULL,
       Tipo CHAR(20) NOT NULL,
       Sottotipo CHAR(20),
       Marca CHAR(20) NOT NULL,
       Descrizione VARCHAR(100) NOT NULL,
       Prezzo DOUBLE(7,2) NOT NULL,
       FOREIGN KEY (Marca) REFERENCES Marche(NomeMarca)
)ENGINE=InnoDB;

CREATE TABLE Utenti(
       IDu INT(10) PRIMARY KEY AUTO_INCREMENT,
       Nome VARCHAR(10) NOT NULL,
       Cognome VARCHAR(10) NOT NULL,
       Username VARCHAR(15) NOT NULL,
       Password VARCHAR(10) NOT NULL,
       Indirizzo VARCHAR(20) NOT NULL,
       TipoUtente ENUM('Cliente','Proprietario','Commesso') NOT NULL
)ENGINE=InnoDB;

CREATE TABLE Sconti(
       IDu INT(10) PRIMARY KEY,
       ScontoAccumulato INT(4) NOT NULL,
       FOREIGN KEY (IDu) REFERENCES Utenti(IDu)
			       ON DELETE CASCADE
			       ON UPDATE CASCADE       
)ENGINE=InnoDB;

CREATE TABLE Carrello(
       IDu INT(10),
       IDp INT(10),
       PRIMARY KEY(IDu,IDp),
       FOREIGN KEY (IDu) REFERENCES Utenti(IDu) 
       			       ON DELETE CASCADE
			       ON UPDATE CASCADE,
       FOREIGN KEY (IDp) REFERENCES Prodotti(IDp) 
       			       ON DELETE CASCADE
			       ON UPDATE CASCADE
)ENGINE=InnoDB;

CREATE TABLE Indumenti(
       IDp INT(10) PRIMARY KEY,
       Taglia ENUM('XS','S','M','L','XL','XXL','U'), 
       Numero INT(2),
       Sesso ENUM('Uomo','Donna','Unisex') NOT NULL,
       FOREIGN KEY (IDp) REFERENCES Prodotti(IDp)
		               ON DELETE CASCADE
			       ON UPDATE CASCADE
)ENGINE=InnoDB;

CREATE TABLE Attrezzatura(
       IDp INT(10) PRIMARY KEY,
       Peso DOUBLE(5,2) NOT NULL, /*kilogrammi sottointeso*/
       Materiale VARCHAR(10) NOT NULL,
       Misure CHAR(11), /*altezzaXlarghezzaXprofondità*/
       Livello ENUM('Principiante','Intermedio','Avanzato'),
       FOREIGN KEY (IDp) REFERENCES Prodotti(IDp)
			  ON DELETE CASCADE
			  ON UPDATE CASCADE
)ENGINE=InnoDB;

CREATE TABLE Ordini(
       IDo INT(10) AUTO_INCREMENT,
       IDu INT(10),
       DataConferma CHAR(10),
       TotalePagato DOUBLE(5,2),
       PRIMARY KEY(IDo,IDu),
       FOREIGN KEY (IDu) REFERENCES Utenti(IDu)
			       ON DELETE CASCADE
			       ON UPDATE CASCADE
)ENGINE=InnoDB;

CREATE TABLE Prodotti_ordine(
       IDo INT(10),
       IDp INT(10),
       PRIMARY KEY(IDp,IDo),
       FOREIGN KEY (IDo) REFERENCES Ordini(IDo)
			       ON DELETE CASCADE
			       ON UPDATE CASCADE
)ENGINE=InnoDB;

CREATE TABLE Prodotti_venduti(
       IDp INT(10) PRIMARY KEY,
       NomeProdotto VARCHAR(40) NOT NULL,
       Tipo CHAR(20) NOT NULL,
       Sottotipo CHAR(20) NOT NULL,
       Marca CHAR(20) NOT NULL,
       Descrizione VARCHAR(100) NOT NULL,
       Prezzo DOUBLE(7,2) NOT NULL,
       FOREIGN KEY (IDp) REFERENCES Prodotti_ordine(IDp)
			  ON DELETE CASCADE
			  ON UPDATE CASCADE
)ENGINE=InnoDB;

CREATE TABLE Sport(
       NomeSport CHAR(20) PRIMARY KEY
)ENGINE=InnoDB;

CREATE TABLE Prodotti_sport(
       IDp INT(10),
       NomeSport CHAR(20),
       PRIMARY KEY(IDp,NomeSport),
       FOREIGN KEY (IDp) REFERENCES Prodotti(IDp)
			  ON DELETE CASCADE
			  ON UPDATE CASCADE,
       FOREIGN KEY (NomeSport) REFERENCES Sport(NomeSport)
                                ON DELETE CASCADE
			        ON UPDATE CASCADE
)ENGINE=InnoDB;

SET FOREIGN_KEY_CHECKS=1;
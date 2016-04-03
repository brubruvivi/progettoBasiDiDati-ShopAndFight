create table prova(
nome CHAR(10),
cognome CHAR(10),
messaggio CHAR(10),
PRIMARY KEY(nome)
)engine=InnoDB;

LOAD DATA LOCAL INFILE 'popProva.txt' INTO TABLE prova
fields terminated by ','
LINES TERMINATED BY '$';

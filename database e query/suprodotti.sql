set foreign_key_checks=0;

load data local infile 'prodotti.txt' into table Prodotti fields terminated by '$';

load data local infile 'indumenti.txt' into table Indumenti fields terminated by '$';
load data local infile 'attrezzatura.txt' into table Attrezzatura fields terminated by '$';

load data local infile 'prodottisport.txt' into table Prodotti_sport fields terminated by '$';

set foreign_key_checks=1;
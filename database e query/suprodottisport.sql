set foreign_key_checks=0;

load data local infile 'prodottisport.txt' into table Prodotti_sport fields terminated by '$';

set foreign_key_checks=1; 

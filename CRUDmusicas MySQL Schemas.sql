create schema crudjoseelias;
use crudjoseelias;
 

create table musica(
codigo INT PRIMARY KEY auto_increment,
capa VARCHAR(6000),
nome VARCHAR(100) NOT NULL,
banda VARCHAR(100),
album VARCHAR(100),
ano INT,
link VARCHAR(6000)
);


insert into musica(capa, nome, banda, album, ano, link) values

 
("https://m.media-amazon.com/images/I/71DQrKpImPL._UF1000,1000_QL80_.jpg",
'Polly',
'Nirvana',
"Nevermind",
1991,
"https://music.youtube.com/watch?v=h5cZvNWxnho"),

 

("https://images-na.ssl-images-amazon.com/images/I/61Si--2zAvL._AC_.jpg",
"Lo Malo de Ser Bueno",
"Cuarteto de Nos",
"Porfiado",
2012,
"https://music.youtube.com/watch?v=S_roMeig-YQ"),


("https://m.media-amazon.com/images/I/71-sllkq7xL._SL1500_.jpg",
"Freedom",
"Rage Against The Machine",
"Rage Against The Machine",
1992,
"https://music.youtube.com/watch?v=7pAr6B7fqyM");

 
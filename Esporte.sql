create database esporte;
use esporte;

create table cidade(
	id_cidade int not null auto_increment,
    nome_cidade varchar(50) not null,
    uf char(2) not null,
    primary key(id_cidade)
);

create table usuario(
	id_usu int not null auto_increment,
	nome varchar(100) not null,
    email varchar(100) not null, 
    endereco varchar(100) not null,
    telefone bigint(14), 
    idade int not null, 
    id_cidade int not null,
    constraint cidade_id_cidade_fk foreign key(id_cidade) references cidade(id_cidade),
    primary key(id_usu)
);

create table proprietario(
	id_pro int not null auto_increment,
	nome varchar(100) not null,
    email varchar(100) not null, 
    endereco varchar(100) not null,
    cpf bigint(11) not null,
    telefone bigint(14), 
    idade int not null,
    id_cidade int not null,
    constraint cidade_id_cidade_fk foreign key(id_cidade) references cidade(id_cidade),
    primary key(id_pro)
);

create table esportes(
	id_esp int not null auto_increment,
	nome varchar(100) not null,
    desc_espor text, 
    estilo varchar(100),
    primary key(id_esp)
);

create table locais(
	id_locais int not null auto_increment,
	nome_locais varchar(100),
	tipo_local varchar(50), 
	desc_locais text,
    situacao char(2) not null,
    ender varchar(50) not null,
    id_cidade int not null,
    constraint cidade_id_cidade_fk foreign key(id_cidade) references cidade(id_cidade),
	primary key(id_locais)
);

create table reserva(
	id_preco int not null auto_increment,
	preco decimal(4.2) not null,
	preco_multa decimal(3.2)not null,
	data_reserva date not null, 
	tempo_cancelamento date not null, 
    id_locais int not null,
    id_usu int not null,
    constraint locais_id_locais_fk foreign key(id_locais) references locais(id_locais),
    constraint usuario_id_usu_fk foreign key(id_usu) references usuario(id_usu),
	primary key(id_preco)
);


create table locais_esportes(
	id_locais_esportes int not null auto_increment,
	id_locais int not null,
	constraint locais_id_locais_fk foreign key(id_locais) references esportes(id_locais),
	id_esp int not null,
	constraint esportes_id_esp_fk foreign key(id_esp) references locais(id_esp),
	primary key(id_locais_esportes)
);

create table prop_locais(
	id_prop_locais int not null auto_increment,
    id_pro int not null,
	id_locais int not null,
    primary key(id_prop_locais),
    constraint proprietario_id_pro_fk foreign key(id_pro) references proprietario(id_pro),
    constraint locais_id_locais_fk foreign key(id_locais) references proprietario(id_locais)
);

insert into cidade ( nome_cidade, uf) value ("Erechim", "RS");
insert into cidade ( nome_cidade, uf) value ("Paulo Bento", "RS");
insert into cidade ( nome_cidade, uf) value ("Marcelino Ramos", "RS");
insert into cidade ( nome_cidade, uf) value ("Viadutos", "RS");
insert into cidade ( nome_cidade, uf) value ("Gaurama", "RS");

insert into usuario(nome, email, endereco, telefone, idade, id_cidade) values ("Lucia", "lucia@gmail.com.br", "Três Vendas, 400", 555494586499854, 43, 01);
insert into usuario(nome, email, endereco, telefone, idade, id_cidade) values ("Carlos", "carlos@gmail.com.br", "Três Vendas, 280", 555499958952542, 54, 04);
insert into usuario(nome, email, endereco, telefone, idade, id_cidade) values ("Laura", "laura@gmail.com.br", "Bairro do Bode, 123", 55543698456284, 25, 02);
insert into usuario(nome, email, endereco, telefone, idade, id_cidade) values ("Carla","carla@gmail.com.br", "Jardim das Flores, 12", 55543269854236, 18, 03);
insert into usuario(nome, email, endereco, telefone, idade, id_cidade) values ("João", "joao@gmail.com.br", "Charizard, 125", 55549896328654, 33, 01);

insert into proprietario(nome, email, endereco, cpf, telefone, idade, id_cidade) values("Élcio", "elcio24@gmail.com", "Rua da bola, 123" , 02276591120, 54999998853, 33, 04);
insert into proprietario(nome, email, endereco, cpf, telefone, idade, id_cidade) values("Denilson", "delinson69@gmail.com", "Rua Grande, 76", 657731825482, 54999852735, 55, 02);
insert into proprietario(nome, email, endereco, cpf, telefone, idade, id_cidade) values("Elvira", "elvira32@gmail.com", "Rua Bailante, 432", 826473689, 54999942534, 22, 03); 
insert into proprietario(nome, email, endereco, cpf, telefone, idade, id_cidade) values("Marcel", "marcel@gmail.com", "Rua Inglaterra, 21", 66271546372, 54996223345, 43, 01);
insert into proprietario(nome, email, endereco, cpf, telefone, idade, id_cidade) values("Ilton", "iltonarron33@gmail.com", "Rua das Artes, 77", 62718253643, 54992314564, 31, 01);

insert into locais(nome_locais, tipo_local, desc_locais, situacao, ender, id_cidade)value("Escolinha de futebol","Público","Escola de futebol para crianças.","U", "Rua São Benevito, 100", 01);
insert into locais(nome_locais, tipo_local, desc_locais, situacao, ender, id_cidade)value("Para Viver","Privado","Quadra para praticar vôlei, basquete e handebol", "NU", "Avenida São Menequim, 90", 01);
insert into locais(nome_locais, tipo_local, desc_locais, situacao,  ender, id_cidade)value("Minesporte","Público","Local para praticar bocha, atletismo e hipismo","U", "Rua Quintal Rancho, 320", 01);
insert into locais(nome_locais, tipo_local, desc_locais, situacao, ender, id_cidade)value("SportTrack","Público","Quadra para praticar vôlei, basquete, handebol e futebol","U", "Rua Luiz Augusto, 120", 01);
insert into locais(nome_locais, tipo_local, desc_locais, situacao, ender, id_cidade)value("SpoTv","Privado","Local para praticar golfe, esgrima e skate","U", "Rua Carlo Marcos, 300", 01);

insert into esportes(nome , desc_espor, estilo) value("Futebol",  "Esporte que utiliza uma bola para realizar pontos no adiversário utilizando os pés", "Esporte de Invasão");
insert into esportes(nome , desc_espor, estilo) value("Bocha",  "Esporte que tem como objetivo deixar as bolas o mais próximo do alvo chamado bolin", "Esporte de Precisão");
insert into esportes(nome , desc_espor, estilo) value("Vôlei", "Esporte que utiliza uma bola e rede tendo como objetivo jogar a bola para o lado do adversário fazendo com que ela toque no chão" , "Esporte de Rede");
insert into esportes(nome , desc_espor, estilo) value("Handebol", "Esporte semelhante a futebol porém realizado com as mãos", "Esporte de Invasão");
insert into esportes(nome , desc_espor, estilo) value("Basquete", "Jogo que utiliza uma bola para pontuar com o nome de cesta", "Esporte de Invasão");

insert into reserva(preco, preco_multa, data_reserva, tempo_cancelamento, id_locais, id_usu) value (150.00, 20.00, "2022.11.22", "2022.11.18", 1, 2 );
insert into reserva(preco, preco_multa, data_reserva, tempo_cancelamento, id_locais, id_usu) value (130.00, 29.00, "2022.11.29", "2022.11.25", 4, 2  );
insert into reserva(preco, preco_multa, data_reserva, tempo_cancelamento, id_locais, id_usu) value (110.00, 33.00, "2022.12.12", "2022.12.10", 2 , 5 );
insert into reserva(preco, preco_multa, data_reserva, tempo_cancelamento, id_locais, id_usu) value (80.00, 10.00, "2022.12.15", "2022.12.10", 3, 3 );
insert into reserva(preco, preco_multa, data_reserva, tempo_cancelamento, id_locais, id_usu) value (180.00, 50.00, "2022.12.22", "2022.12.18", 5, 4  );

insert into locais_esportes(id_locais, id_esp) value(01, 01);
insert into locais_esportes(id_locais, id_esp) value(02, 03);
insert into locais_esportes(id_locais, id_esp) value(02, 05);
insert into locais_esportes(id_locais, id_esp) value(02, 04);
insert into locais_esportes(id_locais, id_esp) value(04, 01);
insert into locais_esportes(id_locais, id_esp) value(04, 03);
insert into locais_esportes(id_locais, id_esp) value(04, 05);
insert into locais_esportes(id_locais, id_esp) value(04, 04);
insert into locais_esportes(id_locais, id_esp) value(03, 02);
insert into locais_esportes(id_locais, id_esp) value(03, 04);

insert into prop_locais(id_locais, id_pro) value(01, 01);
insert into prop_locais(id_locais, id_pro) value(05, 04);
insert into prop_locais(id_locais, id_pro) value(03, 02);
insert into prop_locais(id_locais, id_pro) value(02, 03);
insert into prop_locais(id_locais, id_pro) value(04, 05);

select locais.nome_locais, locais.situacao, locais.ender, esportes.nome from esportes inner join locais_esportes on esportes.id_esp = locais_esportes.id_esp
inner join locais on locais_esportes.id_locais = locais.id_locais where esportes.nome = "Handebol";

select esportes.nome, locais_esportes.id_locais, locais.nome_locais from esportes inner join locais_esportes on esportes.id_esp = locais_esportes.id_esp
inner join locais on locais_esportes.id_locais = locais.id_locais
where esportes.id_esp = 4;

select usuario.nome, usuario.telefone, usuario.email, locais.ender from usuario inner join reserva on usuario.id_usu = reserva.id_usu
inner join locais on reserva.id_locais = locais.id_locais where locais.nome_locais = "Para Viver";

select nome, email, cpf, telefone, locais.nome_locais, locais.ender from proprietario inner join prop_locais on proprietario.id_pro = prop_locais.id_pro 
inner join locais on prop_locais.id_locais = locais.id_locais where locais.id_locais = 1; 
 
select locais.nome_locais, nome, email, cpf, telefone, locais.ender from proprietario inner join prop_locais on proprietario.id_pro = prop_locais.id_pro inner join locais
on prop_locais.id_locais = locais.id_locais where locais.situacao ="U" order by (locais.nome_locais);
 
select locais.nome_locais, locais.ender, locais.situacao, reserva.data_reserva, reserva.preco from locais inner join reserva on reserva.id_locais = locais.id_locais 
where reserva.preco between 110.00 and 180.00 order by (reserva.data_reserva);

select usuario.nome, usuario.telefone, locais.nome_locais, locais.ender, reserva.data_reserva, proprietario.nome, proprietario.telefone from usuario inner join reserva on usuario.id_usu = reserva.id_preco
inner join locais on reserva.id_locais = locais.id_locais inner join  prop_locais
on  locais.id_locais = prop_locais.id_locais inner join proprietario on proprietario.id_pro = prop_locais.id_pro where usuario.id_usu between 1 and 5 order by(usuario.nome); 

select usuario.nome, locais.nome_locais, reserva.data_reserva, reserva.preco, esportes.nome from usuario inner join reserva on usuario.id_usu = reserva.id_usu
inner join locais on reserva.id_locais  = locais.id_locais inner join locais_esportes on locais.id_locais = locais_esportes.id_locais inner join esportes on  locais_esportes.id_esp = esportes.id_esp 
where reserva.data_reserva="2022.12.12";

select usuario.nome, locais.nome_locais, locais.ender, reserva.data_reserva from usuario inner join reserva on usuario.id_usu = reserva.id_usu
inner join locais on reserva.id_locais = locais.id_locais inner join cidade on  locais.id_cidade = cidade.id_cidade where cidade.nome_cidade="Erechim";

/* Breno Felipe Rinas e Tainara Zago*/
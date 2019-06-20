create table cliente
(cod_cliente int not null primary key,
nome varchar(60) not null,
dt_nasc date,
endereco varchar(60),
telefone int);

create table categoria_cliente
(cod_cat int not null primary key,
descricao varchar(60),
desconto int not null);

create table entrega
(cod_entrega int not null primary key,
zona varchar(20),
valor float not null);

create table restaurante
(cod_rest int not null primary key,
nome varchar(35),
cnpj varchar(13),
telefone int not null,
endereco varchar(40));

create table prato
(cod_prato int not null primary key,
nome varchar(30),
descricao varchar(60));

create table funcionario
(cod_func int not null primary key,
nome varchar(60) not null,
cpf int not null,
dt_nasc date,
telefone int);

create table pedido
(cod_ped int not null primary key,
cod_func int not null references funcionario(cod_func),
cod_cliente int not null references cliente(cod_cliente),
descricao varchar(30),
data_pedido date,
valor_total real,
entrega int not null references entrega(cod_entrega));

create table item_pedido
(cod_item_pedido int not null primary key,
cod_ped int not null references pedido(cod_ped),
cod_rest int not null references restaurante(cod_rest),
preco real not null,
quantidade int not null);

create table estoque
(cod_rest int not null references restaurante(cod_rest),
cod_prato int not null references prato(cod_prato),
quantidade int not null,
preco real not null,
constraint p_key primary key(cod_rest, cod_prato));
create database franciscojean_db;

use franciscojean_db;

create table tbproduto(
IdProp int primary key,
NomeProp varchar(50) not null,
Qtd int,
DataValidade Date not null,
Preco decimal(10,2) not null
);

create table tbcliente(
Codigo int primary key,
NomeCli varchar(50) not null,
DataNasc date null
);


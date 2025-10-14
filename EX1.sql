create database felipenascimento_db;

use felipenascimento_db;

create table tb_usuario(
IdUsuario int primary key,
NomeUsuario varchar(45),
DataNasc date
);

create table tb_estado(
Id int primary key,
Uf char(2)
);

create table tb_cliente(
CodigoCli int primary key,
Nome varchar(50),
Endereco varchar(60)
);

create table tb_produto(
Barras char(13) primary key,
Valor decimal(12,4),
Descricao varchar(60)
);

describe tb_produto;

show tables;

show databases;

alter table tb_cliente modify Nome varchar(58);

alter table tb_produto add Qtd int;

drop table tb_estado;

alter table tb_usuario drop DataNasc;
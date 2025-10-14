create database dbdesenvolvimento;

use dbdesenvolvimento;

create table tbproduto(
IdProp Int primary key,
NomeProp varchar(50) not null,
Qtd int,
DataValidade date not null,
Preco decimal(10,2) not null
);

alter table tbproduto add Peso decimal (5,2);
alter table tbproduto add Cor varchar(50);
alter table tbproduto add Marca varchar(50) not null;

alter table tbproduto drop cor;

alter table tbproduto modify peso decimal(5,2) not null;

/*Não é possivel pois o campo cor já tinha sido apagado antes.*/

create database dbLojaGrande;

alter table tbproduto add cor varchar(50);

create database dblojica;

use dblojica;

create table tbcliente(
NomeCli varchar(50) not null,
CodigoCli int primary key,
DataCadastro Date not null
);

use dbLojaGrande;

create table tbfuncionario(
NomeFunc varchar(50) not null,
CodigoFunc int primary key,
DataCadastro datetime not null
);

drop database dbLojaGrande;

use dblojica;

alter table tbcliente add cpf char(11) not null unique;



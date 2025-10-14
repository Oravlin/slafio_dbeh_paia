-- Gabriel, Alvaro

create database dbescola;

use dbescola;

create table tbcliente(
IdCli int primary key,
NomeCli varchar(50) not null,
NumEnd int,
DataCadastro datetime default current_timestamp()
);

alter table tbcliente add cpf char(11) unique not null;

alter table tbcliente add cep char(6) unique;

create database dbempresa;

create table tbendereco(
cep char(5) primary key,
Logradouro varchar(250),
IdUf tinyint
);

alter table tbcliente add constraint Fk_Cep_TbCliente foreign key (cep) references tbendereco(cep);

describe tbcliente;

/*Criar constraint colocando alter table
Tipo de dado no cep e cpf por exemplo
De resto Ok*/

show databases;

drop database dbempresa;
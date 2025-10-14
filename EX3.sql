create database dbcomercio;

use dbcomercio;

create table tbCliente(
Id int primary key,
NomeCli varchar(200) not null,
NumEnd int not null,
CompEnd varchar(50),
check(NumEnd <= 999999)
);

create table tbClientePF(
CPF bigint primary key,
RG  int,
Rgdig char(1),
Nascimento date not null,
check(CPF <= 99999999999),
check(RG <= 999999999)
);
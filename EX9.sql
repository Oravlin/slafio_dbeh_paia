create database dbbanco;

use dbbanco;

create table tbBanco(
Codigo int primary key,
Nome varchar(50) not null
);

create table tbAgencia(
NumeroAgencia int primary key,
Endereco varchar(50) not null,
Codigo int,
foreign key (Codigo) references tbBanco(Codigo)
);

create table tbConta(
NumeroConta int primary key,
Saldo decimal(7,2),
TipoConta smallint,
NumeroAgencia int not null,
foreign key (NumeroAgencia) references tbAgencia(NumeroAgencia)
);

create table tbCliente(
CPF bigint primary key,
Nome varchar(50) not null,
Sexo char(1) not null,
Endereco varchar(50) not null
);

create table tbTelefone_Cliente(
Tel int primary key,
CPF bigint,
foreign key (CPF) references tbCliente(CPF)
);

create table tbHistorico(
CPF bigint,
NumeroConta int not null,
DataInicio date,
primary key (CPF, NumeroConta),
foreign key (CPF) references tbcliente(CPF),
foreign key (NumeroConta) references tbconta(NumeroConta)
);

insert into tbbanco
values(1, 'Banco do Brasil'),
	  (104, 'Caixa Economica federal'),
	  (801, 'Banco Escola');

insert into tbagencia (Codigo, NumeroAgencia, Endereco)
values(1, 123, 'Av Paulista,78'),
	  (104, 159, 'Rua Liberdade, 124'),
      (801, 401, 'Rua Vinte Três, 23'),
      (801, 485, 'Av marechal, 68');
      
insert into tbcliente
values(12345678910, 'Enildo', 'M', 'Rua Grande, 75'),
	  (12345678911, 'Astrogildo', 'M', 'Rua Pequena, 789'),
      (12345678912, 'Monica', 'F', 'Av Larga, 148'),
      (12345678913, 'Cascão', 'M', 'Av Principal, 369');
      
insert into tbconta
values(9876, 456.05, 1, 123),
	  (9877, 321.00, 1, 123),
      (9878, 100.00, 2, 485),
      (9879, 5589.48, 1, 401);
      
insert into tbhistorico
values(12345678910, 9876, '2001-04-15'),
	  (12345678911, 9877, '2011-03-10'),
      (12345678912, 9878, '2021-03-11'),
      (12345678913, 9879, '2000-07-05');
      
insert into tbtelefone_cliente (cpf, tel)
values(12345678910, 921345678),
	  (12345678911, 921345679),
      (12345678912, 921345680),
      (12345678913, 921345681);

alter table tbcliente add email varchar(255);

select cpf, endereco from tbcliente where Nome = 'Monica';

select NumeroAgencia, Endereco from tbagencia where Codigo = 801;

select * from tbcliente where sexo = 'M';



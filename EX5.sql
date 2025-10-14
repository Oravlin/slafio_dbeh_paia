create database dbana;

use dbana;

create table tbproduto(
CodigoB int primary key,
NomeProd varchar(50) not null,
check(CodigoB <= 9999999999999)
);

create table tbvenda(
NF int primary key auto_increment,
DataValidade Timestamp,
CodigoB int,
foreign key (CodigoB) references tbproduto (CodigoB)
);

alter table tbvenda add preco decimal(10,2) not null;

alter table tbvenda add qtd smallint check(qtd > 0);

alter table tbvenda drop DataValidade;

alter table tbvenda add DataVenda timestamp default current_timestamp();
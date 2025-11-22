create database dbdistribuidora;

use dbdistribuidora;

create table tbbairro(
BairroId int primary key auto_increment,
Bairro varchar(200) not null
);

create table tbcidade(
CidadeId int primary key auto_increment,
Cidade varchar(200) not null
);

create table tbestado(
UFId int primary key auto_increment,
UF char(2) not null
);

create table tbendereco(
Logradouro varchar(200) not null,
CEP decimal(8,0) primary key,
BairroId int not null,
CidadeId int not null,
UFId int not null,
foreign key (BairroId) references tbbairro(BairroId),
foreign key (CidadeId) references tbcidade(CidadeId),
foreign key (UFId) references tbestado(UFId)
);

create table tbcliente(
IdCli int primary key auto_increment,
NomeCli varchar(200) not null,
NumEnd decimal(6,0) not null,
CompEnd varchar(50),
CEP Decimal(8,0) not null,
foreign key (CEP) references tbendereco(CEP)
);

create table tbcliente_pf(
Cpf decimal(11,0) primary key,
RG decimal(9,0) not null,
RG_Dig char(1) not null,
Nasc Date not null,
IdCli int,
foreign key (IdCli) references tbcliente(IdCli)
);

create table tbcliente_pj(
CNPJ decimal(14,0) primary key,
IE decimal(11,0) unique,
IdCli int,
foreign key (IdCli) references tbcliente(IdCli)
);

create table tbnota_fiscal(
NF int primary key,
TotalNota Decimal(8,2) not null,
DataEmissao Date not null
);

create table tbvenda(
NumeroVenda int primary key,
DataVenda date not null,
TotalVenda decimal(8,2) not null,
IdCli int not null,
NF int,
foreign key (IdCli) references tbcliente(IdCli),
foreign key (NF) references tbnota_fiscal(NF)
);

create table tbproduto(
CodigoBarras decimal(14,0) primary key,
Nome varchar(200) not null,
Valor decimal(8,2) not null,
Qtd int
);

create table tbitemvenda(
NumeroVenda int,
CodigoBarras decimal(14,0),
ValorItem decimal(8,2) not null,
Qtd Int not null,
primary key(NumeroVenda, CodigoBarras),
foreign key (NumeroVenda) references tbVenda(NumeroVenda),
foreign key (CodigoBarras) references tbproduto(CodigoBarras)
); 

create table tbfornecedor(
Codigo int primary key auto_increment,
CNPJ Decimal (14,0) unique,
Nome varchar(200) not null,
Telefone Decimal(11,0)
);

create table tbcompra(
NotaFiscal int primary key,
DataCompra date not null,
ValorTotal decimal(8,2) not null,
QtdTotal Int not null,
Codigo Int,
foreign key (Codigo) references tbfornecedor(Codigo)
);

create table tbitemcompra(
NotaFiscal int,
CodigoBarras decimal(14,0),
ValorItem decimal(8,2) not null,
Qtd int not null,
primary key (NotaFiscal, CodigoBarras),
foreign key (NotaFiscal) references tbcompra(NotaFiscal),
foreign key (CodigoBarras) references tbproduto(CodigoBarras)
);
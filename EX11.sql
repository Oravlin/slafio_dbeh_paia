create database dbdistribuidora;

use dbdistribuidora;

create table tbbairro(
BairroId int primary key,
Bairro varchar(200) not null
);

create table tbcidade(
CidadeId int primary key,
Cidade varchar(200) not null
);

create table tbestado(
UFId int primary key,
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
IdCli int primary key,
NomeCli varchar(200),
NumEnd decimal(6,0) not null,
CompEnd varchar(50),
CEP Decimal(8,0),
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
IE decimal(11,0),
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
Codigo int primary key,
CNPJ Decimal (14,0),
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

insert into tbfornecedor (Codigo, Nome, CNPJ, Telefone)
	  values (1, 'Revenda Chico Loco',  1245678937123, 11934567897),
			 (2, 'José Faz Tudo S/A',  1345678937123, 11934567898),
             (3, 'Vadalto Entregas',  1445678937123, 11934567899),
             (4, 'Astrogildo das Estrela',  1545678937123, 11934567800),
             (5, 'Amoroso e Doce',  1645678937123, 11934567801),
             (6, 'Marcelo Dedal',  1745678937123, 11934567802),
             (7, 'Francisco Cachaça',  1845678937123, 11934567803),
             (8, 'Joãozinho Chupeta',  1945678937123, 11934567804);

select * from tbfornecedor;
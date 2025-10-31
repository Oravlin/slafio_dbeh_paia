
-- EX1 – FORNECEDORES

insert into tbfornecedor (Codigo, Nome, CNPJ, Telefone)
values (1, 'Revenda Chico Loco',  1245678937123, 11934567897),
	   (2, 'José Faz Tudo S/A',  1345678937123, 11934567898),
	   (3, 'Vadalto Entregas',  1445678937123, 11934567899),
	   (4, 'Astrogildo das Estrela',  1545678937123, 11934567800),
	   (5, 'Amoroso e Doce',  1645678937123, 11934567801),
	   (6, 'Marcelo Dedal',  1745678937123, 11934567802),
	   (7, 'Francisco Cachaça',  1845678937123, 11934567803),
	   (8, 'Joãozinho Chupeta',  1945678937123, 11934567804);


-- EX2 – CIDADES

delimiter $$

create procedure inserir_cidade(
    in pCidadeID int,
    in pCidade varchar(100)
)
begin
    insert into tbcidade (CidadeID, Cidade)
    values (pCidadeID, pCidade);
end$$

delimiter ;

-- Chamadas:
call inserir_cidade(1, 'Rio de Janeiro');
call inserir_cidade(2, 'São Carlos');
call inserir_cidade(3, 'Campinas');
call inserir_cidade(4, 'Franco da Rocha');
call inserir_cidade(5, 'Osasco');
call inserir_cidade(6, 'Pirituba');
call inserir_cidade(7, 'Lapa');
call inserir_cidade(8, 'Ponta Grossa');
call inserir_cidade(9, 'São Paulo');
call inserir_cidade(10, 'Barra Mansa');
call inserir_cidade(11, 'Cuiabá');
call inserir_cidade(12, 'Recife');


-- EX3 – ESTADOS

delimiter $$

create procedure inserir_estado(
    in pUfID int,
    in pUf varchar(2)
)
begin
    insert into tbestado (UfID, Uf)
    values (pUfID, pUf);
end$$

delimiter ;

-- Chamadas:
call inserir_estado(1, 'SP');
call inserir_estado(2, 'RJ');
call inserir_estado(3, 'RS');
call inserir_estado(4, 'MT');
call inserir_estado(5, 'PE');


-- EX4 – BAIRROS

delimiter $$

create procedure inserir_bairro(
    in pBairroID int,
    in pBairro varchar(100)
)
begin
    insert into tbbairro (BairroID, Bairro)
    values (pBairroID, pBairro);
end$$

delimiter ;

-- Chamadas:
call inserir_bairro(1, 'Aclimação');
call inserir_bairro(2, 'Capão Redondo');
call inserir_bairro(3, 'Pirituba');
call inserir_bairro(4, 'Liberdade');
call inserir_bairro(5, 'Lapa');
call inserir_bairro(6, 'Consolação');
call inserir_bairro(7, 'Penha');
call inserir_bairro(8, 'Barra Funda');
call inserir_bairro(9, 'Jardim Santa Isabel');
call inserir_bairro(10, 'Sei Lá');



-- EX5 – PRODUTOS

delimiter $$

create procedure inserir_produto(
    in pCodigoBarras bigint,
    in pNome varchar(100),
    in pValor decimal(10,2),
    in pQtd int
)
begin
    insert into tbproduto (CodigoBarras, Nome, Valor, Qtd)
    values (pCodigoBarras, pNome, pValor, pQtd);
end$$

delimiter ;

-- Chamadas:
call inserir_produto(12345678910111,'Rei de Papel Mache', 54.61, 120);
call inserir_produto(12345678910112,'Bolinha de Sabão', 100.45, 120);
call inserir_produto(12345678910113,'Carro Bate', 44.00, 120);
call inserir_produto(12345678910114,'Bola Furada', 10.00, 120);
call inserir_produto(12345678910115,'Maçã Laranja', 99.44, 120);
call inserir_produto(12345678910116,'Boneco do Hitler', 124.00, 200);
call inserir_produto(12345678910117,'Farinha de Suruí', 50.00, 200);
call inserir_produto(12345678910118,'Zelador de Cemitério', 24.50, 100);



-- EX6 – ENDEREÇOS

delimiter $$

create procedure inserir_endereco(
    in pLogradouro varchar(150),
    in pBairroID int,
    in pCidadeID int,
    in pUFID int,
    in pCEP int
)
begin
    insert into tbendereco (Logradouro, BairroID, CidadeId, UFId, CEP)
    values (pLogradouro, pBairroID, pCidadeID, pUFID, pCEP);
end$$

delimiter ;

-- Chamadas:
call inserir_endereco('Rua da Federal', 5, 9, 1, 12345050);
call inserir_endereco('Av Brasil', 5, 3, 1, 12345051);
call inserir_endereco('Rua Liberdade', 6, 9, 1, 12345052);
call inserir_endereco('Av Paulista', 7, 1, 2, 12345053);
call inserir_endereco('Rua Ximbú', 7, 1, 2, 12345054);
call inserir_endereco('Rua Piu XI', 7, 3, 1, 12345055);
call inserir_endereco('Rua Chocolate', 1, 10, 2, 12345056);
call inserir_endereco('Rua Pão na Chapa', 8, 8, 3, 12345057);
call inserir_endereco('Rua Veia', 9, 11, 4, 12345059);
call inserir_endereco('Rua Nova', 9, 11, 4, 12345058);
call inserir_endereco('Rua dos Amores', 10, 12, 5, 12345060);


-- EX7 – CLIENTE PF

delimiter $$

create procedure inserir_clientepf(
    in pIdCli int,
    in pNomeCli varchar(100),
    in pNumEnd int,
    in pCompEnd varchar(100),
    in pCEP int,
    in pCPF bigint,
    in pRG int,
    in pRG_Dig char(1),
    in pNasc date
)
begin
    insert into tbcliente (IdCli, NomeCli, NumEnd, CompEnd, CEP)
    values (pIdCli, pNomeCli, pNumEnd, pCompEnd, pCEP);

    insert into tbcliente_pf(CPF, RG, RG_Dig, Nasc, IdCli)
    values (pCPF, pRG, pRG_Dig, pNasc, pIdCli);
end$$

delimiter ;

-- Chamadas:
call inserir_clientepf(1, 'Pimpão', 325, null, 12345051, 12345678911, 12345678, '0', '2000-12-10');
call inserir_clientepf(2, 'Disney Chaplin', 89, 'Ap. 12', 12345053, 12345678912, 12345679, '0', '2001-11-21');
call inserir_clientepf(3, 'Marciano', 744, null, 12345054, 12345678913, 12345670, '0', '2001-01-06');
call inserir_clientepf(4, 'Lança perfume', 128, null, 12345059, 12345678914, 12345671, 'X', '2004-05-04');
call inserir_clientepf(5, 'Remédio Amargo', 2585, null, 12345058, 12345678915, 12345678, '0', '2002-07-15');


-- EX8 – CLIENTE PJ

delimiter $$

create procedure inserir_clientepj(
    in pIdCli int,
    in pNomeCli varchar(100),
    in pNumEnd int,
    in pCompEnd varchar(100),
    in pCEP int,
    in pCNPJ bigint,
    in pIE bigint
)
begin
    insert into tbcliente (IdCli, NomeCli, NumEnd, CompEnd, CEP)
    values (pIdCli, pNomeCli, pNumEnd, pCompEnd, pCEP);

    insert into tbcliente_pj(CNPJ, IE, IdCli)
    values (pCNPJ, pIE, pIdCli);
end$$

delimiter ;

-- Chamadas:
call inserir_clientepj(6, 'Paganada', 159, null, 12345051, 12345678912345, 98765432198);
call inserir_clientepj(7, 'Caloteando', 69, null, 12345053, 12345678912346, 98765432199);
call inserir_clientepj(8, 'Semgrana', 189, null, 12345060, 12345678912347, 98765432100);
call inserir_clientepj(9, 'Cemreais', 5024, 'Sala 23', 12345060, 12345678912348, 98765432101);
call inserir_clientepj(10, 'Durango', 1254, null, 12345060, 12345678912349, 98765432102);
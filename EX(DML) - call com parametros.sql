
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
    in pCidade varchar(100)
)
begin
    if not exists (select 1 from tbcidade where Cidade = pCidade) then
        insert into tbcidade (Cidade)
        values (pCidade);
    end if;
end$$

delimiter ;

-- Chamadas:
call inserir_cidade('Rio de Janeiro');
call inserir_cidade('São Carlos');
call inserir_cidade('Campinas');
call inserir_cidade('Franco da Rocha');
call inserir_cidade('Osasco');
call inserir_cidade('Pirituba');
call inserir_cidade('Lapa');
call inserir_cidade('Ponta Grossa');


/*	
call inserir_cidade(9, 'São Paulo');
call inserir_cidade(10, 'Barra Mansa');
call inserir_cidade(11, 'Cuiabá');
call inserir_cidade(12, 'Recife');
*/


-- EX3 – ESTADOS
delimiter $$

create procedure inserir_estado(
    in pUf varchar(2)
)
begin
    if not exists (select 1 from tbestado where UF = pUf) then
        insert into tbestado (UF)
        values (pUf);
    end if;
end$$

delimiter ;


-- Chamadas:
call inserir_estado('SP');
call inserir_estado('RJ');
call inserir_estado('RS');


/*
call inserir_estado('MT');
call inserir_estado('PE');
*/


-- EX4 – BAIRROS

delimiter $$

create procedure inserir_bairro(
    in pBairro varchar(100)
)
begin
    if not exists (select 1 from tbbairro where Bairro = pBairro) then
        insert into tbbairro (Bairro)
        values (pBairro);
    end if;
end$$

delimiter ;

-- Chamadas:
call inserir_bairro('Aclimação');
call inserir_bairro('Capão Redondo');
call inserir_bairro('Pirituba');
call inserir_bairro('Liberdade');


/*
call inserir_bairro('Lapa');
call inserir_bairro('Consolação');
call inserir_bairro('Penha');
call inserir_bairro('Barra Funda');
call inserir_bairro('Jardim Santa Isabel');
call inserir_bairro('Sei Lá');
*/



-- EX5 – PRODUTOS

delimiter $$

create procedure inserir_produto(
    in pCodigoBarras bigint,
    in pNome varchar(100),
    in pValor decimal(10,2),
    in pQtd int
)
begin
    -- Verifica se o produto já existe pelo código de barras
    if not exists (
        select 1 from tbproduto where CodigoBarras = pCodigoBarras
    ) then
        
        insert into tbproduto (CodigoBarras, Nome, Valor, Qtd)
        values (pCodigoBarras, pNome, pValor, pQtd);
    
    end if;
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
    -- Verifica se o CEP já existe
    if not exists (select 1 from tbendereco where CEP = pCEP) then
    
        insert into tbendereco (Logradouro, BairroID, CidadeId, UFId, CEP)
        values (pLogradouro, pBairroID, pCidadeID, pUFID, pCEP);
    
    end if;
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

/*
call inserir_endereco('Rua Veia', 9, 11, 4, 12345059);
call inserir_endereco('Rua Nova', 9, 11, 4, 12345058);
call inserir_endereco('Rua dos Amores', 10, 12, 5, 12345060);
*/


-- EX7 – CLIENTE PF

delimiter $$

DELIMITER $$

CREATE PROCEDURE inserir_cliente_pf(
    IN pNomeCli VARCHAR(200),
    IN pNumEnd INT,
    IN pCompEnd VARCHAR(50),
    IN pCEP DECIMAL(8,0),
    IN pLogradouro VARCHAR(150),
    IN pBairro VARCHAR(100),
    IN pCidade VARCHAR(100),
    IN pUF CHAR(2),
    IN pCPF DECIMAL(11,0),
    IN pRG DECIMAL(9,0),
    IN pRGDig CHAR(1),
    IN pNasc DATE
)
BEGIN
    DECLARE vBairroId INT;
    DECLARE vCidadeId INT;
    DECLARE vUFId INT;
    DECLARE vIdCli INT;

    -- Verificação Estado
    IF NOT EXISTS (SELECT 1 FROM tbestado WHERE UF = pUF) THEN
        INSERT INTO tbestado (UF) VALUES (pUF);
    END IF;

    SELECT UFId INTO vUFId FROM tbestado WHERE UF = pUF;

    -- Verificação Cidade
    IF NOT EXISTS (SELECT 1 FROM tbcidade WHERE Cidade = pCidade) THEN
        INSERT INTO tbcidade (Cidade) VALUES (pCidade);
    END IF;

    SELECT CidadeId INTO vCidadeId FROM tbcidade WHERE Cidade = pCidade;

    -- Verificação Bairro
    IF NOT EXISTS (SELECT 1 FROM tbbairro WHERE Bairro = pBairro) THEN
        INSERT INTO tbbairro (Bairro) VALUES (pBairro);
    END IF;

    SELECT BairroId INTO vBairroId FROM tbbairro WHERE Bairro = pBairro;

    -- Insert Endereço
    IF NOT EXISTS (SELECT 1 FROM tbendereco WHERE CEP = pCEP) THEN
        INSERT INTO tbendereco (Logradouro, BairroId, CidadeId, UFId, CEP)
        VALUES (pLogradouro, vBairroId, vCidadeId, vUFId, pCEP);
    END IF;

    -- Insert Cliente
    INSERT INTO tbcliente (NomeCli, NumEnd, CompEnd, CEP)
    VALUES (pNomeCli, pNumEnd, pCompEnd, pCEP);
	
    -- Pega o ultimo ID criado pelo o autoincrement
    SET vIdCli = LAST_INSERT_ID();

    -- Cliente PF
    INSERT INTO tbcliente_pf (CPF, RG, RG_Dig, Nasc, IdCli)
    VALUES (pCPF, pRG, pRGDig, pNasc, vIdCli);

END $$

DELIMITER ;

-- Chamadas:
call inserir_clientepf('Pimpão', 325, null, 12345051, 'Av Brasil', 'Lapa', 'Campinas', 'SP', 12345678911, 12345678, '0', '2000-10-12');
call inserir_clientepf('Disney Chaplin', 89, 'Ap. 12', 12345053, 'Av Paulista', 'Penha', 'Rio de Janeiro', 'RJ', 12345678912, 12345679, '0', '2001-11-21');
call inserir_clientepf('Marciano', 744, null, 12345054, 'Rua Ximbú', 'Penha', 'Rio de Janeiro', 'RJ', 12345678913, 12345680, '0', '2001-06-01');
call inserir_clientepf('Lança Perfume', 128, null, 12345059, 'Rua Vieia', 'Jardim Santa Isabel', 'Cuiabá', 'MT', 12345678914, 12345681, 'X', '2004-04-05');
call inserir_clientepf('Remédio Amargo', 2585, null, 12345058, 'Av Nova', 'Jardim Santa Isabel', 'Cuiabá', 'MT', 12345678915, 12345682, '0', '2002-07-15');


-- EX8 – CLIENTE PJ

DELIMITER $$

CREATE PROCEDURE inserir_cliente_pj(
    IN pNomeCli VARCHAR(200),
    IN pNumEnd INT,
    IN pCompEnd VARCHAR(50),
    IN pCEP DECIMAL(8,0),
    IN pLogradouro VARCHAR(150),
    IN pBairro VARCHAR(100),
    IN pCidade VARCHAR(100),
    IN pUF CHAR(2),
    IN pCNPJ DECIMAL(14,0),
    IN pIE DECIMAL(11,0)
)
BEGIN
    DECLARE vBairroId INT;
    DECLARE vCidadeId INT;
    DECLARE vUFId INT;
    DECLARE vIdCli INT;

    IF NOT EXISTS (SELECT 1 FROM tbestado WHERE UF = pUF) THEN
        INSERT INTO tbestado (UF) VALUES (pUF);
    END IF;

    SELECT UFId INTO vUFId FROM tbestado WHERE UF = pUF;

    IF NOT EXISTS (SELECT 1 FROM tbcidade WHERE Cidade = pCidade) THEN
        INSERT INTO tbcidade (Cidade) VALUES (pCidade);
    END IF;

    SELECT CidadeId INTO vCidadeId FROM tbcidade WHERE Cidade = pCidade;

    IF NOT EXISTS (SELECT 1 FROM tbbairro WHERE Bairro = pBairro) THEN
        INSERT INTO tbbairro (Bairro) VALUES (pBairro);
    END IF;

    SELECT BairroId INTO vBairroId FROM tbbairro WHERE Bairro = pBairro;

    IF NOT EXISTS (SELECT 1 FROM tbendereco WHERE CEP = pCEP) THEN
        INSERT INTO tbendereco (Logradouro, BairroId, CidadeId, UFId, CEP)
        VALUES (pLogradouro, vBairroId, vCidadeId, vUFId, pCEP);
    END IF;

    INSERT INTO tbcliente (NomeCli, NumEnd, CompEnd, CEP)
    VALUES (pNomeCli, pNumEnd, pCompEnd, pCEP);

    SET vIdCli = LAST_INSERT_ID();

    INSERT INTO tbcliente_pj (CNPJ, IE, IdCli)
    VALUES (pCNPJ, pIE, vIdCli);

END $$

DELIMITER ;

-- Chamadas:
call inserir_clientepf(1, 'Pimpão', 325, null, 12345051, 'Av Brasil', 'Lapa', 'Campinas', 'SP', 12345678911, 12345678, '0', '2000-10-12');
call inserir_clientepf(2, 'Disney Chaplin', 89, 'Ap. 12', 12345053, 'Av Paulista', 'Penha', 'Rio de Janeiro', 'RJ', 12345678912, 12345679, '0', '2001-11-21');
call inserir_clientepf(3, 'Marciano', 744, null, 12345054, 'Rua Ximbú', 'Penha', 'Rio de Janeiro', 'RJ', 12345678913, 12345680, '0', '2001-06-01');
call inserir_clientepf(4, 'Lança Perfume', 128, null, 12345059, 'Rua Vieia', 'Jardim Santa Isabel', 'Cuiabá', 'MT', 12345678914, 12345681, 'X', '2004-04-05');
call inserir_clientepf(5, 'Remédio Amargo', 2585, null, 12345058, 'Av Nova', 'Jardim Santa Isabel', 'Cuiabá', 'MT', 12345678915, 12345682, '0', '2002-07-15');


-- EX9 - COMPRAS

DELIMITER $$

CREATE PROCEDURE spInserir_Compras(
    IN pNotaFiscal INT,
    IN pDataCompra VARCHAR(50),
    IN pFornecedor VARCHAR(200),
    IN pCodigo DECIMAL(14,0),
    IN pValorItem DECIMAL(8,2),
    IN pQtd INT,
    IN pQtdTotal INT,
    IN pValorTotal DECIMAL(8,2)
)
BEGIN
    -- Verifica fornecedor
    IF EXISTS (SELECT 1 FROM tbfornecedor WHERE Nome = pFornecedor)
       AND EXISTS (SELECT 1 FROM tbproduto WHERE CodigoBarras = pCodigo)
    THEN
        
        INSERT INTO tbcompra (NotaFiscal, DataCompra, ValorTotal, QtdTotal)
        VALUES (pNotaFiscal, STR_TO_DATE(pDataCompra, '%d/%m/%Y'), pValorTotal, pQtdTotal);

        INSERT INTO tbitemcompra (ValorItem, CodigoBarras, NotaFiscal, Qtd)
        VALUES (pValorItem, pCodigo, pNotaFiscal, pQtd);

    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Fornecedor ou produto não encontrados.';
    END IF;
END $$

DELIMITER ;

-- Chamadas
call spInserir_Compras(8449, '01/05/2018', 'Amoroso e Doce', 12345678910111, 22.22, 200, 700, 21944.00);
call spInserir_Compras(2482, '22/04/2020', 'Revenda Chico Loco', 12345678910112, 40.50, 180, 180, 7290.00);
call spInserir_Compras(21563, '12/07/2020', 'Marcelo Dedal', 12345678910113, 3.00, 300, 300, 900.00);
call spInserir_Compras(8459, '01/05/2018', 'Amoroso e Doce', 12345678910114, 35.00, 500, 700, 21944.00);
call spInserir_Compras(156354, '23/11/2021', 'Revenda Chico Loco', 12345678910115, 54.00, 350, 350, 18900.00);


-- EX10 - REGISTRO DE VENDAS

delimiter $$
create procedure spinserir_registrovenda(
pNumeroVenda int,
pCliente varchar(200),
pCodigoBarras decimal(14,0),
pQtd int,
pTotalVenda decimal(8,2))
begin
declare vIdCli int;
declare vValorItem decimal(8,2);
if exists (select 1 from tbcliente where NomeCli = pCliente) and exists (select 1 from tbproduto where CodigoBarras = pCodigoBarras) then
	select IdCli into vIdCli from tbcliente where NomeCli = pCliente;
    select Valor into vValorItem from tbproduto where CodigoBarras = pCodigoBarras;
    
     insert into tbvenda(NumeroVenda, DataVenda, TotalVenda, IdCli)
    values(pNumeroVenda,current_date(), pTotalVenda, vIdCli);

	insert into tbitemvenda(NumeroVenda, CodigoBarras, ValorItem, Qtd)
    values(pNumeroVenda, pCodigoBarras, vValorItem, pQtd);
    
   
end if; 
end$$
call spinserir_registrovenda(1,'Pimpão', 12345678910111, 1, 54.61);
call spinserir_registrovenda(2,'Lança Perfume', 12345678910112, 2, 200.90);
call spinserir_registrovenda(3,'Pimpão', 12345678910113, 1, 44.00);

-- EX11
delimiter $$
create procedure spinserir_notafiscal(
pNF int,
pCliente varchar(200))
begin
	declare vTotalNota decimal(8,2);
	declare vIdCli int;
	if exists (select 1 from tbcliente where NomeCli = pCliente) then
		select IdCli into vIdCli from tbcliente where NomeCli = pCliente;
        select sum(TotalVenda) into vTotalNota from tbvenda where IdCli = vIdCli;
        
        if vTotalNota > 0 then
			insert into tbnota_fiscal(NF, DataEmissao, TotalNota)
			values(pNF, current_date(), vTotalNota);
		end if;
	end if;
end$$

call spinserir_notafiscal(359, 'Pimpão');
call spinserir_notafiscal(360, 'Lança Perfume');

-- ex12
call inserir_produto(12345678910130, 'Camiseta de Poliéster', 33.61, 100);
call inserir_produto(12345678910131, 'Blusa Frio Moletom', 200.00, 100);
call inserir_produto(12345678910132, 'Vestido Decote Redondo', 144.00, 50);

-- Ex13
delimiter $$
create procedure spapagar_produtos(
pCodigoBarras decimal(14,0))
begin
delete from tbproduto where CodigoBarras = pCodigoBarras;
end$$
call spapagar_produtos(12345678910116);
call spapagar_produtos(12345678910117);

-- ex14
delimiter $$
create procedure spupdate_produtos(
pCodigoBarras decimal(14,0),
pNome varchar(200),
pValorUnitario decimal(8,2))
begin
update tbproduto set Nome = pNome, Valor = pValorUnitario where CodigoBarras = pCodigoBarras;
end$$
call spupdate_produtos(12345678910111, 'Rei de Papel Mache', 64.50);
call spupdate_produtos(12345678910111, 'Rei de Papel Mache', 64.50);

-- Ex15
delimiter $$
create procedure spmostrar_produtos()
begin
select * from tbproduto;
end$$
call spmostrar_produtos();

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

DELIMITER $$

CREATE PROCEDURE inserir_endereco(
    IN pLogradouro VARCHAR(150),
    IN pBairro VARCHAR(100),
    IN pCidade VARCHAR(100),
    IN pUF CHAR(2),
    IN pCEP INT
)
BEGIN
    DECLARE vBairroId INT;
    DECLARE vCidadeId INT;
    DECLARE vUFId INT;

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

END $$

DELIMITER ;

-- Chamadas:
call inserir_endereco('Rua da Federal', 'Pirituba', 'Campinas', 'SP', 12345050);
call inserir_endereco('Av Brasil', 'Pirituba', 'Campinas', 'SP', 12345051);
call inserir_endereco('Rua Liberdade', 'Liberdade', 'Campinas', 'SP', 12345052);
call inserir_endereco('Av Paulista', 'Lapa', 'São Paulo', 'SP', 12345053);
call inserir_endereco('Rua Ximbú', 'Lapa', 'São Paulo', 'SP', 12345054);
call inserir_endereco('Rua Piu XI', 'Lapa', 'Campinas', 'SP', 12345055);
call inserir_endereco('Rua Chocolate', 'Capão Redondo', 'Osasco', 'SP', 12345056);
call inserir_endereco('Rua Pão na Chapa', 'Ponta Grossa', 'Ponta Grossa', 'RS', 12345057);


/*
call inserir_endereco('Rua Veia', 9, 11, 4, 12345059);
call inserir_endereco('Rua Nova', 9, 11, 4, 12345058);
call inserir_endereco('Rua dos Amores', 10, 12, 5, 12345060);
*/


-- EX7 – CLIENTE PF

DELIMITER $$

CREATE PROCEDURE inserir_clientepf(
    IN pNomeCli VARCHAR(200),
    IN pNumEnd DECIMAL(6,0),
    IN pCompEnd VARCHAR(50),
    IN pCEP DECIMAL(8,0),
    IN pLogradouro VARCHAR(200),
    IN pBairro VARCHAR(200),
    IN pCidade VARCHAR(200),
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

    SELECT UFId INTO vUFId FROM tbestado WHERE UF = pUF;
    IF vUFId IS NULL THEN
        INSERT INTO tbestado(UF) VALUES (pUF);
        SET vUFId = LAST_INSERT_ID();
    END IF;

    SELECT CidadeId INTO vCidadeId FROM tbcidade WHERE Cidade = pCidade;
    IF vCidadeId IS NULL THEN
        INSERT INTO tbcidade(Cidade) VALUES (pCidade);
        SET vCidadeId = LAST_INSERT_ID();
    END IF;

    SELECT BairroId INTO vBairroId FROM tbbairro WHERE Bairro = pBairro;
    IF vBairroId IS NULL THEN
        INSERT INTO tbbairro(Bairro) VALUES (pBairro);
        SET vBairroId = LAST_INSERT_ID();
    END IF;

    IF NOT EXISTS(SELECT 1 FROM tbendereco WHERE CEP = pCEP) THEN
        INSERT INTO tbendereco(Logradouro, CEP, BairroId, CidadeId, UFId)
        VALUES (pLogradouro, pCEP, vBairroId, vCidadeId, vUFId);
    END IF;

    INSERT INTO tbcliente(NomeCli, NumEnd, CompEnd, CEP)
    VALUES (pNomeCli, pNumEnd, pCompEnd, pCEP);

    SET vIdCli = LAST_INSERT_ID();

    INSERT INTO tbcliente_pf(CPF, RG, RG_Dig, Nasc, IdCli)
    VALUES (pCPF, pRG, pRGDig, pNasc, vIdCli);

END$$

DELIMITER ;

-- Chamadas

CALL inserir_clientepf('Pimpão', 325, NULL, 12345051, 'Av Brasil', 'Lapa', 'Campinas', 'SP', 12345678911, 12345678, '0', '2000-10-12');
CALL inserir_clientepf('Disney Chaplin', 89, 'Ap. 12', 12345053, 'Av Paulista', 'Penha', 'Rio de Janeiro', 'RJ', 12345678912, 12345679, '0', '2001-11-21');
CALL inserir_clientepf('Marciano', 744, NULL, 12345054, 'Rua Ximbu', 'Penha', 'Rio de Janeiro', 'RJ', 12345678913, 12345680, '0', '2001-06-01');
CALL inserir_clientepf('Lanca Perfume', 128, NULL, 12345059, 'Rua Veia', 'Jardim Santa Isabel', 'Cuiaba', 'MT', 12345678914, 12345681, 'X', '2004-04-05');
CALL inserir_clientepf('Remedio Amargo', 2585, NULL, 12345058, 'Av Nova', 'Jardim Santa Isabel', 'Cuiaba', 'MT', 12345678915, 12345682, '0', '2002-07-15');


-- EX8 – CLIENTE PJ

DELIMITER $$

CREATE PROCEDURE inserir_clientepj(
    IN pNomeCli VARCHAR(200),
    IN pNumEnd DECIMAL(6,0),
    IN pCompEnd VARCHAR(50),
    IN pCEP DECIMAL(8,0),
    IN pLogradouro VARCHAR(200),
    IN pBairro VARCHAR(200),
    IN pCidade VARCHAR(200),
    IN pUF CHAR(2),
    IN pCNPJ DECIMAL(14,0),
    IN pIE DECIMAL(12,0)
)
BEGIN
    DECLARE vBairroId INT;
    DECLARE vCidadeId INT;
    DECLARE vUFId INT;
    DECLARE vIdCli INT;

    SELECT UFId INTO vUFId FROM tbestado WHERE UF = pUF;
    IF vUFId IS NULL THEN
        INSERT INTO tbestado(UF) VALUES (pUF);
        SET vUFId = LAST_INSERT_ID();
    END IF;

    SELECT CidadeId INTO vCidadeId FROM tbcidade WHERE Cidade = pCidade;
    IF vCidadeId IS NULL THEN
        INSERT INTO tbcidade(Cidade) VALUES (pCidade);
        SET vCidadeId = LAST_INSERT_ID();
    END IF;

    SELECT BairroId INTO vBairroId FROM tbbairro WHERE Bairro = pBairro;
    IF vBairroId IS NULL THEN
        INSERT INTO tbbairro(Bairro) VALUES (pBairro);
        SET vBairroId = LAST_INSERT_ID();
    END IF;

    IF NOT EXISTS (SELECT 1 FROM tbendereco WHERE CEP = pCEP) THEN
        INSERT INTO tbendereco(Logradouro, CEP, BairroId, CidadeId, UFId)
        VALUES (pLogradouro, pCEP, vBairroId, vCidadeId, vUFId);
    END IF;

    INSERT INTO tbcliente(NomeCli, NumEnd, CompEnd, CEP)
    VALUES (pNomeCli, pNumEnd, pCompEnd, pCEP);

    SET vIdCli = LAST_INSERT_ID();

    INSERT INTO tbcliente_pj(CNPJ, IE, IdCli)
    VALUES (pCNPJ, pIE, vIdCli);

END$$

DELIMITER ;

-- Chamadas:

call inserir_clientepj('Paganada', 159, NULL, 12345051, 'Av Brasil', 'Lapa', 'Campinas', 'SP', 12345678912345, 98765432198);
call inserir_clientepj('Caloteando', 69, NULL, 12345053, 'Av Paulista', 'Penha', 'Rio de Janeiro', 'RJ', 12345678912346, 98765432199);
call inserir_clientepj('Semgrana', 189, NULL, 12345060, 'Rua dos Amores', 'Sei Lá', 'Recife', 'PE', 12345678912347, 98765432100);
call inserir_clientepj('Cemreais', 5024, 'Sala 23', 12345060, 'Rua dos Amores', 'Sei Lá', 'Recife', 'PE', 12345678912348, 98765432101);
call inserir_clientepj('Durango', 1254, NULL, 12345060, 'Rua dos Amores', 'Sei Lá', 'Recife', 'PE', 12345678912349, 98765432102);


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
    -- Verifica fornecedor e produto
    IF EXISTS (SELECT 1 FROM tbfornecedor WHERE Nome = pFornecedor)
       AND EXISTS (SELECT 1 FROM tbproduto WHERE CodigoBarras = pCodigo)
    THEN
        
        -- Só insere na tabela tbcompra se a NotaFiscal NÃO existir
        IF NOT EXISTS (SELECT 1 FROM tbcompra WHERE NotaFiscal = pNotaFiscal) THEN
            INSERT INTO tbcompra (NotaFiscal, DataCompra, ValorTotal, QtdTotal)
            VALUES (pNotaFiscal, STR_TO_DATE(pDataCompra, '%d/%m/%Y'), pValorTotal, pQtdTotal);
        END IF;

        -- Sempre insere o item da compra
        INSERT INTO tbitemcompra (ValorItem, CodigoBarras, NotaFiscal, Qtd)
        VALUES (pValorItem, pCodigo, pNotaFiscal, pQtd);
		
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Fornecedor ou produto não encontrados.';
    END IF;
END $$

DELIMITER ;

-- Chamadas
call spInserir_Compras(8459, '01/05/2018', 'Amoroso e Doce', 12345678910111, 22.22, 200, 700, 21944.00);
call spInserir_Compras(2482, '22/04/2020', 'Revenda Chico Loco', 12345678910112, 40.50, 180, 180, 7290.00);
call spInserir_Compras(21563, '12/07/2020', 'Marcelo Dedal', 12345678910113, 3.00, 300, 300, 900.00);
call spInserir_Compras(8459, '01/05/2018', 'Amoroso e Doce', 12345678910114, 35.00, 500, 700, 21944.00);
call spInserir_Compras(156354, '23/11/2021', 'Revenda Chico Loco', 12345678910115, 54.00, 350, 350, 18900.00);


-- EX10 - REGISTRO DE VENDAS

DELIMITER $$

CREATE PROCEDURE spinserir_registrovenda(
    IN pNumeroVenda INT,
    IN pCliente VARCHAR(200),
    IN pCodigoBarras DECIMAL(14,0),
    IN pQtd INT
)
BEGIN
    DECLARE vIdCli INT;
    DECLARE vValorItem DECIMAL(8,2);
    DECLARE vTotalVenda DECIMAL(8,2);

    IF EXISTS (SELECT 1 FROM tbcliente WHERE NomeCli = pCliente) AND EXISTS (SELECT 1 FROM tbproduto WHERE CodigoBarras = pCodigoBarras) THEN
       
        SELECT IdCli INTO vIdCli FROM tbcliente WHERE NomeCli = pCliente;

        SELECT Valor INTO vValorItem FROM tbproduto WHERE CodigoBarras = pCodigoBarras;

        SET vTotalVenda = vValorItem * pQtd;

        INSERT INTO tbvenda(NumeroVenda, DataVenda, TotalVenda, IdCli)
        VALUES (pNumeroVenda, CURRENT_DATE(), vTotalVenda, vIdCli);

        INSERT INTO tbitemvenda(NumeroVenda, CodigoBarras, ValorItem, Qtd)
        VALUES (pNumeroVenda, pCodigoBarras, vValorItem, pQtd);

    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Erro: cliente ou produto não cadastrado.';
    END IF;

END $$
DELIMITER ;

call spinserir_registrovenda(1,'Pimpão',        12345678910111, 1);
call spinserir_registrovenda(2,'Lança Perfume', 12345678910112, 2);
call spinserir_registrovenda(3,'Pimpão',        12345678910113, 1);


-- EX11 - NOTA FISCAL

DELIMITER $$

CREATE PROCEDURE spinserir_notafiscal(
    IN pNF INT,
    IN pCliente VARCHAR(200)
)
BEGIN
    DECLARE vIdCli INT;
    DECLARE vTotalNota DECIMAL(8,2);

    IF EXISTS (SELECT 1 FROM tbcliente WHERE NomeCli = pCliente) THEN

        SELECT IdCli INTO vIdCli
        FROM tbcliente
        WHERE NomeCli = pCliente;

        SELECT SUM(TotalVenda)
        INTO vTotalNota
        FROM tbvenda
        WHERE IdCli = vIdCli;

        IF vTotalNota IS NOT NULL AND vTotalNota > 0 THEN
            INSERT INTO tbnota_fiscal (NF, DataEmissao, TotalNota)
            VALUES (pNF, CURRENT_DATE(), vTotalNota);
        END IF;

    END IF;
END$$

DELIMITER ;


-- Chamadas 

call spinserir_notafiscal(359, 'Pimpão');
call spinserir_notafiscal(360, 'Lança Perfume');


-- EX 12 - PRODUTOS 

call inserir_produto(12345678910130, 'Camiseta de Poliéster', 33.61, 100);
call inserir_produto(12345678910131, 'Blusa Frio Moletom', 200.00, 100);
call inserir_produto(12345678910132, 'Vestido Decote Redondo', 144.00, 50);


-- EX13 - APAGAR PRODUTOS

DELIMITER $$

CREATE PROCEDURE spapagar_produtos(
    pCodigoBarras DECIMAL(14,0)
)
BEGIN
    IF EXISTS (SELECT 1 FROM tbproduto WHERE CodigoBarras = pCodigoBarras) THEN
        
        DELETE FROM tbproduto 
        WHERE CodigoBarras = pCodigoBarras;

    END IF;

END$$

DELIMITER ;

-- Chamadas 

call spapagar_produtos(12345678910116);
call spapagar_produtos(12345678910117);


-- EX14 - ATUALIZAR PRODUTOS

DELIMITER $$

CREATE PROCEDURE spupdate_produtos(
    pCodigoBarras DECIMAL(14,0),
    pNome VARCHAR(200),
    pValorUnitario DECIMAL(8,2)
)
BEGIN
    IF EXISTS (SELECT 1 FROM tbproduto WHERE CodigoBarras = pCodigoBarras) THEN
        UPDATE tbproduto
        SET Nome = pNome,
            Valor = pValorUnitario
        WHERE CodigoBarras = pCodigoBarras;
    END IF;
END$$

DELIMITER ;

-- Chamadas

call spupdate_produtos(12345678910111, 'Rei de Papel Mache', 64.50);
call spupdate_produtos(12345678910112, 'Bolinha de Sabão', 120.00);
call spupdate_produtos(12345678910113, 'Carro Bate Bate', 64.00);



-- EX15 - MOSTRAR PRODUTOS

DELIMITER $$

CREATE PROCEDURE spMostrar_Produtos()
BEGIN
    SELECT * FROM tbproduto;
END$$

DELIMITER ;

-- Chamadas 

call spMostrar_Produtos();

-- EX1

insert into tbfornecedor (Codigo, Nome, CNPJ, Telefone)
values (1, 'Revenda Chico Loco',  1245678937123, 11934567897),
	   (2, 'José Faz Tudo S/A',  1345678937123, 11934567898),
	   (3, 'Vadalto Entregas',  1445678937123, 11934567899),
	   (4, 'Astrogildo das Estrela',  1545678937123, 11934567800),
	   (5, 'Amoroso e Doce',  1645678937123, 11934567801),
	   (6, 'Marcelo Dedal',  1745678937123, 11934567802),
	   (7, 'Francisco Cachaça',  1845678937123, 11934567803),
	   (8, 'Joãozinho Chupeta',  1945678937123, 11934567804);

-- EX2

delimiter $$

create procedure inserir_cidades()
begin
    insert into tbcidade (CidadeID, Cidade)
    values 
        (1, 'Rio de Janeiro'),
        (2, 'São Carlos'),
        (3, 'Campinas'),
        (4, 'Franco da Rocha'),
        (5, 'Osasco'),
        (6, 'Pirituba'),
        (7, 'Lapa'),
        (8, 'Ponta Grossa');
end$$

delimiter ;

call inserir_cidades();

-- EX3

delimiter $$

create procedure inserir_estados()
begin
    insert into tbestado (UfID, Uf)
    values 
        (1, 'SP'),
        (2, 'RJ'),
        (3, 'RS');
end$$

delimiter ;

call inserir_estados();

-- EX4

delimiter $$

create procedure inserir_bairros()
begin
    insert into tbbairro (BairroID, Bairro)
    values 
        (1, 'Aclimação'),
        (2, 'Capão Redondo'),
        (3, 'Pirituba'),
        (4, 'Liberdade');
        
end$$

delimiter ;

call inserir_bairros();

-- EX5

delimiter $$

create procedure inserir_produtos()
begin
    insert into tbproduto (CodigoBarras, Nome, Valor, Qtd)
    values
		(12345678910111,'Rei de Papel Mache', 54.61, 120),
        (12345678910112,'Bolinha de Sabão', 100.45, 120),
        (12345678910113,'Carro Bate', 44.00, 120),
        (12345678910114,'Bola Furada', 10.00, 120),
        (12345678910115,'Maçã Laranja', 99.44, 120),
        (12345678910116,'Boneco do Hitler', 124.00, 200),
        (12345678910117,'Farinha de Suruí', 50.00, 200),
        (12345678910118,'Zelador de Cemitério', 24.50, 100);
        
end$$

delimiter ;

call inserir_produtos();

-- EX6

delimiter $$

create procedure inserir_enderecos()
begin
	insert into tbbairro (BairroId, Bairro)
    values
        (5, 'Lapa'),
        (6, 'Consolação'),
        (7, 'Penha'),
        (8, 'Barra Funda');
        
	insert into tbcidade (CidadeId, Cidade)
    values
		(9, 'São Paulo'),
        (10, 'Barra Mansa');
        
    insert into tbendereco (Logradouro, BairroID, CidadeId, UFId, CEP)
    values 
        ('Rua da Federal', 5, 9, 1, 12345050),
        ('Av Brasil', 5, 3, 1, 12345051),
        ('Rua Liberdade', 6, 9, 1, 12345052),
        ('Av Paulista', 7, 1, 2, 12345053),
        ('Rua Ximbú', 7, 1, 2, 12345054),
        ('Rua Piu XI', 7, 3, 1, 12345055),
        ('Rua Chocolate', 1, 10, 2, 12345056),
        ('Rua Pão na Chapa', 8, 8, 3, 12345057);
end$$

delimiter ;

call inserir_enderecos();


-- EX7 

delimiter $$

create procedure inserir_clientepf()
begin

    insert into tbestado (UfId, Uf)
    values
        (4, 'MT');
        
    insert into tbcidade (CidadeID, Cidade)
    values
        (11, 'Cuiabá');
        
    insert into tbbairro (BairroId, Bairro)
    values
        (9, 'Jardim Santa Isabel');    
    
    insert into tbendereco (Logradouro, BairroID, CidadeId, UFId, CEP)
    values
        ('Rua Veia', 9, 11, 4, 12345059),
        ('Rua Nova', 9, 11, 4, 12345058);
        
    insert into tbcliente (IdCli, NomeCli, NumEnd, CompEnd, CEP)
    values
        (1, 'Pimpão', 325, null, 12345051),
        (2, 'Disney Chaplin', 89, 'Ap. 12', 12345053),
        (3, 'Marciano', 744, null, 12345054),
        (4, 'Lança perfume', 128, null, 12345059),
        (5, 'Remédio Amargo', 2585, null, 12345058);
        
    insert into tbcliente_pf(CPF, RG, RG_Dig, Nasc, IdCli)
    values
        (12345678911, 12345678, '0', '2000-12-10', 1),
        (12345678912, 12345679, '0', '2001-11-21', 2),
        (12345678913, 12345670, '0', '2001-01-06', 3),
        (12345678914, 12345671, 'X', '2004-05-04', 4),
        (12345678915, 12345678, '0', '2002-07-15', 5);

end$$

delimiter ;

call inserir_clientepf();

-- EX8

delimiter $$

create procedure inserir_clientepj()
begin

    insert into tbestado (UfID, UF)
    values
        (5, 'PE');

    insert into tbcidade (CidadeId, Cidade)
    values
        (12, 'Recife');

    insert into tbbairro (BairroId, Bairro)
    values
        (10, 'Sei Lá');
        
    insert into tbendereco (Logradouro, BairroID, CidadeId, UFId, CEP)
    values
        ('Rua dos Amores', 10, 12, 5, 12345060);
        
    insert into tbcliente (IdCli, NomeCli, NumEnd, CompEnd, CEP)
    values
        (6, 'Paganada', 159, null, 12345051),
        (7, 'Caloteando', 69, null, 12345053),
        (8, 'Semgrana', 189, null, 12345060),
        (9, 'Cemreais', 5024, 'Sala 23', 12345060),
        (10, 'Durango', 1254, null, 12345060);
        
    insert into tbcliente_pj(CNPJ, IE, IdCli)
    values
        (12345678912345, 98765432198, 6),
        (12345678912346, 98765432199, 7),
        (12345678912347, 98765432100, 8),
        (12345678912348, 98765432101, 9),
        (12345678912349, 98765432102, 10);

end$$

delimiter ;

call inserir_clientepj();
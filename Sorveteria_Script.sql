CREATE DATABASE IF NOT EXISTS SORVETERIA_DH;
USE SORVETERIA_DH;

CREATE TABLE ENDERECO
( 	
	id_endereco INT(11) UNSIGNED AUTO_INCREMENT NOT NULL,
    Logradouro VARCHAR (45) NOT NULL,
    Bairro_endereco VARCHAR(45) NOT NULL,
    numero_endereco INT(10) NOT NULL,
    CEP VARCHAR(10) NOT NULL, 
		PRIMARY KEY (id_endereco)
       
);

CREATE TABLE CLIENTE
( 
	id_cliente INT(11) UNSIGNED AUTO_INCREMENT NOT NULL,
    nome_cliente VARCHAR(45) NOT NULL,
    sobrenome_cliente VARCHAR (45) NOT NULL, 
    endereco_id INT(11) UNSIGNED NULL ,
    telefone_cliente VARCHAR (20) NOT NULL,
    cpf_cliente BIGINT(11) UNSIGNED NOT NULL,
		PRIMARY KEY (id_cliente),
        FOREIGN KEY (endereco_id)
			REFERENCES ENDERECO(id_endereco)
);

CREATE TABLE PRODUTOS
(
	id_produtos INT(11) UNSIGNED AUTO_INCREMENT NOT NULL,
    tipo_sorvete VARCHAR(20) NOT NULL,
    sabor_sorvete VARCHAR(20) NOT NULL,
    quantidade_prod INT(11) UNSIGNED NOT NULL,
    preco_prod FLOAT(11) UNSIGNED NOT NULL,
			PRIMARY KEY (id_produtos)
);

CREATE TABLE PEDIDOS 
(
	id_pedidos INT(11) UNSIGNED AUTO_INCREMENT NOT NULL,
	cliente_id INT UNSIGNED NOT NULL,
    data_compra DATE NOT NULL,
    horario_compra DATETIME NOT NULL,
			PRIMARY KEY (id_pedidos),
            FOREIGN KEY(cliente_id)
				REFERENCES CLIENTE(id_cliente)
);

CREATE TABLE ITENS_PEDIDO
(
	id_itens_pedido INT(11) UNSIGNED AUTO_INCREMENT NOT NULL,
    quantidade_itped INT(11) UNSIGNED NOT NULL, 
    preco_itped FLOAT(11) UNSIGNED NOT NULL,
    valor_total FLOAT(11) UNSIGNED NOT NULL,
    pedidos_id INT UNSIGNED NOT NULL,
    produtos_id INT UNSIGNED NOT NULL,
		PRIMARY KEY (id_itens_pedido),
        FOREIGN KEY (pedidos_id)
			REFERENCES PEDIDOS(id_pedidos),
		FOREIGN KEY(produtos_id)
			REFERENCES PRODUTOS(id_produtos)

);

/*INSERÇÃO DE DADOS EM UMA DAS TABELAS */
INSERT INTO CLIENTE (nome_cliente, sobrenome_cliente, telefone_cliente, cpf_cliente)
VALUES ('Guilherme', 'Souza', '11942232142', '78048533801');

INSERT INTO ENDERECO(id_endereco, Logradouro, Bairro_endereco, numero_endereco, CEP)
	VALUES ('1', 'Rua das surpresas surpreendentes', 'Jardim Surpresa', '412', '12189010');

INSERT INTO CLIENTE (nome_cliente, sobrenome_cliente, telefone_cliente, cpf_cliente)
	VALUES ('Robesvaldo', 'Robenildo', '1140028922', '321498210' );

INSERT INTO ENDERECO(id_endereco, Logradouro, Bairro_endereco, numero_endereco, CEP)
	VALUES ('2', 'Rua Embaixadora Baixinha', 'Jardim Pequenos Gigantes', '312', '32148920');
/*ATUALIZAÇÃO DE DADOS EM UMA DAS TABELAS*/
UPDATE CLIENTE
	SET endereco_id = 1
WHERE id_cliente = 1;

UPDATE CLIENTE
	SET endereco_id = 2
WHERE id_cliente = 2;

/*EXCLUSÃO DE DADOS EM UMA DAS TABELAS*/
DELETE FROM CLIENTE
	WHERE id_cliente = '2';
/*SELEÇÃO DE DADOS EM UMA DAS TABELAS*/
SELECT nome_cliente , sobrenome_cliente
FROM CLIENTE;

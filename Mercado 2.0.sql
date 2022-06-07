DROP TABLE IF EXISTS FUNCIONARIO, CAIXA, REPOSITOR, VENDA, PRODUTO, CLIENTE, FORNECEDOR, ESTOQUE, CATEGORIA, ENDERECO, VENDA_PROD, VENDA_CLIENTE, REPOE, PRODUTO_FORNECEDOR, PRODUTO_ESTOQUE;

CREATE TABLE FUNCIONARIO(
	cpf CHAR(11),
    nome VARCHAR(30),
    telefone CHAR(11),
    PRIMARY KEY(cpf)
);

CREATE TABLE CATEGORIA( 
	id INTEGER,
    descricao VARCHAR(30),
    medida CHAR(2),
    PRIMARY KEY (id)
);

CREATE TABLE CAIXA(
	senha VARCHAR(10),
    cpf_fun CHAR(11),
    login VARCHAR(30),
    num_caixa INTEGER,
    PRIMARY KEY (cpf_fun),
    FOREIGN KEY(cpf_fun) REFERENCES FUNCIONARIO (cpf)
);

CREATE TABLE REPOSITOR(
    cpf_fun CHAR(11),
    corredor INTEGER,
	id INTEGER,
    endereco VARCHAR(50),
    PRIMARY KEY (cpf_fun),
    FOREIGN KEY(cpf_fun) REFERENCES FUNCIONARIO (cpf)
);

CREATE TABLE CLIENTE(
	cpf CHAR(11),
    nome VARCHAR(30),
    telefone CHAR(11),
    PRIMARY KEY(cpf)
);

CREATE TABLE VENDA(
	num_nota INTEGER,
    troco DECIMAL(10,2),
    valor DECIMAL(10,2),
    dat DATE,
    cpf_func CHAR(11),
    PRIMARY KEY(num_nota),
    FOREIGN KEY (cpf_func) REFERENCES FUNCIONARIO (cpf)
);

CREATE TABLE PRODUTO(
	cod INTEGER,
    preco DECIMAL(10,2),
    nome VARCHAR(30),
    id INTEGER,
    PRIMARY KEY (cod),
    FOREIGN KEY (id) REFERENCES CATEGORIA (id)
);

CREATE TABLE ESTOQUE(
	id INTEGER,
	validade DATE,
    quantidade INTEGER,
    PRIMARY KEY (id)
);

CREATE TABLE FORNECEDOR(
	cnpj CHAR(14),
    nome VARCHAR(30),
    telefone CHAR(11),
    PRIMARY KEY (cnpj)
);

CREATE TABLE ENDERECO(
	rua VARCHAR(30),
    bairro VARCHAR(30),
    numero INTEGER,
    cpf CHAR(11),
    PRIMARY KEY (numero, cpf),
    FOREIGN KEY (cpf) REFERENCES CLIENTE (cpf) ON DELETE CASCADE
);

CREATE TABLE REPOE(
	cpf_fun VARCHAR(11),
    cod_prod VARCHAR(20),
    PRIMARY KEY (cpf_fun, cod_prod),
    FOREIGN KEY (cpf_fun) REFERENCES FUNCIONARIO (cpf),
    FOREIGN KEY (cod_prod) REFERENCES PRODUTO (cod)
);

CREATE TABLE VENDA_PROD(
	num_nota INTEGER,
    cod_prod VARCHAR(20),
    quantidade INTEGER,
    PRIMARY KEY (num_nota, cod_prod),
    FOREIGN KEY (num_nota) REFERENCES VENDA (num_nota),
    FOREIGN KEY (cod_prod) REFERENCES PRODUTO (cod)
);

CREATE TABLE VENDA_CLIENTE(
	num_nota INTEGER,
    cpf_clie CHAR(11),
    PRIMARY KEY (num_nota, cpf_clie),
    FOREIGN KEY (num_nota) REFERENCES VENDA (num_nota),
    FOREIGN KEY (cpf_clie) REFERENCES CLIENTE (cpf)
);

CREATE TABLE PRODUTO_FORNECEDOR(
	cod_prod VARCHAR(20),
    cnpj_forne CHAR(14),
    PRIMARY KEY (cod_prod, cnpj_forne),
    FOREIGN KEY (cod_prod) REFERENCES PRODUTO (cod),
    FOREIGN KEY (cnpj_forne) REFERENCES FORNECEDOR (cnpj)
);

CREATE TABLE PRODUTO_ESTOQUE(
	id_estoque INTEGER,
    cod_prod VARCHAR(20),
    PRIMARY KEY (id_estoque, cod_prod),
    FOREIGN KEY (id_estoque) REFERENCES ESTOQUE (id),
    FOREIGN KEY (cod_prod) REFERENCES PRODUTO (cod)
);
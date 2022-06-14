DROP TABLE IF EXISTS FUNCIONARIO, CAIXA, REPOSITOR, VENDA, PRODUTO, CLIENTE, FORNECEDOR, ESTOQUE, CATEGORIA, ENDERECO, VENDA_PROD, VENDA_CLIENTE, REPOE, PRODUTO_FORNECEDOR, PRODUTO_ESTOQUE;

CREATE TABLE FUNCIONARIO(
	cpf CHAR(11),
    nome VARCHAR(30),
    telefone CHAR(14),
    PRIMARY KEY(cpf)
);

CREATE TABLE CATEGORIA( 
	id INTEGER,
    descricao VARCHAR(30),
    medida CHAR(2),
    PRIMARY KEY (id)
);

CREATE TABLE CAIXA(
	cpf_fun CHAR(11),
    senha VARCHAR(10),
    login VARCHAR(30),
    num_caixa INTEGER,
    PRIMARY KEY (cpf_fun),
    FOREIGN KEY(cpf_fun) REFERENCES FUNCIONARIO (cpf)
);

CREATE TABLE REPOSITOR(
    cpf_fun CHAR(11),
    corredor INTEGER,
	id INTEGER,
    PRIMARY KEY (cpf_fun),
    FOREIGN KEY(cpf_fun) REFERENCES FUNCIONARIO (cpf)
);

CREATE TABLE CLIENTE(
	cpf CHAR(11),
    nome VARCHAR(30),
    telefone CHAR(14),
    PRIMARY KEY(cpf)
);

CREATE TABLE VENDA(
  	cpf_func CHAR(11),
	num_nota INTEGER,
  	valor DECIMAL(10,2),
    troco DECIMAL(10,2),
    dat DATE,
    PRIMARY KEY(num_nota),
    FOREIGN KEY (cpf_func) REFERENCES FUNCIONARIO (cpf)
);

CREATE TABLE PRODUTO(
	cod CHAR(11),
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
    telefone CHAR(14),
    PRIMARY KEY (cnpj)
);

CREATE TABLE ENDERECO(
	cpf CHAR(11),
  	rua VARCHAR(30),
    bairro VARCHAR(30),
    numero INTEGER,
    PRIMARY KEY (numero, cpf),
    FOREIGN KEY (cpf) REFERENCES CLIENTE (cpf) ON DELETE CASCADE
);

CREATE TABLE REPOE(
	cpf_fun VARCHAR(11),
    cod_prod CHAR(11),
    PRIMARY KEY (cpf_fun, cod_prod),
    FOREIGN KEY (cpf_fun) REFERENCES FUNCIONARIO (cpf),
    FOREIGN KEY (cod_prod) REFERENCES PRODUTO (cod)
);

CREATE TABLE VENDA_PROD(
	num_nota INTEGER,
    cod_prod CHAR(11),
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
	cod_prod CHAR(11),
    cnpj_forne CHAR(14),
    PRIMARY KEY (cod_prod, cnpj_forne),
    FOREIGN KEY (cod_prod) REFERENCES PRODUTO (cod),
    FOREIGN KEY (cnpj_forne) REFERENCES FORNECEDOR (cnpj)
);

CREATE TABLE PRODUTO_ESTOQUE(
	id_estoque INTEGER,
    cod_prod CHAR(11),
    PRIMARY KEY (id_estoque, cod_prod),
    FOREIGN KEY (id_estoque) REFERENCES ESTOQUE (id),
    FOREIGN KEY (cod_prod) REFERENCES PRODUTO (cod)
);

INSERT INTO FUNCIONARIO (cpf, nome, telefone) VALUES ('37965478911', 'Julio Santos', '(43)98751642'), ('23158467925', 'Vanessa Cardoso', '(43)88415379'), ('45678932141', 'Emerson Henrique Nascimento', '(44)99154672'), ('25836914734', 'Fernando Souza', '(44)98357461'), ('96387452146', 'Julia Martins', '(44)99524347'), ('74815923610', 'Mateus Lansa', '(44)89784387'), ('35768921430', 'Lucas Ramos Castro', '(44)87512832'), ('95184763213', 'Viniccius Rodrigues', '(44)5054-5689'), ('24861597344', 'Igor Bonin', '(43)5543-2535'), ('64825499411', 'Leonardo Andre Mioto', '(44)51203607'), ('25853745301', 'Vitoria Costa', '(44)55625481'), ('42318414971', 'Leila Lima', '(44)36036152'), ('18639900035', 'Luiz Correia', '(44)37459211'), ('79176055906', 'Davi Cavalcanti', '(44)56445823'), ('18508225067', 'Carla Oliveira', '(44)85023318'), ('94071920750', 'Davi Azevedo', '(44)89528228'), ('65658510775', 'Leonardo Barros', '(44)71589259'), ('70411672916', 'Paulo Rocha', '(44)75879332'), ('70177771070', 'Giovanna Souza', '(44)38945451'), ('24485721868', 'Renan Gomes', '(44)20673448');
INSERT INTO CLIENTE (cpf, nome, telefone) VALUES ('22235465879', 'Renato Fernando Costa', '44998907070'), ('78895466322', 'Tatiana Pereira', '44997257465'), ('36255546500', 'Eduarda Santos Cristina', '44997524844'), ('98986525211', 'Karen Martinez', '44999118596'), ('04357915363', 'Jefferson Daniel Silva', '44998662479'), ('21567834533', 'Marco Aurelio Mioto', '44988997634'), ('51568564148', 'Ana Carla Rosa', '44998003515'), ('03518974632', 'Luan Alexandre', '44997994070'), ('73968486088', 'Jose Ricardo Amadeu', '44998462233'), ('08865498716', 'Matheus Santos Bezerra', '44999061493');
INSERT INTO CATEGORIA (id, descricao, medida) VALUES (1, 'Congelados e frios', 'Kg'), (2, 'Higiene Pessoal', 'Un'), (3, 'Bebidas', 'Ml'), (4, 'Bebidas', 'L'), (5, 'Padaria', 'Gr'), (6, 'Carnes', 'Kg'), (7, 'Matinais', 'Un'), (8, 'Perecivel', 'Kg'), (9, 'Hortifruti', 'Kg'), (10, 'Lacteo', 'Un');
INSERT INTO FORNECEDOR (cnpj, nome, telefone) VALUES ('92741641000115', 'Eduarda Cunha', '(62)83013718'), ('73822131000128', 'Letícia Barros', '(21)62467859'), ('99552991000182', 'Bruno Pereira', '(48)29416994'), ('78161382000122', 'Carolina Barbosa', '(14)75827471'), ('04358267000106', 'Vinicius Rocha', '(41)57872423'), ('14120879000110', 'Joao Araujo', '(51)93473191'), ('73327889000190', 'Laura Rocha', '(61)3971-4176'), ('29817816000194', 'Marisa Almeida', '(91)36146173'), ('82724630000173', 'Agatha Fernandes', '(37)48644577'), ('09803581000174', 'Fabio Santos', '(11)54893405');
INSERT INTO CAIXA (cpf_fun, senha, login, num_caixa) VALUES ('37965478911', '82465', 'User1', 1), ('23158467925', '96345', 'User2', 2), ('45678932141', '15974', 'User3', 3), ('25836914734', '73198', 'User4', 4), ('96387452146', '10203', 'User5', 2), ('74815923610', '24860', 'User6', 4), ('35768921430', '17930', 'User7', 1), ('95184763213', '33764', 'User8', 3), ('65658510775', '25121', 'User9', 2), ('64825499411', '31122', 'User10', 1);
INSERT INTO REPOSITOR (cpf_fun, corredor, id) VALUES ('25853745301', 1, 1), ('42318414971', 2, 2), ('18639900035', 3, 3), ('79176055906', 4, 4), ('18508225067', 5, 5), ('94071920750', 1, 6), ('65658510775', 2, 7), ('70411672916', 3, 8), ('70177771070', 4, 9), ('24485721868', 5, 10);
INSERT INTO PRODUTO (cod, preco, nome, id) VALUES ('02546783009', '37.00', 'Cx Cerveja Skol ', 3), ('60260898023', '35.90', 'Contra File', 6), ('15261076005', '5.00', 'Leite Lider', 10), ('43128460060', '6.00', 'Laranja', 9), ('76863511061', '5.69', 'Banana Nanica', 9), ('72083419073', '20.00', 'Cafe Paloma', 7), ('09532308059', '6.80', 'Presunto Frimesa', 1), ('43246054088', '7.80', 'Pao de leite Vo Neusa', 5), ('70075296071', '8.50', 'Coca Cola', 4), ('14608682008', '7.50', 'Papel Higienico Dueto', 2);
INSERT INTO ESTOUQE (id, validade, quantidade) VALUES (1, '05/02/23', 100), (2, '15/01/23', 25), (3, '07/07/22', 5), (4, '12/01/23', 20), (5, '03/03/23', 60), (6, '11/12/22', 30), (7, '30/08/22', 50), (8, '05/07/22', 10), (9, '15/08/22', 20), (10, '22/02/23', 90);
INSERT INTO ENDERECO (cpf, rua, bairro, numero) VALUES ('22235465879', 'Rua Paris', 'Centro', 470), ('78895466322', 'Rua Minas Gerais','Novo Centro', 30), ('36255546500', 'Av Espanha', 'São Pedro', 258), ('98986525211', 'Av Manoel Mendes Bandeira','Centro', 564), ('04357915363', 'Rua Marechal Rondon', 'Tulipas', 752), ('21567834533', 'Rua Heitor Alencar Furtado', 'Centro', 396), ('51568564148', 'Rua Araruna', 'Centro', 959), ('03518974632', 'Av. Indio Bandeira', 'Novo Horizonte', 143), ('73968486088', 'Rua Rio de Janeiro', 'Novo Centro', 245), ('08865498716', 'Rua Pedro Possani', 'Jardim Novo', 442);
INSERT INTO VENDA (cpf_func, num_nota, valor, troco, dat) VALUES ('37965478911', 1, '64.00', '6.00', '10/06/22'), ('37965478911', 2, '10.00', '40.00', '31/05/22'), ('37965478911', 3, '24.00', '26.00', '08/06/22'), ('37965478911', 4, '28.45', '1.55', '25/05/22'), ('37965478911', 5, '100.00', '0.00', '02/06/22'), ('37965478911', 6, '7.80', '2.20', '11/06/22'), ('37965478911', 7, '51.00', '49.00', '10/06/22'), ('37965478911', 8, '15.00', '5.00', '05/06/22'), ('37965478911', 9, '37.00', '13.00', '07/06/22'), ('37965478911', 10, '6.80', '3.20', '09/06/22');
INSERT INTO REPOE (cpf_func, cod_prod) VALUES ('25853745301', '02546783009'), ('42318414971', '15261076005'), ('18639900035', '43128460060'), ('79176055906', '72083419073'), ('18508225067', '14608682008'), ('94071920750', '70075296071'), ('6565851077', '15261076005'), ('70411672916', '76863511061'), ('70177771070', '09532308059'), ('24485721868', '14608682008');
insert into VENDA_PROD (num_nota, cod_prod, quantidade) VALUES (1, '02546783009', 2), (2, '15261076005', 2), (3, '43128460060', 3), (4, '76863511061', 5), (5, '72083419073', 5), (6, '43246054088', 1), (7, '70075296071', 6), (8, '14608682008', 2), (9, '02546783009', 1) (10, '09532308059', 1);
INSERT INTO VENDA_CLIENTE (num_nota, cpf_clie) VALUES (1, '78895466322'), (2, '22235465879'), (3, '21567834533'), (4, '73968486088'), (5, '08865498716'), (6, '22235465879'), (7, '51568564148'), (8, '98986525211'), (9, '04357915363'), (10, '36255546500');
INSERT INTO PRODUTO_FORNECEDOR (cod_prod, cnpj_forne) VALUES ('02546783009', '73822131000128'), ('60260898023', '92741641000115'), ('15261076005', '99552991000182'), ('43128460060', '78161382000122'), ('76863511061','78161382000122'), ('72083419073', '04358267000106'), ('09532308059', '14120879000110'), ('43246054088', '73327889000190'), ('70075296071', '73822131000128'), ('14608682008', '29817816000194');
INSERT INTO PRODUTO_ESTOQUE (id_estoque, cod_prod) VALUES (1, '02546783009'), (2, '60260898023'), (5, '15261076005'), (3, '43128460060'), (6, '76863511061'), (1, '72083419073'), (9, '09532308059'), (8, '43246054088'), (10, '70075296071'), (4, '14608682008');

CREATE DATABASE universidade;
use universidade;
 
CREATE TABLE aluno (
numeroaluno INT PRIMARY KEY,
nomealuno VARCHAR(100),
numerocurso INT
);
 
 
CREATE TABLE curso (
numerocurso INT PRIMARY KEY,
nomecurso VARCHAR(100),
numeroaulas INT,
iniciocurso DATE,
materiascurso VARCHAR(100)
);
 
CREATE TABLE professor (
numeroprofessor INT PRIMARY KEY,
nomeprofessor VARCHAR(100),
materiaprofessor VARCHAR(100)
);
 
 
SELECT * FROM aluno;
INSERT INTO aluno (numeroaluno, nomealuno, numerocurso) VALUES (1, 'João', 101);
INSERT INTO aluno (numeroaluno, nomealuno, numerocurso) VALUES (2, 'Maria', 102);
INSERT INTO aluno (numeroaluno, nomealuno, numerocurso) VALUES (3, 'Carlos', 103);
INSERT INTO aluno (numeroaluno, nomealuno, numerocurso) VALUES (4, 'Ana', 101);
INSERT INTO aluno (numeroaluno, nomealuno, numerocurso) VALUES (5, 'Pedro', 104);
 
SELECT * FROM curso;
INSERT INTO curso (numerocurso, nomecurso, numeroaulas, iniciocurso, materiascurso) VALUES
(101, 'ads', 40, '2024-03-01', 'Lógica de Programação');
INSERT INTO curso (numerocurso, nomecurso, numeroaulas, iniciocurso, materiascurso) VALUES
(102, 'ads', 35, '2024-04-01', 'Lógica de Programação');
INSERT INTO curso (numerocurso, nomecurso, numeroaulas, iniciocurso, materiascurso) VALUES 
(103, 'ads', 30, '2024-05-01', 'Lógica de Programação');
INSERT INTO curso (numerocurso, nomecurso, numeroaulas, iniciocurso, materiascurso) VALUES 
(104, 'ads', 45, '2024-06-01', 'Lógica de Programação');
INSERT INTO curso (numerocurso, nomecurso, numeroaulas, iniciocurso, materiascurso) VALUES 
(105, 'ads', 50, '2024-07-01', 'Lógica de Programação');
 
SELECT * FROM professor;
INSERT INTO professor (numeroprofessor, nomeprofessor, materiaprofessor) VALUES 
(1001, 'Marcos', 'Lógica de Programação');
INSERT INTO professor (numeroprofessor, nomeprofessor, materiaprofessor) VALUES 
(1002, 'Cláudia', 'Banco de Dados');
INSERT INTO professor (numeroprofessor, nomeprofessor, materiaprofessor) VALUES
(1003, 'Ricardo', 'Engenharia de Software');
INSERT INTO professor (numeroprofessor, nomeprofessor, materiaprofessor) VALUES 
(1004, 'Fernanda', 'Redes de Computadores');
INSERT INTO professor (numeroprofessor, nomeprofessor, materiaprofessor) VALUES
(1005, 'Lucas', 'Gestão de Equipes de TI');
 
INSERT INTO aluno (numeroaluno, nomealuno, numerocurso) VALUES 
(6, 'Beatriz', 102),(7, 'Lucas', 103), (8, 'Camila', 104),
 (9, 'Felipe', 105), (10, 'Rafael', 101), (11, 'Luana', 102), 
 (12, 'Marcelo', 103), (13, 'Bruna', 104), (14, 'Vinicius', 105),
 (15, 'Larissa', 101);

INSERT INTO curso (numerocurso, nomecurso, numeroaulas, iniciocurso, materiascurso) VALUES 
(106, 'TI', 55, '2024-08-01', 'Redes de Computadores'), 
(107, 'TI', 60, '2024-09-01', 'Banco de Dados'), 
(108, 'TI', 45, '2024-10-01', 'Gestão de Equipes de TI'),
(109, 'TI', 50, '2024-11-01', 'Segurança de Redes'),
(110, 'TI', 40, '2024-12-01', 'Engenharia de Software');

INSERT INTO professor (numeroprofessor, nomeprofessor, materiaprofessor) VALUES
 (1006, 'José', 'Redes de Computadores'),
 (1007, 'Paula', 'Banco de Dados'), 
 (1008, 'Carla', 'Gestão de Equipes de TI'),
 (1009, 'Julio', 'Segurança de Redes'),
 (1010, 'Luciana', 'Engenharia de Software');	

SELECT aluno.numeroaluno, aluno.nomealuno, curso.nomecurso FROM aluno
INNER JOIN curso ON aluno.numerocurso = curso.numerocurso;

SELECT aluno.numeroaluno, aluno.nomealuno, curso.nomecurso
FROM aluno
LEFT JOIN curso ON aluno.numerocurso = curso.numerocurso;

SELECT aluno.numeroaluno, aluno.nomealuno, curso.nomecurso
FROM aluno
RIGHT JOIN curso ON aluno.numerocurso = curso.numerocurso;



/*lojinha*/

CREATE DATABASE lojinha;
USE lojinha;
 
CREATE TABLE Cliente (
codCliente INT PRIMARY KEY,
nomeCliente VARCHAR(100),
EnderecoCliente VARCHAR(200),
TelefoneCliente VARCHAR(15)
);
 
CREATE TABLE Produto (
codigoProduto INT PRIMARY KEY,
descricaoProduto VARCHAR(100),
valorUnitario DECIMAL(10,2),
QuantidadeEstoque INT
);
 
 
CREATE TABLE Recibo (
numNF INT PRIMARY KEY,
serie VARCHAR(10),
dataEmissao DATE,
codCliente INT,
FOREIGN KEY (codCliente) REFERENCES Cliente(codCliente)
);
 
 
CREATE TABLE Compra (
numNF INT,
codigoProduto INT,
quantidadeComprada INT,
valorTotaldaQuantidade DECIMAL(10,2),
PRIMARY KEY (numNF, codigoProduto),
FOREIGN KEY (numNF) REFERENCES Recibo(numNF),
FOREIGN KEY (codigoProduto) REFERENCES Produto(codigoProduto)
);
 
 
INSERT INTO Cliente (codCliente, nomeCliente, EnderecoCliente, TelefoneCliente) VALUES
(1, 'Luffy', 'Going Merry, 10', '1111-2222'),
(2, 'Zoro', 'Going Merry, 11', '3333-4444'),
(3, 'Nami', 'Going Merry, 12', '5555-6666'),
(4, 'Sanji', 'Going Merry, 13', '7777-8888'),
(5, 'Chopper', 'Going Merry, 14', '9999-0000');
 
 
INSERT INTO Produto (codigoProduto, descricaoProduto, valorUnitario, QuantidadeEstoque) VALUES
(101, 'Produto A', 10.00, 50),
(102, 'Produto B', 20.00, 30),
(103, 'Produto C', 15.00, 20),
(104, 'Produto D', 25.00, 10),
(105, 'Produto E', 30.00, 5);
 
INSERT INTO Recibo (numNF, serie, dataEmissao, codCliente) VALUES
(1, 'A001', '2024-10-18', 1),
(2, 'A002', '2024-10-19', 2),
(3, 'A003', '2024-10-20', 3),
(4, 'A004', '2024-10-21', 4),
(5, 'A005', '2024-10-22', 5);
 
INSERT INTO Compra (numNF, codigoProduto, quantidadeComprada, valorTotaldaQuantidade) VALUES
(1, 101, 2, 20.00),
(1, 102, 3, 60.00),
(2, 103, 5, 75.00),
(3, 104, 1, 25.00),
(4, 105, 4, 120.00);
 
SELECT * FROM Cliente;
SELECT * FROM Produto;
SELECT * FROM Recibo;
SELECT * FROM Compra;
 
INSERT INTO Cliente (codCliente, nomeCliente, EnderecoCliente, TelefoneCliente) VALUES
(6, 'Robin', 'Going Merry, 15', '1111-3333'),
(7, 'Franky', 'Going Merry, 16', '3333-5555'),
(8, 'Brook', 'Going Merry, 17', '5555-7777'),
(9, 'Jinbe', 'Going Merry, 18', '7777-9999'),
(10, 'Yamato', 'Going Merry, 19', '9999-1111');

INSERT INTO Produto (codigoProduto, descricaoProduto, valorUnitario, QuantidadeEstoque) VALUES 
 (106, 'Produto F', 35.00, 15), 
 (107, 'Produto G', 40.00, 12),  
 (108, 'Produto H', 45.00, 10),  
 (109, 'Produto I', 50.00, 8), 
 (110, 'Produto J', 55.00, 5);

INSERT INTO Recibo (numNF, serie, dataEmissao, codCliente) VALUES
(6, 'A006', '2024-10-23', 6), 
(7, 'A007', '2024-10-24', 7), 
(8, 'A008', '2024-10-25', 8), 
(9, 'A009', '2024-10-26', 9), 
(10, 'A010', '2024-10-27', 10);

INSERT INTO Compra (numNF, codigoProduto, quantidadeComprada, valorTotaldaQuantidade) VALUES
(6, 106, 2, 70.00),
(7, 107, 3, 120.00),
(8, 108, 1, 45.00),
(9, 109, 4, 200.00), 
(10, 110, 5, 275.00);

SELECT Cliente.nomeCliente, Recibo.numNF, Compra.quantidadeComprada, Produto.descricaoProduto
FROM Cliente
INNER JOIN Recibo ON Cliente.codCliente = Recibo.codCliente
INNER JOIN Compra ON Recibo.numNF = Compra.numNF
INNER JOIN Produto ON Compra.codigoProduto = Produto.codigoProduto;

SELECT Cliente.nomeCliente, Recibo.numNF, Compra.quantidadeComprada, Produto.descricaoProduto
FROM Cliente
LEFT JOIN Recibo ON Cliente.codCliente = Recibo.codCliente
LEFT JOIN Compra ON Recibo.numNF = Compra.numNF
LEFT JOIN Produto ON Compra.codigoProduto = Produto.codigoProduto;

SELECT Cliente.nomeCliente, Recibo.numNF, Compra.quantidadeComprada, Produto.descricaoProduto
FROM Cliente
RIGHT JOIN Recibo ON Cliente.codCliente = Recibo.codCliente
RIGHT JOIN Compra ON Recibo.numNF = Compra.numNF
RIGHT JOIN Produto ON Compra.codigoProduto = Produto.codigoProduto;



/*projeto*/

CREATE DATABASE projeto;
USE projeto;
 
 
CREATE TABLE Fornecedor (
codFornecedor INT PRIMARY KEY,
nomeFornecedor VARCHAR(100),
enderecoFornecedor VARCHAR(200),
emailFornecedor VARCHAR(100)
);
 
 
CREATE TABLE Produto (
codProduto INT PRIMARY KEY,
descricaoProduto VARCHAR(100)
);
 
 
CREATE TABLE Compra (
numCompra INT PRIMARY KEY,
dtCompra DATE,
codFornecedor INT,
codProduto INT,
FOREIGN KEY (codFornecedor) REFERENCES Fornecedor(codFornecedor),
FOREIGN KEY (codProduto) REFERENCES Produto(codProduto)
);
 
 
INSERT INTO Fornecedor (codFornecedor, nomeFornecedor, enderecoFornecedor, emailFornecedor) VALUES
(1, 'Assai', 'Rua das Flores, 123', 'assai@fornecedora.com'),
(2, 'Shibata', 'Avenida Brasil, 456', 'shibata@fornecedor.com'),
(3, 'Pão de Açúcar', 'Praça da Paz, 789', 'paodeacucar@fornecedor.com');
 
INSERT INTO Produto (codProduto, descricaoProduto) VALUES
(101, 'Produto de Higiene'),
(102, 'Produto Perecível'),
(103, 'Produto Não Perecível');
 
INSERT INTO Compra (numCompra, dtCompra, codFornecedor, codProduto) VALUES
(1, '2024-10-01', 1, 101),
(2, '2024-10-02', 1, 102),
(3, '2024-10-03', 2, 103),
(4, '2024-10-04', 3, 101),
(5, '2024-10-05', 2, 102);
 
SELECT * FROM Fornecedor;
SELECT * FROM Produto;
SELECT * FROM Compra;
 
INSERT INTO Fornecedor (codFornecedor, nomeFornecedor, enderecoFornecedor, emailFornecedor) VALUES 
(4, 'Atacadão', 'Rua das Laranjeiras, 111', 'atacadao@fornecedor.com'), 
(5, 'davó', 'Avenida Paulista, 123', 'davo@fornecedor.com'), 
(6, 'Extra', 'Rua dos Pinheiros, 456', 'extra@fornecedor.com'), 
(7, 'Carrefour', 'Avenida Liberdade, 789', 'carrefour@fornecedor.com'), 
(8, 'esperança', 'Avenida Norte, 147', 'esperanca@fornecedor.com');
 
INSERT INTO Produto (codProduto, descricaoProduto) VALUES 
(104, 'Produto Limpeza'), 
(105, 'Produto Alimentício'), 
(106, 'Produto Vestuário'), 
(107, 'Produto Eletrônico'), 
(108, 'Produto Utilidades');
 
INSERT INTO Compra (numCompra, dtCompra, codFornecedor, codProduto) VALUES 
(6, '2024-10-06', 4, 104), 
(7, '2024-10-07', 5, 105), 
(8, '2024-10-08', 6, 106), 
(9, '2024-10-09', 7, 107), 
(10, '2024-10-10', 8, 108);

SELECT Fornecedor.nomeFornecedor, Produto.descricaoProduto, Compra.dtCompra
FROM Fornecedor
INNER JOIN Compra ON Fornecedor.codFornecedor = Compra.codFornecedor
INNER JOIN Produto ON Compra.codProduto = Produto.codProduto;

SELECT Fornecedor.nomeFornecedor, Produto.descricaoProduto, Compra.dtCompra
FROM Fornecedor
LEFT JOIN Compra ON Fornecedor.codFornecedor = Compra.codFornecedor
LEFT JOIN Produto ON Compra.codProduto = Produto.codProduto;

SELECT Fornecedor.nomeFornecedor, Produto.descricaoProduto, Compra.dtCompra
FROM Fornecedor
RIGHT JOIN Compra ON Fornecedor.codFornecedor = Compra.codFornecedor
RIGHT JOIN Produto ON Compra.codProduto = Produto.codProduto;

/* parte 3 da atv, uso de view na universidade*/

USE universidade;

CREATE VIEW umc_alunos AS
SELECT * FROM aluno;

CREATE VIEW umc_cursos AS
SELECT * FROM curso;

CREATE VIEW umc_professores AS
SELECT * FROM professor;


/*uso de view na lojinha*/

USE lojinha;

CREATE VIEW lj_clientes AS
SELECT * FROM Cliente;

CREATE VIEW lj_produtos AS
SELECT * FROM Produto;

CREATE VIEW lj_recibos AS
SELECT * FROM Recibo;

CREATE VIEW lj_compras AS
SELECT * FROM Compra;


/*uso de view na projeto*/

USE projeto;

CREATE VIEW umc_fornecedores AS
SELECT * FROM Fornecedor;

CREATE VIEW umc_produtos_projeto AS
SELECT * FROM Produto;

CREATE VIEW umc_compras_projeto AS
SELECT * FROM Compra;

------------------------------

USE universidade;

CREATE VIEW umc_dados_alunos_cursos AS
SELECT 
    a.numeroaluno,
    a.nomealuno,
    c.nomecurso
FROM 
    aluno a
JOIN 
    curso c ON a.numerocurso = c.numerocurso;

--------------------------------

USE lojinha;

CREATE VIEW lj_dados_clientes_compras AS
SELECT 
    cl.nomeCliente,
    rc.numNF,
    co.quantidadeComprada,
    pr.descricaoProduto
FROM 
    Cliente cl
JOIN 
    Recibo rc ON cl.codCliente = rc.codCliente
JOIN 
    Compra co ON rc.numNF = co.numNF
JOIN 
    Produto pr ON co.codigoProduto = pr.codigoProduto;
    
    ---------------------------
    
USE projeto;

CREATE VIEW vw_dados_fornecedores_compras AS
SELECT 
    f.nomeFornecedor,
    p.descricaoProduto,
    c.dtCompra
FROM 
    Fornecedor f
JOIN 
    Compra c ON f.codFornecedor = c.codFornecedor
JOIN 
    Produto p ON c.codProduto = p.codProduto;
    
SHOW FULL TABLES IN universidade;
SHOW FULL TABLES IN lojinha;
SHOW FULL TABLES IN projeto;


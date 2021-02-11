CREATE DATABASE EscolaEvolua DEFAULT CHARSET=latin1;
USE EscolaEvolua;
 
--
-- Cria a tabela TIPO
--
CREATE TABLE TIPO (
	CODIGO INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,	-- Código interno (PK)
	TIPO VARCHAR(32) NOT NULL,				-- Descrição
	PRIMARY KEY(CODIGO)					-- Define o campo CODIGO como PK (Primary Key)
);

--
-- Cria a tabela INSTRUTOR
--
CREATE TABLE INSTRUTOR (
	CODIGO INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,	-- Código interno (PK)
	INSTRUTOR VARCHAR(64) NOT NULL,				-- Nome com até 64 caracteres
	TELEFONE VARCHAR(9) NULL,				-- Telefone, podendo ser nulo caso não tenha
	PRIMARY KEY(CODIGO)					-- Define o campo CODIGO como PK (Primary Key)
);

--
-- Cria a tabela CURSO
--
--UNSIGNED e é um atributo opcional para inteiros no MySQL usado para definir apenas números positivos
--

CREATE TABLE CURSO (
	CODIGO INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,	-- Código interno (PK)
	CURSO VARCHAR(64) NOT NULL,				-- Título com até 64 caracteres
	TIPO INTEGER UNSIGNED NOT NULL,				-- Código do tipo de curso (idêntico a PK em CURSO)
	INSTRUTOR INTEGER UNSIGNED NOT NULL,			-- Código do instrutor (idêntico a PK em INSTRUTOR)
	VALOR DOUBLE NOT NULL,					-- Valor do curso
	PRIMARY KEY(CODIGO),					-- Define o campo CODIGO como PK (Primary Key)
	INDEX FK_TIPO(TIPO),					-- Define o campo TIPO como um índice
	INDEX FK_INSTRUTOR(INSTRUTOR),				-- Define o campo INSTRUTOR como um índice
	FOREIGN KEY(TIPO) REFERENCES TIPO(CODIGO),		-- Cria o relacionamento (FK) com a tabela TIPO
	FOREIGN KEY(INSTRUTOR) REFERENCES INSTRUTOR(CODIGO)	-- Cria o relacionamento (FK) com a tabela INSTRUTOR
);								

--
-- Cria a tabela ALUNO
--
CREATE TABLE ALUNO (
	CODIGO INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,	-- Código interno (PK)
	ALUNO VARCHAR(64) NOT NULL,				-- Nome com até 64 caracteres
	ENDERECO VARCHAR(230) NOT NULL,				-- Endereço com até 230 caracteres
	EMAIL VARCHAR(128) NOT NULL,				-- E-mail com até 128 caracteres
	PRIMARY KEY(CODIGO)					-- Define o campo CODIGO como PK (Primary Key)
);

--
-- Cria a tabela PEDIDO
--
CREATE TABLE PEDIDO (
	CODIGO INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,	-- Código interno (PK)
	ALUNO INTEGER UNSIGNED NOT NULL,			-- Código do aluno (idêntico a PK em ALUNO)
	DATAHORA DATETIME NOT NULL,				-- Armazena data e hora em uma única coluna
	PRIMARY KEY(CODIGO),					-- Define o campo CODIGO como PK (Primary Key)
	INDEX FK_ALUNO(ALUNO),					-- Define o campo ALUNO como um índice
	FOREIGN KEY(ALUNO) REFERENCES ALUNO(CODIGO)		-- Cria o relacionamento (FK) com a tabela ALUNO
);

--
-- Cria a tabela PEDIDO_DETALHE
--
CREATE TABLE PEDIDO_DETALHE (
	PEDIDO INTEGER UNSIGNED NOT NULL,			-- Código do pedido (idêntico a PK em PEDIDO)
	CURSO INTEGER UNSIGNED NOT NULL,			-- Código do curso (idêntico a PK em CURSO)
	VALOR DOUBLE NOT NULL,					-- Valor do curso
	INDEX FK_PEDIDO(PEDIDO),				-- Define o campo ALUNO como um índice
	INDEX FK_CURSO(CURSO),					-- Define o campo ALUNO como um índice
	PRIMARY KEY(PEDIDO, CURSO),				-- Define a chave primária composta
	FOREIGN KEY(PEDIDO) REFERENCES PEDIDO(CODIGO),		-- Cria o relacionamento (FK) com a tabela PEDIDO
	FOREIGN KEY(CURSO) REFERENCES CURSO(CODIGO)		-- Cria o relacionamento (FK) com a tabela CURSO
);

---------------------------------------------------

--
-- Baseado na tabela, construa uma transação que atualiza o valor aplicado 
-- em cada conta bancária baseado no índice de correção percentual de 3% 

--
-- Cria a tabela CONTA_BANCARIA 
--
CREATE TABLE CONTA_BANCARIA (
	CODIGO INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,	-- Código interno (PK)
	TITULAR VARCHAR(32) NOT NULL,				-- Nome do titular da conta
	SALDO DOUBLE NOT NULL,					-- Representa o saldo da conta
	PRIMARY KEY(CODIGO)					-- Define o campo CODIGO como PK (Primary Key)
);

INSERT INTO CONTA_BANCARIA VALUES (1, 'André', 213);
INSERT INTO CONTA_BANCARIA VALUES (2, 'Diogo', 489);
INSERT INTO CONTA_BANCARIA VALUES (3, 'Rafael', 568);
INSERT INTO CONTA_BANCARIA VALUES (4, 'Carlos', 712);
INSERT INTO CONTA_BANCARIA VALUES (5, 'Peter', -38);

select * from conta_bancaria;

START TRANSACTION;
UPDATE CONTA_BANCARIA SET SALDO = SALDO + (SALDO / 100 * 3) WHERE SALDO > 0;
COMMIT;

--------------------------------------------------

-- Crie comandos SQL para inserir os dados apresentados a seguir:
-- 
-- Tabela TIPO:
-- 1, Banco de dados
-- 2, Programação
-- 3, Modelagem de dados
-- 
-- Tabela INSTRUTOR:
-- 1, Clovis Eulalio, 1111-1111
-- 2, Fabio Perucello, 1212-1212
-- 
-- Tabela CURSO:
-- 1, Java Fundamentos, 2, 2, 270
-- 2, Java Avançado, 2, 2, 330
-- 3, SQL Completo, 1, 1, 170
-- 4, Logicas, 2, 1, 270
-- 
-- Tabela ALUNO:
-- 1, José, Rua XV de Novembro 72, jose@evolua.com.br
-- 2, Wagner, Av. Paulista, wagner@evolua.com.br
-- 3, Emílio, Rua Lajes 103, ap: 701, emilio@evolua.com.br
-- 4, Cris, Rua Tauney 22, cris@evolua.com.br
-- 5, Regina, Rua Salles 305, regina@sevolua.com.br
-- 6, Fernando, Av. Central 30, fernando@evolua.com.br
-- 
-- Tabela PEDIDO:
-- 1, 2, 15/04/2020, 11:23:32
-- 2, 2, 15/04/2020, 14:36:21
-- 3, 3, 16/04/2020, 11:17:45
-- 4, 4, 17/04/2020, 14:27:22
-- 5, 5, 18/04/2020, 11:18:19
-- 6, 6, 19/04/2020, 13:47:35
-- 7, 6, 20/04/2020, 18:13:44
-- 
-- Tabela PEDIDO_DETALHE:
-- 1, 1, 270
-- 1, 2, 330
-- 2, 1, 270
-- 2, 2, 330
-- 2, 3, 170
-- 3, 4, 270
-- 4, 2, 330
-- 4, 4, 270
-- 5, 3, 170
-- 6, 3, 170
-- 7, 4, 270

-- SOLUÇÃO
-- ================================================================================
--
-- Observe que para todas as tabelas, com exceção de ALUNO, 
-- será apresentado as duas formas de incluir os dados.
-- A primeira informando os campos e a ordem em que seriam informados, 
-- e a segunda assumindo que todos os campos da tabela seriam informados.
--

--
-- Tabela TIPO:
--
INSERT INTO TIPO (CODIGO, TIPO) VALUES (1, 'Banco de dados');
INSERT INTO TIPO VALUES (2, 'Programação');
INSERT INTO TIPO VALUES (3, 'Modelagem de dados');

--
-- Tabela INSTRUTOR:
--
INSERT INTO INSTRUTOR (CODIGO, INSTRUTOR, TELEFONE) VALUES (1, 'Clovis Eulalio', '1111-1111');
INSERT INTO INSTRUTOR VALUES (2, 'Fabio Perucello', '1212-1212');

--
-- Tabela CURSO:
--
INSERT INTO CURSO (CODIGO, CURSO, TIPO, INSTRUTOR, VALOR) VALUES (1, 'Java Fundamentos', 2, 2, 270);
INSERT INTO CURSO VALUES (2, 'Java Avançado', 2, 2, 330);
INSERT INTO CURSO VALUES (3, 'SQL Completo', 1, 1, 170);
INSERT INTO CURSO VALUES (4, 'Logicas', 2, 1, 270);

--
-- Tabela ALUNO:
--
INSERT INTO ALUNO (CODIGO, ALUNO, ENDERECO, EMAIL) VALUES (1, 'José', 'Rua XV de Novembro 72', 'jose@evolua.com.br');
INSERT INTO ALUNO (CODIGO, ALUNO, ENDERECO, EMAIL) VALUES (2, 'Wagner', 'Av. Paulista', 'wagner@evolua.com.br');
INSERT INTO ALUNO (CODIGO, ALUNO, ENDERECO, EMAIL) VALUES (3, 'Emílio', 'Rua Lajes 103, ap: 701', 'emilio@evolua.com.br');
INSERT INTO ALUNO (CODIGO, ALUNO, ENDERECO, EMAIL) VALUES (4, 'Cris', 'Rua Tauney 22', 'cris@evolua.com.br');
INSERT INTO ALUNO (CODIGO, ALUNO, ENDERECO, EMAIL) VALUES (5, 'Regina', 'Rua Salles 305', 'regina@evolua.com.br');
INSERT INTO ALUNO (CODIGO, ALUNO, ENDERECO, EMAIL) VALUES (6, 'Fernando', 'Av. Central 30', 'fernando@evolua.com.br');

--
-- Tabela PEDIDO:
--
INSERT INTO PEDIDO (CODIGO, ALUNO, DATAHORA) VALUES (1, 2, '2010-04-15 11:23:32');
INSERT INTO PEDIDO VALUES (2, 2, '2020-04-15 14:36:21');
INSERT INTO PEDIDO VALUES (3, 3, '2020-04-16 11:17:45');
INSERT INTO PEDIDO VALUES (4, 4, '2020-04-17 14:27:22');
INSERT INTO PEDIDO VALUES (5, 5, '2020-04-18 11:18:19');
INSERT INTO PEDIDO VALUES (6, 6, '2020-04-19 13:47:35');
INSERT INTO PEDIDO VALUES (7, 6, '2020-04-20 18:13:44');

--
-- Tabela PEDIDO_DETALHE:
--
INSERT INTO PEDIDO_DETALHE (PEDIDO, CURSO, VALOR) VALUES (1, 1, 270);
INSERT INTO PEDIDO_DETALHE VALUES (1, 2, 330);
INSERT INTO PEDIDO_DETALHE VALUES (2, 1, 270);
INSERT INTO PEDIDO_DETALHE VALUES (2, 2, 330);
INSERT INTO PEDIDO_DETALHE VALUES (2, 3, 170);
INSERT INTO PEDIDO_DETALHE VALUES (3, 4, 270);
INSERT INTO PEDIDO_DETALHE VALUES (4, 2, 330);
INSERT INTO PEDIDO_DETALHE VALUES (4, 4, 270);
INSERT INTO PEDIDO_DETALHE VALUES (5, 3, 170);
INSERT INTO PEDIDO_DETALHE VALUES (6, 3, 170);
INSERT INTO PEDIDO_DETALHE VALUES (7, 4, 270);

----------------------------------------

select * from aluno;
select * from conta_bancaria;
select * from curso;
select * from pedido;
select * from pedido_detalhe;
select * from tipo;


SELECT * FROM funcionarios 
INNER JOIN veiculos ON veiculos.funcionario_id = funcionarios.id 
INNER JOIN cpfs ON cpfs.id = funcionarios.id;


SELECT * FROM aluno
INNER JOIN curso ON curso.codigo = aluno.codigo;

SELECT * FROM aluno
INNER JOIN curso ON curso.codigo = aluno.codigo
INNER JOIN instrutor ON instrutor.codigo = aluno.codigo
INNER JOIN tipo ON tipo.codigo = aluno.codigo;

SELECT 
Aluno as NomeAluno,
Endereco as Adress,
Email as mail,
instrutor.instrutor as professor,
Tipo.tipo as curso
FROM aluno
INNER JOIN curso ON curso.codigo = aluno.codigo
INNER JOIN instrutor ON instrutor.codigo = aluno.codigo
INNER JOIN tipo ON tipo.codigo = aluno.codigo;

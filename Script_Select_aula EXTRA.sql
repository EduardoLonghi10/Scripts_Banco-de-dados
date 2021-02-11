-- Criar Banco de Dados
create database EvoluaBD;

-- Ativar usabilidade do Banco Criado
use EvoluaBD;


-- criando tabela ALUNO e seus atributos
create table Aluno
(
id int not null auto_increment,
nome varchar(50) not null,
sexo char(1),
comentario varchar(50),
primary key(id)
);

-- criando tabela CURSO e seus atributos
create table Curso
(
idcurso int not null auto_increment,
nome varchar(50) not null,
descricao varchar(50),
duracao_mes int,
primary key(idcurso)
);

-- trazendo todos os dados da tabela
select * from aluno;
select * from curso;

-- procedimento para inserir dados
INSERT INTO aluno 
(`nome`, `sexo`, `comentario`) 
VALUES 
('Fulano de Tal', 'M', 'estudante');
-- intert copiado gerado atomatico pela Interface Workbench
INSERT INTO `evoluabd`.`aluno` (`nome`, `sexo`, `comentario`) VALUES ('Beltrano da Silva', 'M', 'estudante');
INSERT INTO `evoluabd`.`aluno` (`nome`, `sexo`, `comentario`) VALUES ('Sugiro Kifuja', 'M', 'Emprendedor');
INSERT INTO `evoluabd`.`aluno` (`nome`, `sexo`, `comentario`) VALUES ('Tadano Sono', 'M', 'Empresario');
INSERT INTO `evoluabd`.`aluno` (`nome`, `sexo`, `comentario`) VALUES ('Enten DendoNada', 'F', 'Desenvolvedora');
INSERT INTO `evoluabd`.`aluno` (`nome`, `sexo`, `comentario`) VALUES ('Topren Dendotudo', 'F', 'FullStack');
INSERT INTO `evoluabd`.`aluno` (`nome`, `sexo`, `comentario`) VALUES ('Falan Domuito', 'M', 'estudante');
-- trazendo os dados da tabela
select * from aluno;

select * from curso;
-- inserindo dados na tabela CURSO
INSERT INTO curso 
(`nome`, `descricao`, `duracao_mes`) 
VALUES 
('Java', 'Essencial', '2');
-- inserindo sem passar atributo , porem passando atributo
INSERT INTO curso VALUES ('2', 'Java', 'Intermediario', '3');
-- inserindo dados
INSERT INTO `evoluabd`.`curso` (`nome`, `descricao`, `duracao_mes`) VALUES ('C#', 'Essencial', '2');
INSERT INTO `evoluabd`.`curso` (`nome`, `descricao`, `duracao_mes`) VALUES ('C#', 'Intermediario', '3');
INSERT INTO `evoluabd`.`curso` (`nome`, `descricao`, `duracao_mes`) VALUES ('PHP', 'Intermediario', '3');
INSERT INTO `evoluabd`.`curso` (`nome`, `descricao`, `duracao_mes`) VALUES ('HTML5', 'Intermediario', '3');
select * from curso;
-- selecioando todos os dados da tabela 1 e 2 => resultado desordenado
select * from aluno, curso;

select * from aluno;
select nome from aluno;
select nome, sexo from aluno;
select nome, comentario from aluno;
select nome, sexo, comentario from aluno;

-- utilizando ALIAS AS para trocar nome das trocar nome das colunas/atributos
select 
nome as NomedoAluno,
sexo as Sexo,
Comentario as InformacaoAdicional
from aluno;

select 
nome as Aluno,
sexo as "F/M",
Comentario as Adicional
from aluno;

-- MANIPULANDO SELECT POR LETRAS
select nome from aluno where sexo = 'f';
select * from aluno where nome like '%d%';
select * from aluno where nome like 's%';
select * from aluno where nome like '%a';
select * from aluno where nome like '_u%';
select * from aluno where nome like 'e_%';
select * from aluno where nome like '_o%';



select * from curso;
select nome, descricao from curso order by nome;
select * from curso order by nome desc;
select * from curso where duracao_mes > '2';
select * from curso where descricao = 'Intermediario';
select * from curso where descricao = 'Essencial';
select * from curso where descricao = 'essencial';
select sum(duracao_mes) from curso where duracao_mes = '2';
select count(duracao_mes) as Qtde_Cursos from curso where duracao_mes = '2';
select count(duracao_mes) as Qtde_Cursos from curso where duracao_mes = '3';
select count(duracao_mes) as Qtde_Cursos from curso;

select 
nome as Curso,
descricao as Modulo,
duracao_mes as Tempo_em_mes
from curso;


--  criando relacionamento das tabelas CURSO e ALUNO
create table Estuda
(
id int not null auto_increment,
idaluno int,
idcurso int,
primary key (id),
foreign key (idaluno) references aluno(id),
foreign key (idcurso) references curso(idcurso)
);


SELECT * FROM ESTUDA;
select * from curso;
INSERT INTO `evoluabd`.`estuda` (`idaluno`, `idcurso`) VALUES ('1', '2');
INSERT INTO `evoluabd`.`estuda` (`idaluno`, `idcurso`) VALUES ('1', '3');
INSERT INTO `evoluabd`.`estuda` (`idaluno`, `idcurso`) VALUES ('2', '1');
INSERT INTO `evoluabd`.`estuda` (`idaluno`, `idcurso`) VALUES ('2', '3');
INSERT INTO `evoluabd`.`estuda` (`idaluno`, `idcurso`) VALUES ('3', '3');
INSERT INTO `evoluabd`.`estuda` (`idaluno`, `idcurso`) VALUES ('3', '6');
INSERT INTO `evoluabd`.`estuda` (`idaluno`, `idcurso`) VALUES ('4', '2');
INSERT INTO `evoluabd`.`estuda` (`idaluno`, `idcurso`) VALUES ('4', '4');
INSERT INTO `evoluabd`.`estuda` (`idaluno`, `idcurso`) VALUES ('5', '6');
INSERT INTO `evoluabd`.`estuda` (`idaluno`, `idcurso`) VALUES ('5', '6');
INSERT INTO `evoluabd`.`estuda` (`idaluno`, `idcurso`) VALUES ('6', '2');
INSERT INTO `evoluabd`.`estuda` (`idaluno`, `idcurso`) VALUES ('7', '1');
INSERT INTO `evoluabd`.`estuda` (`idaluno`, `idcurso`) VALUES ('7', '3');



select * from estuda;

select * from aluno 
inner join estuda 
on aluno.id = estuda.idaluno;

select * from aluno a
inner join estuda e
on a.id = e.idaluno;

select a.nome, a.comentario from aluno a
inner join estuda e
on a.id = e.idaluno;

select a.nome, e.idcurso from aluno a
inner join estuda e
on a.id = e.idaluno;

select a.nome, e.idcurso, c.nome from aluno a
inner join estuda e
on a.id = e.idaluno
inner join curso c
on e.idcurso = c.idcurso;



select a.nome, c.nome from aluno a
inner join estuda e
on a.id = e.idaluno
inner join curso c
on e.idcurso = c.idcurso;

select a.nome as Aluno, c.nome as Curso from aluno a
inner join estuda e
on a.id = e.idaluno
inner join curso c
on e.idcurso = c.idcurso;

select 
a.nome as Aluno, 
c.nome as Curso,
c.descricao as Descricao
from aluno a
	inner join estuda e
		on a.id = e.idaluno
	inner join curso c
	on e.idcurso = c.idcurso;
    


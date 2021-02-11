drop database clinica;

create database clinica;
use clinica;
create table paciente(
	Id integer(11) not null auto_increment,
    Nome varchar(30) not null,
    Peso float,
    Altura float,
    primary key (Id));

select * from paciente;
select * from paciente;


select Nome from paciente;


insert into paciente 
(Id, Nome, Peso, Altura)
values
('1', 'Fulano', '70', '1.60'),
('2', 'Beltrano', '25', '1.30');

select * from paciente; 

select Id_paciente from paciente;

select Nome from paciente;




useTimezone=true&serverTimezone=UTC&useSSL=false
-- CRAINDO BANCO DE DADOS EMPRESA --
create database if not exists empresa
default charset utf8
default collate utf8_general_ci;
-- USAR O BANCO DE DAODS EMPRESA --
use empresa;

-- CRIANDO 1º TABELA --
create table if not exists funcionarios (
cpf varchar(11) not null,
nome varchar(30) not null,
cargo varchar(20) not null,
setor varchar(30),
primary key (cpf)
) default charset = utf8;

-- CRIANDO 2º TABELA --
create table if not exists dependentes (
id int(11) not null auto_increment primary key,
nome varchar(30) not null,
nascimento date not null,
sexo enum('M', 'F'),
nacionalidade varchar(35) default 'Brasil'
) default charset = utf8;

-- INSERINDO DADOS NA TABELA FUNCIONÁRIOS --
insert into funcionarios values 
('24184550700', 'José Marcos Bezerra', 'Mecânico','Manutenção'),
('33753789022', 'Carlos Eduardo da Silva','Mecânico','Manutenção'),
('64560890113', 'Marsel Prado', 'Eletricista', 'Engenharia'),
('11678901254', 'Anderson Rio', 'Programador', 'Engenharia'),
('17890123495', 'Maria Leal', 'Médica', 'Ambulatório'),
('28901234546', 'Carmem Lúcia', 'Operadora', 'Produção'),
('79126456077', 'Júlia Maria', 'Operadora', 'Produção');
-- INSERINDO DADOS NA TABELA DEPENDENTES --
insert into dependentes values
('1', 'Jânio Paulo', '1984-12-12', 'M', 'Brasileira'),
('2', 'Alexandro da Silva','1984-10-21', 'M','Brasileira'),
('3', 'Adalgiza Prado','2010-07-25','F','Brasileira'),
('4', 'Carla Patricia', '2012-01-01','F','Brasileira'),
('5', 'Manoella Gysele','2015-09-10','F','Portuguesa'); 

-- ADICIONAR NA TABELA DEPENDETE O CAMPO CPFUNC --
alter table dependentes
add column cpfunc varchar(11);

-- RELACIONAR FUNCIONARIOS COM DEPENDENTES --
update dependentes set cpfunc = 24184550700 where id = '1';
update dependentes set cpfunc = 24184550700 where id = '2';
update dependentes set cpfunc = 28901234546 where id = '3';
update dependentes set cpfunc = 11678901254 where id = '4';
update dependentes set cpfunc = 11678901254 where id = '5';

-- ADICIONANDO CPFUNC COMO CHAVE ESTRANGEIRA --
alter table dependentes 
add foreign key (cpfunc)
references funcionarios(cpf);
-- SELECIONANDO FUNCIONARIOS COM DEPENDENTES --
select dependentes.nome, dependentes.cpfunc, funcionarios.nome, funcionarios.cpf
from dependentes join funcionarios
on funcionarios.cpf = dependentes.cpfunc;
--SQL
	-- Ling
--comando de DDL
-- Linguagem de definicão de dados
create database autorizada_ja;
use autorizada_ja;
create table painel_reports (
-- chave primaria
-- código unico dentro da tabela
cod 		   int primary key auto_increment,
nome_empresa  varchar(100),
email         varchar(100),
tell          varchar(20),
cep   		  varchar(20),
endereco   	  varchar(100),
nivel_urgencia   varchar(20),
n_fiscal	 varchar(20),
vend 	varchar(20),
fabricante 	varchar(20),
produto 	varchar(50),
n_serie 	varchar(50),
defeito 	varchar(100)
);	
show tables;
desc painel_reports;

--DML (Linguagem de manipula��o de dados)
-- insert - update - delete
insert into painel_reports(
nome_empresa,
email,
tell,
cep,
endereco,
nivel_urgencia,
n_fiscal,
vend,
fabricante,
produto,
n_serie,
defeito)
values ('Arthur',
'arthur@gmail.com',
'61982726392',
'72125140',
'Qne 14 Lote 18',
'Urgente',
'58485',
'Gasfilar',
'Rinnai',
'Aquecedor',
'1515',
'N�o esquenta.');

-- value (?,?,?,?,?,?,?);
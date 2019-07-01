create database autorizada_ja;
use autorizada_ja;
create table painel_concluidos (

cod 		   int primary key auto_increment,
nome_empresa  varchar(100),
email         varchar(100),
tell          varchar(20),
cep   		  varchar(20),
endereco   	  varchar(100),
nivel		varchar(50),
n_fiscal	 varchar(20),
vend 	varchar(20),
fabricante 	varchar(20),
produto 	varchar(50),
n_serie 	varchar(50),
defeito 	varchar(100),
chegada		varchar(40),
saida 		varchar(10),
defeito_visto	varchar(100),
nome_tecnico	varchar (100),
cod_tecnico    varchar (100)
);	
show tables;
desc painel_concluidos;


insert into painel_concluidos(
nome_empresa,
email,
tell,
cep,
endereco,
nivel,
n_fiscal,
vend,
fabricante,
produto,
n_serie,
defeito,
chegada,
saida,
defeito_visto,
nome_tecnico,
cod_tecnico)
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
'N�o esquenta.',
'23/06/2019 10:45',
'11:35',
'O mesmo reportado',
'Guilherme',
'001');

-- value (?,?,?,?,?,?,?);
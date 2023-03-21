--DROP DATABASE bdONG
CREATE DATABASE bdONG

USE bdONG

GO

CREATE TABLE tbSexo(
	idSexo INT PRIMARY KEY IDENTITY(1,1)
	,descSexo VARCHAR (40) NOT NULL
)
CREATE TABLE tbStatus(
	idStatus INT PRIMARY KEY IDENTITY(1,1)
	,descStatus VARCHAR (40) NOT NULL
)
--ATE AQUI ESTA EXEC

CREATE TABLE tbGenitor(
	idGenitor INT PRIMARY KEY IDENTITY(1,1) 
	,nomeGenitor VARCHAR (100) NOT NULL
	,cpfGenitor CHAR (11) 
)
CREATE TABLE tbCrianca(
	idCrianca INT PRIMARY KEY IDENTITY(1,1) 
	,nomeCrianca VARCHAR (100) NOT NULL
	,dtNascimentoCrianca SMALLDATETIME NOT NULL
	,cpfCrianca CHAR (11)
	,idSexo INT FOREIGN KEY REFERENCES
	tbSexo(idSexo)
	,idStatus INT FOREIGN KEY REFERENCES 
	tbStatus(idStatus)
)
--EXECUTADO
CREATE TABLE tbHistorico(
	idHistorico INT PRIMARY KEY IDENTITY(1,1)
	,dataHistorico SMALLDATETIME NOT NULL
	,idCrianca INT FOREIGN KEY REFERENCES
	tbCrianca(idCrianca)
	,descStatus VARCHAR (40) NOT NULL
)
CREATE TABLE tbFiliacao(
	idFiliacao INT PRIMARY KEY IDENTITY(1,1)
	,idGenitor INT FOREIGN KEY REFERENCES
	tbGenitor(idGenitor)
	,idCrianca INT FOREIGN KEY REFERENCES
	tbCrianca(idCrianca)
)
CREATE TABLE tbPadrinho(
	idPadrinho INT PRIMARY KEY IDENTITY(1,1)
	,nomePadrinho VARCHAR (40) NOT NULL
	,cpfPadrinho CHAR (11)
)
--EXECUTADO
CREATE TABLE tbApadrinhamento(
	idApadrinhamento INT PRIMARY KEY IDENTITY(1,1)
	,idCrianca INT FOREIGN KEY REFERENCES
	tbCrianca(idCrianca)
	,idPadrinho INT FOREIGN KEY REFERENCES
	tbPadrinho(idPadrinho)
	,dtApadrinhamento SMALLDATETIME
)
CREATE TABLE tbProntuario(
	idProntuario INT PRIMARY KEY IDENTITY(1,1)
	,dtAbertura SMALLDATETIME 
	,idCrianca INT FOREIGN KEY REFERENCES
	tbCrianca(idCrianca)
)
CREATE TABLE tbDoenca(
	idDoenca INT PRIMARY KEY IDENTITY(1,1)
	,nomeDoenca VARCHAR (50)
	,cid VARCHAR (50)
)
--EXECUTADO
CREATE TABLE tbDoencaPront(
	idDoencaPront INT PRIMARY KEY IDENTITY(1,1)
	,idProntuario INT FOREIGN KEY REFERENCES
	tbProntuario(idProntuario)
	,idDoenca INT FOREIGN KEY REFERENCES
	tbDoenca(idDoenca)
	,data SMALLDATETIME
)
 



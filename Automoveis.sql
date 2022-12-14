CREATE TABLE AUTOMOVEIS(
CODIGO INTEGER NOT NULL,
FABRICANTE VARCHAR(60) NOT NULL,
MODELO VARCHAR(30) NOT NULL,
ANO INTEGER NOT NULL,
PAIS VARCHAR(40) NOT NULL,
PRECO FLOAT NOT NULL,
CONSTRAINT AUTOMOVEIS_PK PRIMARY KEY (CODIGO,ANO));

CREATE TABLE REVENDEDORAS(
CGC BIGINT NOT NULL,
NOME VARCHAR(60) NOT NULL,
PROPRIETARIO VARCHAR(60) NOT NULL,
CIDADE VARCHAR(50) NOT NULL,
ESTADO VARCHAR(40) NOT NULL,
CONSTRAINT REVENDEDORAS_PK PRIMARY KEY (CGC) );

CREATE TABLE CONSUMIDORES(
IDENTIDADE INT NOT NULL,
NOME VARCHAR(40) NOT NULL,
SOBRENOME VARCHAR(60) NOT NULL,
CONSTRAINT CONSUMIDORES_PK PRIMARY KEY (IDENTIDADE));

CREATE TABLE NEGOCIOS(
COMPRADOR INT NOT NULL,
REVENDA BIGINT NOT NULL,
CODAUTO INTEGER NOT NULL,
ANOAUTO INTEGER NOT NULL,
DATA DATE NOT NULL,
PRECO FLOAT NOT NULL,
CONSTRAINT NEGOCIOS_PK PRIMARY KEY (COMPRADOR,REVENDA,CODAUTO,ANOAUTO),
CONSTRAINT GARAGENS_FK FOREIGN KEY (CODAUTO,ANOAUTO) REFERENCES
AUTOMOVEIS(CODIGO,ANO));

CREATE TABLE GARAGENS(
CGCREVENDA BIGINT NOT NULL,
CODAUTO INTEGER NOT NULL,
ANOAUTO INTEGER NOT NULL,
QUANTIDADE INT NOT NULL,
CONSTRAINT GARAGENS_PK PRIMARY KEY (CGCREVENDA, CODAUTO, ANOAUTO),
CONSTRAINT GARAGENS_FK FOREIGN KEY (CODAUTO,ANOAUTO) REFERENCES
AUTOMOVEIS(CODIGO,ANO));

INSERT INTO AUTOMOVEIS VALUES (1,'HYUNDAY','HB20',2017,'BRASIL',45000);
INSERT INTO AUTOMOVEIS VALUES (2,'HONDA',' CIVIC ',2017,'BRASIL', 76000);
INSERT INTO AUTOMOVEIS VALUES (3,'RENAULT ',' SANDEIRO ',2017,'BRASIL', 65000);
INSERT INTO AUTOMOVEIS VALUES (4,'MERCEDES ',' C100 ',2018,'EUA', 102000);
INSERT INTO AUTOMOVEIS VALUES (5,'HYUNDAY','HB20 Plus',2018,'BRASIL',45000);
INSERT INTO AUTOMOVEIS VALUES (6,'MITSUBISHI','TRITON',2019,'BRASIL',77000);
INSERT INTO AUTOMOVEIS VALUES (7,'RENAULT ','OROCH',2019,'FRANÇA',99000);

INSERT INTO REVENDEDORAS VALUES (11222333444455, 'CAR CENTER', 'PAULO CORTES',
'PALMAS', 'TO');
INSERT INTO REVENDEDORAS VALUES (22333444555566, 'LEONARDO VEÍCULOS', 'LEONARDO',
'PALMAS', 'TO');
INSERT INTO REVENDEDORAS VALUES (22333444555577, 'MARCA MOTORS', 'MARCOS',
'PALMAS', 'TO');
INSERT INTO REVENDEDORAS VALUES (22333444555588, 'MARCA MOTORS', 'MARCOS',
'GOIÂNIA', 'GO');

INSERT INTO CONSUMIDORES VALUES (1, 'CLAUDIO', 'PEDROSA');
INSERT INTO CONSUMIDORES VALUES (2, 'SANDRA', 'GOMES');
INSERT INTO CONSUMIDORES VALUES (3, 'JOSÉ', 'SOUSA');

INSERT INTO NEGOCIOS VALUES (1,'11222333444455',1,2017,'2019-02-03',47000);
INSERT INTO NEGOCIOS VALUES (2,'11222333444455',4,2018,'2019-03-09',130000);
INSERT INTO NEGOCIOS VALUES (3,'11222333444477',6,2019,'2020-09-09',130000);
INSERT INTO NEGOCIOS VALUES (4,'22333444555577',6,2019,'2020-09-09',140000);

INSERT INTO GARAGENS VALUES ('11222333444455',7,2019,4);
INSERT INTO GARAGENS VALUES ('11222333444455',4,2018,1);
INSERT INTO GARAGENS VALUES ('11222333444455',3,2017,1);
INSERT INTO GARAGENS VALUES ('22333444555577',6,2019,1);
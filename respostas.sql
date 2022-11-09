/*1. Quais os estados onde se vende o modelo Triton do fabricante Mitsubishi.*/

SELECT * from automoveis;
select * from consumidores;
select * from garagens;
SELECT * from negocios;
SELECT * from revendedoras;

/*Resposta 1*/
SELECT distinct a.codigo, a.modelo ,r.estado
from automoveis a, negocios n, revendedoras r
where n.codauto = a.codigo and
a.modelo='TRITON';



/*2. Listar as revendedoras/garagens que não vendem automóveis de procedência da França?
*/

/*Resposta 2*/
SELECT distinct a.pais , r.nome
from automoveis a, garagens g
LEFT join revendedoras r on r.cgc = g.cgcrevenda 
where a.codigo = g.codauto and
a.pais <> 'FRANÇA';
 
/*3. Liste o automóvel (fabricante, modelo e ano) com valor mais CARO à venda nas revendedoras?
*/

/*Resposta 3*/
select DISTINCT a.fabricante, a.modelo ,a.ano 
	from automoveis a , garagens g
	inner join revendedoras r on r.cgc = g.cgcrevenda
	inner join negocios n on n.codauto = g.codauto
		where  n.revenda = g.cgcrevenda
		GROUP by a.fabricante,a.modelo,a.ano,a.preco
		HAVING a.preco = (select max(a.preco)maior_valor from automoveis a);





4. Calcular o lucro da revendedora MARCA MOTORS caso tivesse vendido seus carros por um
valor 12% maior?

/*Resposta 4*/
SELECT distinct r.nome ,n.preco+(n.preco*0.12) preço
		from revendedoras r, negocios n
where r.nome='MARCA MOTORS'
;



5. Quais carros (codigo, fabricante, modelo e ano) que são colocados à venda em
pelo menos uma revendedora.

/*Resposta 5*/
select 	a.codigo,a.fabricante,a.modelo,a.ano,r.nome
	from automoveis a,revendedoras r
	LEFT join garagens g on g.cgcrevenda= r.cgc
	where a.codigo = g.codauto;


7. Quais são as revendedoras de mesmo proprietário que estão em mais de um estado?


SELECT * from revendedoras;


/*Resposta 7*/
SELECT distinct r.nome, r.proprietario ,r.estado
from revendedoras r
WHERE r.proprietario ='MARCOS'
group by r.nome,r.proprietario ,r.estado
;


8. Listar as revendedoras que são especializadas exclusivamente em carros de fabricação do ano
de 2019.


SELECT * from automoveis;
select * from revendedoras;
select * from garagens;
SELECT * from negocios;
/*Resposta 8*/
SELECT DISTINCT a.ano , r.nome
from automoveis a, revendedoras r
 RIGHT join garagens g on g.cgcrevenda = r.cgc
 RIGHT join negocios n on n.codauto = g.codauto
 where n.codauto = g.codauto and
 a.ano ='2019';
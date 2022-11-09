CREATE TABLE EMP_LOG_1 (
CODIGO_DISC INTEGER,
QTD_AULAS_A INTEGER,
QTD_AULAS_N INTEGER,
USUARIO VARCHAR(40),
DATAHORA TIMESTAMP);


SELECT * from emp_log_1;
SELECT * from disciplina;

/* questao 1  Crie uma função quando houver mudanças
nas horas das disciplinas (qtd_aulas) faça inserção na tabela abaixo. */

CREATE TABLE EMP_LOG (
CODIGO_DISC INTEGER,
QTD_AULAS_A INTEGER,
QTD_AULAS_N INTEGER,
USUARIO VARCHAR(40),
DATAHORA TIMESTAMP);
CREATE OR REPLACE RULE LOG_1 AS ON UPDATE TO DISCIPLINA
WHERE
NEW.QTD_AULAS <> OLD.QTD_AULAS
DO INSERT INTO EMP_LOG_1 VALUES
(OLD.CODIGO_DISC, OLD.QTD_AULAS, NEW.QTD_AULAS, CURRENT_USER,
CURRENT_TIMESTAMP);


/*Questão 2 */
CREATE FUNCTION PROF_DISCIPLINA_N(NUMERO_PROF INTEGER) RETURNS TEXT AS
$$
SELECT NOME_DISCIPLINA FROM DISCIPLINA
INNER JOIN PROFDISC ON PROFDISC.CODIGO_DISC = DISCIPLINA.CODIGO_DISC
INNER JOIN PROFESSOR ON PROFDISC.numero_prof=professor.numero_prof
WHERE professor.numero_prof = $1
$$ LANGUAGE SQL;

SELECT PROF_DISCIPLINA_N(3);

SELECT * from DISCIPLINA;
/*Questão 3*/


CREATE FUNCTION disc_aluno (p_nome_aluno CHARACTER VARYING(50))
RETURNS TABLE (t_nome_disciplina CHARACTER VARYING(50))
AS $$
BEGIN
RETURN QUERY SELECT
nome_disciplina FROM disciplina 
INNER JOIN matricula ON disciplina.codigo_disc = matricula.codigo_disc 
INNER JOIN aluno ON matricula.numero_aluno = aluno.numero_aluno
WHERE alunome = $1;
END; $$
LANGUAGE 'plpgsql';

select * from disc_aluno('Julia');


/*Questão 4 */

CREATE OR REPLACE FUNCTION update_profdisc
(pcd integer, pnp integer, pano CHARACTER VARYING(10)) RETURNS CHAR(10)
AS $$
DECLARE
vpcd ALIAS FOR $1;
vpnp ALIAS FOR $2;
vpano ALIAS FOR $3;
RETORNO VARCHAR(10)='';
BEGIN
UPDATE profdisc SET numero_prof = vpnp, ano = vpano WHERE codigo_disc = pcd;
RETORNO := 'UPDATE';
RETURN RETORNO;
END;
$$ LANGUAGE PLPGSQL;

select * from update_profdisc(10,10,'2011');

	
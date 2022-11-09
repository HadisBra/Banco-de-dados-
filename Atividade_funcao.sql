

CREATE TABLE professor
(
  "numero_prof" integer NOT NULL,
  profnome character varying(30),
  profrua character varying(30),
  profcidade character varying(30),
  CONSTRAINT professor_pkey PRIMARY KEY ("numero_prof")
);
CREATE TABLE aluno
(
  "numero_aluno" integer NOT NULL,
  alunome character varying(30),
  alufrua character varying(30),
  alucidade character varying(30),
  CONSTRAINT aluno_pkey PRIMARY KEY ("numero_aluno")
);

CREATE TABLE disciplina
(
  "codigo_disc" integer NOT NULL,
  "nome_disciplina" character varying(30),
  "nome_curso" character varying(30),
  "qtd_aulas" integer,
  CONSTRAINT disciplina_pkey PRIMARY KEY ("codigo_disc")
);

CREATE TABLE matricula
(
  "numero_aluno" integer NOT NULL,
  "codigo_disc" integer NOT NULL,
  ano character varying(4) NOT NULL,
  CONSTRAINT matricula_pkey PRIMARY KEY ("numero_aluno", "codigo_disc", ano),
  CONSTRAINT matricula_aluno­_fk FOREIGN KEY ("numero_aluno")
      REFERENCES aluno ("numero_aluno"),
  CONSTRAINT matricula_disciplina_fk FOREIGN KEY ("codigo_disc")
      REFERENCES disciplina ("codigo_disc") 
);

CREATE TABLE profdisc
(
  "codigo_disc" integer NOT NULL,
  "numero_prof" integer NOT NULL,
  ano character varying(4),
  CONSTRAINT prof_disc_pk PRIMARY KEY ("codigo_disc", "numero_prof", ano),
  CONSTRAINT codigo_disc_fk FOREIGN KEY ("codigo_disc")
      REFERENCES disciplina ("codigo_disc"),
  CONSTRAINT numero_prof_fk FOREIGN KEY ("numero_prof")
      REFERENCES professor ("numero_prof") 
);


INSERT INTO aluno ("numero_aluno", alunome, alufrua, alucidade) VALUES (1, ' Tiago Mateus Junior', '210', 'Palmas');
INSERT INTO aluno ("numero_aluno", alunome, alufrua, alucidade) VALUES (2, 'Luciana Gomes', '202', 'Palmas');
INSERT INTO aluno ("numero_aluno", alunome, alufrua, alucidade) VALUES (3, 'João Mateus', '2300', 'Gurupi');
INSERT INTO aluno ("numero_aluno", alunome, alufrua, alucidade) VALUES (4, 'José Silva', '1024', 'Paraíso');
INSERT INTO aluno ("numero_aluno", alunome, alufrua, alucidade) VALUES (5, 'Juraci', '106', 'Miranorte');
INSERT INTO aluno ("numero_aluno", alunome, alufrua, alucidade) VALUES (6, 'Paulo', '101', 'Goianorte');
INSERT INTO aluno ("numero_aluno", alunome, alufrua, alucidade) VALUES (7, 'Adriana Calcanhoto', 'rua Alvorada', 'Paraaíso');
INSERT INTO aluno ("numero_aluno", alunome, alufrua, alucidade) VALUES (8, 'Rosane', 'rua das flores', 'Guaraí');
INSERT INTO aluno ("numero_aluno", alunome, alufrua, alucidade) VALUES (9, 'Mara', 'rua das águas', 'Porto Nacional');
INSERT INTO aluno ("numero_aluno", alunome, alufrua, alucidade) VALUES (10, 'Julia', 'rua de madeira', 'Paraiso');
INSERT INTO aluno ("numero_aluno", alunome, alufrua, alucidade) VALUES (11, 'Julia', 'rua de madeira', 'Marília');

INSERT INTO professor ("numero_prof", profnome, profrua, profcidade) VALUES (1, 'João José', '103', 'Palmas');
INSERT INTO professor ("numero_prof", profnome, profrua, profcidade) VALUES (2, 'Maria José', '201', 'Palmas');
INSERT INTO professor ("numero_prof", profnome, profrua, profcidade) VALUES (3, 'Bruno', '305', 'Paraiso');
INSERT INTO professor ("numero_prof", profnome, profrua, profcidade) VALUES (4, 'José Ricardo', '1106', 'Porto Nacional');
INSERT INTO professor ("numero_prof", profnome, profrua, profcidade) VALUES (5, 'Manuela', '120', 'Araguaina');
INSERT INTO professor ("numero_prof", profnome, profrua, profcidade) VALUES (6, 'Bruno', '1003', 'Porto Nacional');
INSERT INTO professor ("numero_prof", profnome, profrua, profcidade) VALUES (7, 'Luciana', ' 100', 'Miracema');
INSERT INTO professor ("numero_prof", profnome, profrua, profcidade) VALUES (8, 'Paulo', ' 150', 'Palmas');
INSERT INTO professor ("numero_prof", profnome, profrua, profcidade) VALUES (9, 'Lual', '1006', 'Paraíso');
INSERT INTO professor ("numero_prof", profnome, profrua, profcidade) VALUES (10, 'Antonio Marcos', '170', 'Araguaína');

INSERT INTO disciplina ("codigo_disc", "nome_disciplina", "nome_curso", "qtd_aulas") VALUES (1, ' Química', 'Ensino Médio', 4);
INSERT INTO disciplina ("codigo_disc", "nome_disciplina", "nome_curso", "qtd_aulas") VALUES (2, ' Biologia', 'Ensino Médio', 4);
INSERT INTO disciplina ("codigo_disc", "nome_disciplina", "nome_curso", "qtd_aulas") VALUES (3, 'História', 'Ensino Médio', 2);
INSERT INTO disciplina ("codigo_disc", "nome_disciplina", "nome_curso", "qtd_aulas") VALUES (4, ' Religião', 'Ensino Médio', 2);
INSERT INTO disciplina ("codigo_disc", "nome_disciplina", "nome_curso", "qtd_aulas") VALUES (5, ' Português', 'Ensino Pós Médio', 4);
INSERT INTO disciplina ("codigo_disc", "nome_disciplina", "nome_curso", "qtd_aulas") VALUES (6, 'Física', 'Ensino Pós Médio', 6);
INSERT INTO disciplina ("codigo_disc", "nome_disciplina", "nome_curso", "qtd_aulas") VALUES (7, 'Matemática', 'Ensino Pós Médio', 4);
INSERT INTO disciplina ("codigo_disc", "nome_disciplina", "nome_curso", "qtd_aulas") VALUES (8, 'Geografia ', 'Ensino Pós Médio', 2);
INSERT INTO disciplina ("codigo_disc", "nome_disciplina", "nome_curso", "qtd_aulas") VALUES (9, 'Informática Aplicada', 'Ensino Pós Médio', 4);
INSERT INTO disciplina ("codigo_disc", "nome_disciplina", "nome_curso", "qtd_aulas") VALUES (10, 'Banco de dados', 'Superior', 4);
INSERT INTO disciplina ("codigo_disc", "nome_disciplina", "nome_curso", "qtd_aulas") VALUES (11, 'Programação de Banco de dados', 'Computação', 4);

INSERT INTO matricula ("numero_aluno", "codigo_disc", ano) VALUES (1, 10, '2010');
INSERT INTO matricula ("numero_aluno", "codigo_disc", ano) VALUES (1, 4, '2010');
INSERT INTO matricula ("numero_aluno", "codigo_disc", ano) VALUES (1, 6, '2010');
INSERT INTO matricula ("numero_aluno", "codigo_disc", ano) VALUES (5, 3, '2010');
INSERT INTO matricula ("numero_aluno", "codigo_disc", ano) VALUES (6, 1, '2010');
INSERT INTO matricula ("numero_aluno", "codigo_disc", ano) VALUES (2, 6, '2010');
INSERT INTO matricula ("numero_aluno", "codigo_disc", ano) VALUES (7, 9, '2010');
INSERT INTO matricula ("numero_aluno", "codigo_disc", ano) VALUES (8, 10, '2010');
INSERT INTO matricula ("numero_aluno", "codigo_disc", ano) VALUES (9, 1, '2010');
INSERT INTO matricula ("numero_aluno", "codigo_disc", ano) VALUES (2, 2, '2010');
INSERT INTO matricula ("numero_aluno", "codigo_disc", ano) VALUES (11, 11, '2010');

INSERT INTO profdisc ("codigo_disc", "numero_prof", ano) VALUES (1, 10, '2010');
INSERT INTO profdisc ("codigo_disc", "numero_prof", ano) VALUES (2, 5, '2010');
INSERT INTO profdisc ("codigo_disc", "numero_prof", ano) VALUES (3, 7, '2010');
INSERT INTO profdisc ("codigo_disc", "numero_prof", ano) VALUES (4, 4, '2010');
INSERT INTO profdisc ("codigo_disc", "numero_prof", ano) VALUES (5, 9, '2010');
INSERT INTO profdisc ("codigo_disc", "numero_prof", ano) VALUES (6, 2, '2010');
INSERT INTO profdisc ("codigo_disc", "numero_prof", ano) VALUES (7, 3, '2010');
INSERT INTO profdisc ("codigo_disc", "numero_prof", ano) VALUES (8, 9, '2010');
INSERT INTO profdisc ("codigo_disc", "numero_prof", ano) VALUES (9, 6, '2010');
INSERT INTO profdisc ("codigo_disc", "numero_prof", ano) VALUES (10, 3, '2010');
INSERT INTO profdisc ("codigo_disc", "numero_prof", ano) VALUES (11, 5, '2010');



select * FROM aluno;
select * FROM professor;
select * FROM profdisc;
select * FROM disciplina;
select * from matricula;
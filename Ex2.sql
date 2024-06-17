CREATE TABLE aluno (
	id_aluno serial PRIMARY KEY,
	nome_aluno varchar(50),
	data_nasc date
)

CREATE TABLE curso (
	id_curso serial PRIMARY KEY,
	nome_curso varchar(50)
)

CREATE TABLE turma (
	id_turma serial PRIMARY KEY,
	professor varchar(50),
	id_curso serial,
	Constraint fk_curso foreign key (id_curso) References curso (id_curso)
)

CREATE TABLE matricula (
	id_aluno serial,
	Constraint fk_aluno foreign key (id_aluno) References aluno (id_aluno),
	id_turma serial,
	Constraint fk_turma foreign key (id_turma) References turma (id_turma)
)

SELECT * FROM aluno

SELECT * FROM matricula

SELECT * FROM turma

SELECT * FROM curso

INSERT INTO aluno (id_aluno, nome_aluno, data_nasc) VALUES
('1', 'Guilherme', '29/12/2005'),
('2', 'Gabriel', '13/03/2006'),
('3', 'João', '03/12/2005'),
('4', 'Guilherme', '01/04/2005'),
('5', 'Bruno', '04/10/2005');

INSERT INTO curso (id_curso, nome_curso) VALUES
('1', 'Mecatrônica'),
('3', 'Química'),
('4', 'Física'),
('5', 'ADS'),
('6', 'Filosofia');

INSERT INTO turma (id_turma, professor, id_curso) VALUES
('10', 'Cainã', '1'),
('12', 'Gabriel', '3'),
('13', 'André', '4'),
('14', 'Nicolas', '5'),
('15', 'Amarildo', '6');

INSERT INTO matricula (id_aluno, id_turma) VALUES
('1', '10'),
('5', '10'),
('2', '12'),
('4', '12'),
('3', '13'),
('4', '13'),
('4', '14'),
('5', '14'),
('5', '15'),
('1', '15');

--Listar todos os alunos matriculados em uma turma específica.
SELECT id_aluno FROM matricula WHERE id_turma='13'

--Encontrar todos os cursos ministrados em uma turma específica.
SELECT curso.id_curso FROM curso NATURAL INNER JOIN turma WHERE turma.id_turma='12'

--Contar o número de alunos em cada turma.
SELECT turma.id_turma, COUNT (aluno.id_aluno) FROM aluno NATURAL INNER JOIN matricula NATURAL INNER JOIN turma GROUP BY turma.id_turma
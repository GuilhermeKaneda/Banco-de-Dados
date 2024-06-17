CREATE TABLE paciente (
	id_paciente serial PRIMARY KEY,
	nome_pac varchar(50),
	data_nasc date
)

CREATE TABLE medico (
	id_medico serial PRIMARY KEY,
	nome_medico varchar(50),
	especialização varchar(50)
)

CREATE TABLE registro (
	id_registro serial PRIMARY KEY,
	id_paciente serial,
	Constraint fk_paciente foreign key (id_paciente) References paciente (id_paciente),
	id_medico serial,
	Constraint fk_medico foreign key (id_medico) References medico (id_medico)
)

SELECT * FROM paciente

SELECT * FROM medico

SELECT * FROM registro

INSERT INTO paciente (id_paciente, nome_pac, data_nasc) VALUES
('1', 'Guilherme', '29/12/2005'),
('2', 'Gabriel', '13/03/2006'),
('3', 'João', '03/12/2005'),
('4', 'Guilherme', '01/04/2005'),
('5', 'Bruno', '04/10/2005');

INSERT INTO medico (id_medico, nome_medico, especialização) VALUES
('1', 'Cainã', 'Dentista'),
('2', 'Gabriel', 'Gastro'),
('3', 'André', 'Urologista'),
('4', 'Nicolas', 'Pediatra'),
('5', 'Amarildo', 'Ginecologista');

INSERT INTO registro (id_registro, id_paciente, id_medico) VALUES
('1', '2', '3'),
('2', '1', '2'),
('3', '3', '1'),
('4', '4', '5'),
('5', '5', '4'),
('6', '2', '5'),
('7', '3', '4'),
('8', '4', '3'),
('9', '5', '2'),
('10', '1', '1');

--Listar todos os pacientes de um médico específico.
SELECT nome_pac, id_paciente FROM paciente NATURAL INNER JOIN registro WHERE id_medico='3'

--Encontrar todos os médicos de um paciente específico.
SELECT nome_medico, id_medico FROM medico NATURAL INNER JOIN registro WHERE id_paciente='3'

--Calcular a média de pacientes por médico.
SELECT AVG(pacientes_por_medico) AS media
FROM (SELECT COUNT(id_paciente) AS pacientes_por_medico FROM registro GROUP BY id_medico) AS resultado;

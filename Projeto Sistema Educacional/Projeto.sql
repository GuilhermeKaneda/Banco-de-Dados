-- Criando a tabela aluno
CREATE TABLE aluno (
	cpf VARCHAR(14) PRIMARY KEY,
    nome_aluno VARCHAR(255),
    idade INTEGER
);

-- Populando a tabela aluno
INSERT INTO aluno (nome_aluno, idade, cpf)
VALUES
    ('João Silva', 20, '123.456.789-01'),
    ('Maria Santos', 22, '987.654.321-09'),
    ('Pedro Oliveira', 19, '456.789.123-45'),
	('Ana Oliveira', 21, '789.012.345-67'),
    ('Carlos Rodrigues', 23, '234.567.890-12'),
    ('Laura Pereira', 20, '345.678.901-23'),
	('Fernanda Costa', 24, '567.890.123-45'),
    ('Rafael Souza', 21, '678.901.234-56'),
    ('Isabela Santos', 22, '488.411.448-58'),
    ('Lucas Oliveira', 23, '890.123.456-78');

-- Criando a tabela contato
CREATE TABLE contato (
    telefone VARCHAR(20) UNIQUE,
    email VARCHAR(255) UNIQUE,
    cpf VARCHAR(14), FOREIGN KEY (cpf) REFERENCES aluno(cpf)
);

-- Populando a tabela contato
INSERT INTO contato (telefone, email, cpf)
VALUES
	('(18) 92318-3164', 'joao.silva@example.com', '123.456.789-01'),
	('(16) 92212-8797', 'maria.santos@example.com', '987.654.321-09'),
	('(17) 92762-1941', 'pedro.oliveira@example.com', '456.789.123-45'),
	('(18) 92427-7315', 'ana.oliveira@example.com', '789.012.345-67'),
	('(18) 93666-2887', 'carlos.rodrigues@example.com', '234.567.890-12'),
	('(17) 93688-2726', 'laura.pereira@example.com', '345.678.901-23'),
	('(12) 93658-3121', 'fernanda.costa@example.com', '567.890.123-45'),
	('(13) 93378-2724', 'rafael.souza@example.com', '678.901.234-56'),
	('(17) 93896-9135', 'isabela.santos@example.com', '488.411.448-58'),
	('(15) 92687-1321', 'lucas.oliveira@example.com', '890.123.456-78');

-- Criando a tabela endereço
CREATE TABLE endereco (
    cidade VARCHAR(100),
    complemento VARCHAR(255),
    numero INT,
    bairro VARCHAR(100),
    rua VARCHAR(255),
    cpf VARCHAR(14) UNIQUE, FOREIGN KEY (cpf) REFERENCES aluno(cpf)
);

-- Populando a tabela endereço
INSERT INTO endereco (cidade, complemento, numero, bairro, rua, cpf)
VALUES
    ('São Paulo', 'Apto 302', 123, 'Centro', 'Rua das Flores', '123.456.789-01'),
    ('Rio de Janeiro', 'Casa 5', 456, 'Copacabana', 'Avenida Atlântica', '987.654.321-09'),
    ('Belo Horizonte', 'Sala 10', 789, 'Savassi', 'Rua da Liberdade', '456.789.123-45'),
    ('Porto Alegre', 'Bloco B', 234, 'Moinhos de Vento', 'Rua dos Pinheiros', '789.012.345-67'),
    ('Curitiba', 'Apto 101', 567, 'Batel', 'Alameda Dom Pedro II', '234.567.890-12'),
    ('Salvador', 'Casa 3', 890, 'Barra', 'Avenida Oceânica', '345.678.901-23'),
    ('Fortaleza', 'Apto 501', 678, 'Meireles', 'Rua Monsenhor Tabosa', '567.890.123-45'),
    ('Recife', 'Casa 7', 321, 'Boa Viagem', 'Avenida Conselheiro Aguiar', '678.901.234-56'),
    ('Brasília', 'Bloco C', 432, 'Asa Sul', 'Quadra 302', '488.411.448-58'),
    ('Manaus', 'Apto 202', 765, 'Adrianópolis', 'Rua Rio Javari', '890.123.456-78');

-- Criando a tabela departamento
CREATE TABLE departamento (
    id_departamento SERIAL PRIMARY KEY,
    area VARCHAR(100)
);

-- Populando a tabela departameto
INSERT INTO departamento (area)
VALUES
    ('Biológicas'),
    ('Exatas'),
    ('Humanas'),
    ('Tecnologia');

-- Criando a tabela curso
CREATE TABLE curso (
    id_curso SERIAL PRIMARY KEY,
    nome_curso VARCHAR(255),
    id_departamento INT, FOREIGN KEY (id_departamento) REFERENCES departamento(id_departamento)
);

-- Populando a tabela curso
INSERT INTO curso (nome_curso, id_departamento)
VALUES
    ('Ciências Sociais', 3),
    ('Ciência da Computação', 4),
    ('Biologia Marinha', 1),
    ('Matemática Aplicada', 2),
    ('Artes Visuais', 3),
    ('Engenharia Elétrica', 4),
    ('Design de Jogos', 4),
    ('Psicologia Clínica', 3),
    ('Engenharia de Software', 4),
    ('Física Nuclear', 2);

-- Criando a tabela matricula
CREATE TABLE matricula (
    ra SERIAL PRIMARY KEY,
	id_curso INT, FOREIGN KEY (id_curso) REFERENCES curso(id_curso),
	cpf VARCHAR(14), FOREIGN KEY (cpf) REFERENCES aluno(cpf),
    formado boolean
);

-- Populando a tabela matricula
INSERT INTO matricula (id_curso, cpf, formado)
VALUES
    (1, '890.123.456-78', true),
    (2, '488.411.448-58', true),
    (3, '678.901.234-56', false),
    (4, '567.890.123-45', false),
    (5, '345.678.901-23', true),
    (6, '234.567.890-12', true),
    (7, '789.012.345-67', false),
    (8, '456.789.123-45', false),
    (9, '987.654.321-09', true),
    (10, '123.456.789-01', true),
    (6, '123.456.789-01', false),
    (7, '987.654.321-09', false),
    (8, '456.789.123-45', true),
    (9, '789.012.345-67', true),
    (10, '234.567.890-12', true);

-- Criando a tabela disciplina
CREATE TABLE disciplina (
    id_disciplina SERIAL PRIMARY KEY,
	nome_disciplina VARCHAR(255)
);

-- Populando a tabela disciplina
INSERT INTO disciplina (nome_disciplina)
VALUES
    ('Sociologia I'), ('Antropologia Cultural'), ('Algoritmos e Estruturas de Dados'),
    ('Inteligência Artificial'), ('Ecologia Marinha'), ('Oceanografia'),
    ('Cálculo Multivariável'), ('Equações Diferenciais'), ('História da Arte Contemporânea'),
    ('Fotografia'), ('Eletrônica de Potência'), ('Sistemas de Controle'), ('Design Digital'),
    ('Programação de Jogos'), ('Psicopatologia'),
    ('Terapia Cognitivo-Comportamental'), ('Engenharia de Requisitos'), ('Desenvolvimento Ágil'),
    ('Física de Partículas'), ('Radioatividade');

-- Criando a tabela disciplina_curso
CREATE TABLE disciplina_curso (
    id_curso INT, FOREIGN KEY (id_curso) REFERENCES curso(id_curso),
	id_disciplina INT, FOREIGN KEY (id_disciplina) REFERENCES disciplina(id_disciplina),
    obrigatoriedade boolean
);

-- Populando a tabela disciplina_curso
INSERT INTO disciplina_curso (id_disciplina, id_curso, obrigatoriedade)
VALUES
    (1, 1, true), (2, 1, true), (3, 2, true), (4, 2, false), (17, 2, false), (18, 2, true), (8, 2, true), (5, 3, true), (6, 3, true), (7, 4, true), (8, 4, true), 
    (9, 5, true), (10, 5, true), (2, 5, false), (11, 6, true), (12, 6, true), (7, 6, false), (8, 6, true), (13, 7, true), (14, 7, false), (3, 7, true), (15, 8, true), 
    (16, 8, true), (2, 8, false), (17, 9, false), (18, 9, true),  (3, 9, true), (4, 9, false), (19, 10, true), (20, 10, true), (7, 10, true), (8, 10, false);

-- Criando a tabela grade
CREATE TABLE grade (
    ra INT, FOREIGN KEY (ra) REFERENCES matricula(ra),
	id_disciplina INT, FOREIGN KEY (id_disciplina) REFERENCES disciplina(id_disciplina)
);


-- Populando a tabela grade
INSERT INTO grade (id_disciplina, ra)
VALUES
    (1, 1), (2, 1), (3, 2), (4, 2), (18, 2), (8, 2), (5, 3), (6, 3), (7, 4), (8, 4), (9, 5), (10, 5), (2, 5),
	(11, 6), (12, 6), (8, 6), (13, 7), (3, 7), (15, 8), (16, 8), (2, 8), (17, 9), (18, 9), (3, 9), (4, 9), (19, 10), 
	(20, 10), (7, 10), (11, 11), (12, 11), (7, 11), (8, 11), (13, 12), (14, 12), (3, 12), (15, 13), (16, 13), (18, 14), 
	(3, 14), (19, 15), (20, 15), (7, 15), (8, 15);

SELECT * FROM disciplina_curso
SELECT * FROM disciplina
SELECT * FROM curso
SELECT * FROM aluno
SELECT * FROM departamento
SELECT * FROM grade
SELECT * FROM endereco
SELECT * FROM contato

-- Exercicio 1
SELECT DISTINCT nome_aluno, cpf, idade, email, telefone, rua, bairro, complemento, numero, cidade FROM matricula NATURAL INNER JOIN
aluno NATURAL INNER JOIN contato NATURAL INNER JOIN endereco WHERE nome_aluno='João Silva' OR ra=10

-- Exercicio 2
SELECT nome_curso FROM (departamento NATURAL INNER JOIN curso) WHERE area='Tecnologia'

-- Exercicio 3
SELECT nome_curso FROM (disciplina NATURAL INNER JOIN disciplina_curso) NATURAL INNER JOIN curso WHERE nome_disciplina='Equações Diferenciais'

-- Exercicio 4
SELECT nome_curso FROM (aluno NATURAL INNER JOIN matricula) NATURAL INNER JOIN curso WHERE cpf='123.456.789-01'

--Exercicio 5
SELECT DISTINCT nome_aluno, cpf FROM (curso NATURAL INNER JOIN matricula) NATURAL INNER JOIN aluno WHERE nome_curso='Física Nuclear'

-- Exercicio 6
SELECT DISTINCT nome_aluno, cpf FROM (disciplina NATURAL INNER JOIN grade) NATURAL INNER JOIN matricula NATURAL INNER JOIN aluno
WHERE nome_disciplina='Algoritmos e Estruturas de Dados'

-- Exercicio 7
SELECT nome_aluno FROM (matricula NATURAL INNER JOIN aluno) WHERE formado=true

-- Exercicio 8
SELECT nome_aluno FROM (matricula NATURAL INNER JOIN aluno) WHERE formado=false

-- Exercicio 9
SELECT nome_curso, COUNT (ra) FROM curso NATURAL INNER JOIN matricula
WHERE formado=false GROUP BY nome_curso

-- Exercicio 10
SELECT nome_disciplina, COUNT (ra) FROM disciplina NATURAL INNER JOIN grade NATURAL INNER JOIN matricula
WHERE formado=false GROUP BY nome_disciplina
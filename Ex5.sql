CREATE TABLE funcionarios (
    id_funcionario serial PRIMARY KEY,
    nome_funcionario varchar (50),
    data_admissao date,
    cargo varchar (50)
);

CREATE TABLE gerentes (
    id_gerente serial PRIMARY KEY,
    nome_gerente varchar (50)
);

CREATE TABLE departamentos (
    id_departamento serial PRIMARY KEY,
    id_funcionario INT,
    CONSTRAINT fk_funcionario FOREIGN KEY (id_funcionario) REFERENCES funcionarios (id_funcionario),
    id_gerente serial,
    constraint fk_gerente FOREIGN KEY (id_gerente) REFERENCES gerentes (id_gerente),
    nome_departamento varchar (50)
);

INSERT INTO funcionarios (nome_funcionario, data_admissao, cargo) VALUES
('Ana Beatriz', '2023-01-10', 'Analista de Sistemas'),
('Carlos Silva', '2023-02-15', 'Desenvolvedor Backend'),
('Débora Gomes', '2023-03-20', 'Desenvolvedora Full Stack'),
('Eduardo Rocha', '2023-04-25', 'Analista de Segurança'),
('Fernanda Lima', '2023-05-30', 'Administrador de Banco de Dados'),
('Gustavo Henrique', '2023-06-05', 'Analista de Dados'),
('Helena Martins', '2023-07-10', 'Engenheira de Redes'),
('Igor Santos', '2023-08-15', 'Suporte Técnico'),
('Júlia Carvalho', '2023-09-20', 'Engenheira de Software'),
('Lucas Pereira', '2023-10-25', 'Analista de Sistemas');

INSERT INTO gerentes (nome_gerente) VALUES
('João da Silva'),
('Maria Oliveira'),
('Pedro Santos'),
('Ana Souza'),
('Carlos Pereira'),
('Juliana Lima'),
('Rafael Fernandes'),
('Isabela Costa'),
('Lucas Oliveira'),
('Mariana Silva');

INSERT INTO departamentos (id_funcionario, id_gerente, nome_departamento) VALUES
(1, 1, 'Vendas'),
(2, 2, 'Marketing'),
(3, 3, 'Finanças'),
(4, 4, 'Recursos Humanos'),
(5, 5, 'Desenvolvimento'),
(6, 1, 'Vendas'),
(7, 2, 'Marketing'),
(8, 3, 'Finanças'),
(9, 4, 'Recursos Humanos'),
(10, 5, 'Desenvolvimento');

--Listar todos os funcionários de um departamento específico.
SELECT nome_funcionario, id_funcionario FROM funcionarios NATURAL INNER JOIN departamentos 
WHERE nome_departamento='Vendas'

--Encontrar o departamento em que um funcionário específico trabalha.
SELECT nome_departamento FROM funcionarios NATURAL INNER JOIN departamentos 
WHERE id_funcionario='10'

--Calcular o número total de funcionários gerenciados por cada gerente.
SELECT nome_gerente, id_gerente, COUNT(id_funcionario) FROM gerentes NATURAL INNER JOIN departamentos NATURAL INNER JOIN funcionarios 
GROUP BY id_gerente ORDER BY id_gerente
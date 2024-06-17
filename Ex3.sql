CREATE TABLE funcionarios (
	id_func serial PRIMARY KEY,
	nome varchar(50),
	data_admissao date
)

SELECT * FROM funcionarios

CREATE TABLE projetos (
	id_projeto serial PRIMARY KEY,
	nome_projeto varchar(100),
	descricao text
)

SELECT * FROM projetos

CREATE TABLE funcionarios_projetos (
	id_func int ,
	--CONSTRAINT função para criar foreign key
	CONSTRAINT fk_func FOREIGN KEY (id_func) REFERENCES funcionarios (id_func),
	id_projeto int,
	CONSTRAINT fk_projeto FOREIGN KEY (id_projeto) REFERENCES projetos (id_projeto)
)

SELECT * FROM funcionarios_projetos

INSERT INTO projetos (id_projeto, nome_projeto, descricao) VALUES
(1, 'Sistema de Gestão de Biblioteca', 'Desenvolvimento de um sistema para gerenciar empréstimos, devoluções e cadastro de livros e usuários.'),
(2, 'Aplicativo de Receitas Culinárias', 'Criação de um aplicativo móvel que oferece uma variedade de receitas culinárias, incluindo instruções passo a passo e listas de ingredientes.'),
(3, 'Plataforma de Aprendizado Online', 'Desenvolvimento de uma plataforma web para oferecer cursos e materiais educacionais em diversos temas.'),
(4, 'Aplicativo de Monitoramento de Saúde', 'Criação de um aplicativo que permite aos usuários acompanhar sua saúde, registrar exercícios, dieta e monitorar sinais vitais.'),
(5, 'Sistema de Gerenciamento de Projetos', 'Desenvolvimento de um software para auxiliar na organização, colaboração e acompanhamento de projetos.'),
(6, 'Rede Social para Profissionais', 'Criação de uma plataforma para conectar profissionais de diversas áreas, facilitando networking e compartilhamento de conhecimento.'),
(7, 'Jogo de Estratégia em Tempo Real', 'Desenvolvimento de um jogo eletrônico de estratégia que acontece em tempo real, com elementos de construção e batalhas.'),
(8, 'Aplicativo de Monitoramento Financeiro', 'Criação de um aplicativo para ajudar os usuários a controlar suas finanças pessoais, incluindo despesas, receitas e metas de economia.'),
(9, 'Plataforma de Reservas de Viagens', 'Desenvolvimento de um sistema online para reservas de passagens, hotéis e atividades turísticas.'),
(10, 'Aplicativo de Assistência ao Estudo', 'Criação de um aplicativo que oferece recursos de estudo, como flashcards, quizzes e organização de tarefas acadêmicas.');

INSERT INTO funcionarios (id_func, nome, data_admissao) VALUES
(1, 'João Silva', '2023-01-15'),
(2, 'Maria Santos', '2023-02-28'),
(3, 'Pedro Almeida', '2023-03-10'),
(4, 'Ana Costa', '2023-04-05'),
(5, 'Carlos Oliveira', '2023-05-20'),
(6, 'Mariana Pereira', '2023-06-08'),
(7, 'Ricardo Sousa', '2023-07-17'),
(8, 'Camila Rodrigues', '2023-08-22'),
(9, 'Luiz Fernandes', '2023-09-10'),
(10, 'Amanda Martins', '2023-10-05');

INSERT INTO funcionarios_projetos (id_func, id_projeto) VALUES
(1, 1),
(2, 3),
(3, 2),
(4, 1),
(5, 4),
(6, 2),
(7, 5),
(8, 3),
(9, 4),
(10, 1);

--Listar todos os funcionários associados a um projeto específico.
SELECT nome, id_func FROM funcionarios NATURAL INNER JOIN funcionarios_projetos WHERE id_projeto=1

--Encontrar todos os projetos em que um funcionário específico está envolvido.
SELECT nome_projeto, id_projeto FROM projetos NATURAL INNER JOIN funcionarios_projetos WHERE id_func=2

--Calcular a média de funcionários por projeto.
SELECT AVG(funcionarios_por_projeto) AS media FROM (SELECT COUNT(id_func) 
AS funcionarios_por_projeto FROM funcionarios_projetos GROUP BY id_projeto) AS resultado;
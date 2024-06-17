CREATE TABLE autor (
	id_autor serial PRIMARY KEY,
	nome_autor varchar(50)
)


CREATE TABLE livro (
	ISBN varchar(100) PRIMARY KEY,
	nome_livro varchar(50),
	editora varchar(50),
	publicação date
)

CREATE TABLE biblioteca (
	id_autor serial,
	Constraint fk_autor foreign key (id_autor) References autor (id_autor),
	ISBN varchar(100),
	Constraint fk_ISBN foreign key (ISBN) References livro (ISBN)
)

SELECT * FROM autor

SELECT * FROM livro

SELECT * FROM biblioteca

INSERT INTO autor (id_autor, nome_autor) VALUES
('1', 'Guilherme'),
('2', 'Gabriel'),
('3', 'João'),
('4', 'Guilherme'),
('5', 'Bruno');

INSERT INTO livro (ISBN, nome_livro, editora, publicação) VALUES
('10', 'Senhor dos Anéis: A Sociedade do Anel', 'HarperCollins', '29/07/1954'),
('15', 'Anne Frank', 'Editora Record', '25/06/1947'),
('20', 'Diário de um Banana 1', 'VR Editora', '19/05/2008'),
('25', 'A Culpa É das Estrelas', 'Intrínseca', '10/01/2012'),
('30', 'O Príncipe', 'Editora 34', '14/09/2017');

INSERT INTO biblioteca (id_autor, ISBN) VALUES
('1', '10'),
('2', '15'),
('3', '20'),
('4', '25'),
('5', '30'),
('5', '10'),
('3', '15'),
('1', '30');

--Listar todos os livros e seus autores
SELECT livro.nome_livro, autor.nome_autor FROM (livro NATURAL INNER JOIN biblioteca) INNER JOIN autor 
USING (id_autor) 

--Encontrar todos os livros escritos por um autor específico.
SELECT livro.nome_livro FROM (livro NATURAL INNER JOIN biblioteca) INNER JOIN autor 
USING (id_autor) WHERE nome_autor='Guilherme'

--Encontrar todos os autores que escreveram um livro específico.
SELECT autor.nome_autor FROM (livro NATURAL INNER JOIN biblioteca) INNER JOIN autor 
USING (id_autor) WHERE nome_livro='Anne Frank'

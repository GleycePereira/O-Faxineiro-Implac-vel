CREATE DATABASE IF NOT EXISTS biblioteca;
USE biblioteca;

CREATE TABLE IF NOT EXISTS livros(
	livros_id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(255),
    autor VARCHAR(255),
    editora VARCHAR(255),
    ano_publicacao INT,
    isbn VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS autores(
	autor_id INT PRIMARY KEY AUTO_INCREMENT,
    autor_nome VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS editoras(
	editora_id INT PRIMARY KEY AUTO_INCREMENT,
    editora_nome VARCHAR(255)
);

-- Dropar coluna da tabela livro
ALTER TABLE livros
DROP COLUMN autor,
DROP COLUMN editora;

-- Adicionar coluna na tabela livro
ALTER TABLE livros
ADD COLUMN autor_id INT,
ADD COLUMN editora_id INT;

-- Estabelece uma restição de chave estrangeira na TABELA LIVROS para COLUNA AUTOR_ID
-- Garante que o valor da coluna (autor_id/ livros) esteja presente na COLUNA AUTOR_ID da TABELA AUTORES
-- De acordo com a referência que aponta para a coluna autor_id na tabela autores
ALTER TABLE livros
ADD CONSTRAINT autor_id FOREIGN KEY (autor_id) REFERENCES autores(autor_id);

ALTER TABLE livros
ADD CONSTRAINT editora_id FOREIGN KEY (editora_id) REFERENCES editoras(editora_id);

-- Inserindo valores
INSERT INTO autores (autor_nome) VALUES
('John Green'),
('J.K. Rowling'),
('J.R.R. Tolkien'),
('J.D. Salinger'),
('George Orwell'),
('Rick Riordan'),
('João Guimarães Rosa'),
('Machado de Assis'),
('Graciliano Ramos'),
('Aluísio Azevedo'),
('Mário de Andrade');

INSERT INTO editoras (editora_nome) VALUES
('Intrínseca'),
( 'Rocco'),
('Martins Fontes'),
('Little, Brown and Company'),
('Companhia Editora Nacional'),
('Nova Fronteira'),
('Companhia das Letras'),
('Martin Claret'),
('Penguin Companhia');

INSERT INTO livros (titulo, ano_publicacao, isbn, autor_id, editora_id) VALUES 
('A Culpa é das Estrelas', 2012, '978-85-8057-346-6', 1, 1),
('Harry Potter e a Pedra Filosofal', 1997, '9788532511010', 2, 2),
('O Senhor dos Anéis: A Sociedade do Anel', 1954, '9788533603149', 3, 3),
('The Catcher in the Rye', 1951, '9780316769488', 4, 4),
('1984', 1949, '978-85-221-0616-9', 5, 5),
('Percy Jackson e o Ladrão de Raios', 2005, '9788598078355', 6, 1),
('Grande Sertão: Veredas', 1956, '9788520923251', 7, 6),
('Memórias Póstumas de Brás Cubas', 1881, '9788535910663', 8, 7),
('Vidas Secas', 1938, '9788572326972', 9, 5),
('O Alienista', 1882, '9788572327429', 8, 8),
('O Cortiço', 1890, '9788579027048', 10, 9),
('Dom Casmurro', 1899, '9788583862093', 8, 9),
('Macunaíma', 1928, '9788503012302', 11, 5);


SELECT livros.livros_id, livros.titulo, livros.ano_publicacao, livros.isbn, autores.autor_nome AS Autor, editoras.editora_nome AS Editora
FROM livros
INNER JOIN autores ON livros.autor_id = autores.autor_id
INNER JOIN editoras ON livros.editora_id = editoras.editora_id;

SELECT * FROM livros;

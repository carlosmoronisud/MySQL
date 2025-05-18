-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS db_curso_da_minha_vida;
USE db_curso_da_minha_vida;

-- Criação da tabela tb_categorias
CREATE TABLE tb_categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    descricao VARCHAR(255),
    nivel_dificuldade VARCHAR(20) -- por exemplo, 'Iniciante', 'Intermediário', 'Avançado'
);

-- Inserção de 5 categorias
INSERT INTO tb_categorias (nome, descricao, nivel_dificuldade) VALUES
('Java', 'Cursos relacionados à linguagem Java', 'Intermediário'),
('Python', 'Cursos de Python para iniciantes e avançados', 'Iniciante'),
('Web Development', 'Desenvolvimento web com HTML, CSS, JS', 'Intermediário'),
('Data Science', 'Análise de dados e ciência de dados', 'Avançado'),
('Design UX/UI', 'Projetos de experiência do usuário e interface', 'Iniciante');

-- Criação da tabela tb_cursos
CREATE TABLE tb_cursos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(255),
    preco DECIMAL(10,2) NOT NULL,
    duracao SEMESTRES INT,
    categoria_id INT,
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

-- Inserção de 8 cursos
INSERT INTO tb_cursos (nome, descricao, preco, duracao, categoria_id) VALUES
('Java Básico', 'Curso introdutório de Java para iniciantes', 700.00, 2, 1),
('Java Avançado', 'Curso avançado de Java com projetos reais', 1200.00, 3, 1),
('Python para Data Science', 'Aplicações de Python em Data Science', 950.00, 3, 2),
('Python Iniciante', 'Curso introdutório de Python', 500.00, 2, 2),
('HTML & CSS', 'Desenvolvimento de sites com HTML e CSS', 600.00, 2, 3),
('JavaScript Completo', 'Curso completo de JavaScript', 850.00, 3, 3),
('Fundamentos de Data Science', 'Conceitos básicos de Data Science', 1030.00, 3, 4),
('UI/UX Design', 'Design de interfaces e experiência do usuário', 900.00, 2, 5);

-- Consultas

-- 1. Cursos cujo valor seja maior que R$500,00
SELECT * FROM tb_cursos WHERE preco > 500;

-- 2. Cursos cujo valor esteja entre R$600,00 e R$1000,00
SELECT * FROM tb_cursos WHERE preco BETWEEN 600 AND 1000;

-- 3. Cursos com a letra 'J' no nome
SELECT * FROM tb_cursos WHERE nome LIKE '%J%';

-- 4. INNER JOIN para unir cursos com categorias
SELECT c.id, c.nome AS curso_nome, c.descricao, c.preco, c.duracao, cat.nome AS categoria_nome, cat.nivel_dificuldade
FROM tb_cursos c
INNER JOIN tb_categorias cat ON c.categoria_id = cat.id;

-- 5. INNER JOIN para cursos de uma categoria específica (exemplo: 'Java')
SELECT c.id, c.nome AS curso_nome, c.descricao, c.preco, c.duracao, cat.nome AS categoria_nome
FROM tb_cursos c
INNER JOIN tb_categorias cat ON c.categoria_id = cat.id
WHERE cat.nome = 'Java';
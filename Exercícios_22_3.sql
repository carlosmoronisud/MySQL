-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS cidade_dos_vegetais;
USE cidade_dos_vegetais;

-- Criação da tabela tb_categorias
CREATE TABLE tb_categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    descricao VARCHAR(255),
    segmento VARCHAR(50) -- exemplo: 'Carnes', 'Frutas', 'Legumes', etc.
);

-- Inserção de 5 categorias
INSERT INTO tb_categorias (nome, descricao, segmento) VALUES
('Carnes bovinas', 'Carnes bovinas de alta qualidade', 'Carnes'),
('Frutas Tropicais', 'Frutas típicas tropicais', 'Frutas'),
('Legumes', 'Legumes frescos e variados', 'Legumes'),
('Aves', 'Aves frescas e congeladas', 'Carnes'),
('Verduras', 'Verduras e hortaliças', 'Legumes');

-- Criação da tabela tb_produtos
CREATE TABLE tb_produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(255),
    preco DECIMAL(10,2) NOT NULL,
    validade DATE,
    categoria_id INT,
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

-- Inserção de 8 produtos
INSERT INTO tb_produtos (nome, descricao, preco, validade, categoria_id) VALUES
('Filé Mignon', 'Carne de alta qualidade do bovino', 120.00, '2025-12-31', 1),
('Picanha', 'Corte tradicional de carne bovina', 130.00, '2025-11-30', 1),
('Banana Nanica', 'Banana madura e fresca', 7.00, '2024-08-15', 2),
('Abacaxi', 'Abacaxi do campo', 8.50, '2024-07-21', 2),
('Cenoura', 'Cenoura fresca e crocante', 4.00, '2024-06-10', 3),
('Alface', 'Alface orgânica, fresca', 3.50, '2024-05-25', 5),
('Aves Inteira', 'Frango inteiro resfriado', 25.00, '2024-07-15', 4),
('Brócolis', 'Brócolis orgânico', 6.00, '2024-06-30', 3);

-- Consultas

-- 1. Produtos cujo valor seja maior que R$50,00
SELECT * FROM tb_produtos WHERE preco > 50;

-- 2. Produtos cujo valor esteja entre R$50,00 e R$150,00
SELECT * FROM tb_produtos WHERE preco BETWEEN 50 AND 150;

-- 3. Produtos que possuem a letra 'C' no nome
SELECT * FROM tb_produtos WHERE nome LIKE '%C%';

-- 4. INNER JOIN para unir produtos com categorias
SELECT p.id, p.nome AS produto_nome, p.descricao, p.preco, p.validade,
       c.nome AS categoria_nome, c.segmento
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.categoria_id = c.id;

-- 5. INNER JOIN para trazer produtos de categorias específicas (ex: 'Aves' e 'Frutas Tropicais')
SELECT p.id, p.nome AS produto_nome, p.descricao, p.preco, p.validade, c.nome AS categoria_nome
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.categoria_id = c.id
WHERE c.nome IN ('Aves', 'Frutas Tropicais');
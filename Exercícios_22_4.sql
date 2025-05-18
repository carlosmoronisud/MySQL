-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS db_farmacia_bem_estar;
USE db_farmacia_bem_estar;

-- Criação da tabela tb_categorias
CREATE TABLE tb_categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    descricao VARCHAR(255),
    segmento VARCHAR(50) -- por exemplo, 'medicamentos', 'cosméticos', 'suplementos', etc.
);

-- Inserindo 5 categorias
INSERT INTO tb_categorias (nome, descricao, segmento) VALUES
('Medicamentos', 'Remédios prescritos e de venda livre', 'medicamentos'),
('Vitaminas e Suplementos', 'Vitaminas, minerais e suplementos', 'suplementos'),
('Cosméticos', 'Produtos de higiene, beleza e cuidados pessoais', 'cosméticos'),
('Produtos Naturais', 'Remédios fitoterápicos e naturais', 'medicamentos'),
('Higiene Pessoal', 'Produtos de higiene e antissépticos', 'higiene');

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

-- Inserindo 8 registros de produtos relacionados às categorias
INSERT INTO tb_produtos (nome, descricao, preco, validade, categoria_id) VALUES
('Paracetamol 500mg', 'Analgésico e antipirético', 15.00, '2026-12-31', 1),
('Vitaminas C 1000mg', 'Vitaminas com alta concentração de vitamina C', 45.00, '2025-08-15', 2),
('Creme Anti-idade', 'Produto cosmético para cuidados com a pele', 70.00, '2024-11-10', 3),
('Chá de Valeriana', 'Remédio fitoterápico para ansiedade', 25.00, '2026-04-20', 4),
('Antisséptico Bucal', 'Higiene oral e antisséptico', 12.00, '2027-02-14', 5),
('Vitamina D3 2000UI', 'Suplemento de vitamina D', 55.00, '2025-09-01', 2),
('Sabonete Líquido Facial', 'Higiene facial para pele sensível', 35.00, '2026-07-30', 3),
('Loção Repelente', 'Produto para evitar picadas de insetos', 20.00, '2024-10-05', 5);

-- Consultas solicitadas

-- 1. Produtos cujo valor seja maior que R$50,00
SELECT * FROM tb_produtos WHERE preco > 50;

-- 2. Produtos cujo valor esteja entre R$5,00 e R$60,00
SELECT * FROM tb_produtos WHERE preco BETWEEN 5 AND 60;

-- 3. Produtos que possuem a letra 'C' no nome
SELECT * FROM tb_produtos WHERE nome LIKE '%C%';

-- 4. INNER JOIN para unir as tabelas
SELECT p.id, p.nome AS produto_nome, p.descricao, p.preco, p.validade, c.nome AS categoria_nome, c.segmento
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.categoria_id = c.id;

-- 5. INNER JOIN para trazer produtos de uma categoria específica
-- Exemplo: Categoria 'Cosméticos'
SELECT p.id, p.nome AS produto_nome, p.descricao, p.preco, p.validade, c.nome AS categoria_nome
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.categoria_id = c.id
WHERE c.nome = 'Cosméticos';


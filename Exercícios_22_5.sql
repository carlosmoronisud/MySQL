-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS db_pizzaria_legal;
USE db_pizzaria_legal;

-- Criação da tabela tb_categorias
CREATE TABLE tb_categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    descricao VARCHAR(255),
    tipo VARCHAR(50) -- por exemplo, "salgada", "doce", etc.
);

-- Inserindo 5 categorias
INSERT INTO tb_categorias (nome, descricao, tipo) VALUES
('Tradicional', 'Pizzas clássicas e tradicionais', 'salgada'),
('Especialidades', 'Pizzas com ingredientes especiais', 'salgada'),
('Doce', 'Pizzas doces com coberturas variadas', 'doce'),
('Vegana', 'Pizzas sem ingredientes de origem animal', 'salgada'),
('Alta Gastronomia', 'Pizzas gourmet com ingredientes premium', 'salgada');

-- Criação da tabela tb_pizzas
CREATE TABLE tb_pizzas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(255),
    preco DECIMAL(10,2) NOT NULL,
    tamanho VARCHAR(20),
    categoria_id INT,
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

-- Inserindo 8 registros de pizzas (relacionando com as categorias pelo id)
INSERT INTO tb_pizzas (nome, descricao, preco, tamanho, categoria_id) VALUES
('Margherita', 'Pizza com molho de tomate, queijo e manjericão', 40.00, 'Média', 1),
('Calabresa', 'Pizza com calabresa, cebola e queijo', 50.00, 'Grande', 1),
('Frango com Catupiry', 'Pizza com frango, catupiry e queijo', 55.00, 'Grande', 2),
('Quatro Queijos', 'Pizza com quatro tipos de queijo', 65.00, 'Grande', 2),
('Chocolate com Morango', 'Pizza doce com chocolate e morangos', 60.00, 'Pequena', 3),
('Banana com Canela', 'Pizza doce com banana e canela', 45.00, 'Média', 3),
('Vegana Supreme', 'Pizza vegana com legumes variados', 70.00, 'Grande', 4),
('Gourmet Linguine', 'Pizza gourmet com ingredientes premium', 95.00, 'Gigante', 5);

-- Consultas solicitadas

-- 1. Pizzas cujo valor seja maior que R$45,00
SELECT * FROM tb_pizzas WHERE preco > 45;

-- 2. Pizzas cujo valor esteja entre R$50,00 e R$100,00
SELECT * FROM tb_pizzas WHERE preco BETWEEN 50 AND 100;

-- 3. Pizzas que possuem a letra 'M' no nome
SELECT * FROM tb_pizzas WHERE nome LIKE '%M%';

-- 4. INNER JOIN para unir as tabelas
SELECT p.id, p.nome AS pizza_nome, p.descricao, p.preco, p.tamanho, c.nome AS categoria_nome, c.tipo
FROM tb_pizzas p
INNER JOIN tb_categorias c ON p.categoria_id = c.id;

-- 5. INNER JOIN para trazer pizzas de uma categoria específica
-- Exemplo: Categoria 'Doce'
SELECT p.id, p.nome AS pizza_nome, p.descricao, p.preco, p.tamanho, c.nome AS categoria_nome
FROM tb_pizzas p
INNER JOIN tb_categorias c ON p.categoria_id = c.id
WHERE c.nome = 'Doce';


-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS db_construindo_vidas;
USE db_construindo_vidas;

-- Criação da tabela tb_categorias
CREATE TABLE tb_categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    descricao VARCHAR(255),
    setor VARCHAR(50) -- ex: 'Hidráulica', 'Elétrica', 'Ferragens', etc.
);

-- Inserção de 5 categorias
INSERT INTO tb_categorias (nome, descricao, setor) VALUES
('Hidráulica', 'Materiais hidráulicos, canos, torneiras', 'Hidráulica'),
('Elétrica', 'Materiais elétricos, fios, disjuntores', 'Elétrica'),
('Ferragens', 'Ferragens, dobradiças, fechaduras', 'Ferragens'),
('Pintura', 'Tintas, pincéis, solventes', 'Pintura'),
('Ferramentas', 'Ferramentas manuais e elétricas', 'Ferramentas');

-- Criação da tabela tb_produtos
CREATE TABLE tb_produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(255),
    preco DECIMAL(10,2) NOT NULL,
    unidade VARCHAR(20),
    categoria_id INT,
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

-- Inserção de 8 produtos
INSERT INTO tb_produtos (nome, descricao, preco, unidade, categoria_id) VALUES
('Válvula Borboleta', 'Válvula para controle de fluxo hidráulico', 120.00, 'unidade', 1),
('Torneira de Pia', 'Torneira de alta durabilidade', 85.00, 'unidade', 1),
('Fio Elétrico 2.5mm²', 'Fio para instalação elétrica residencial', 30.00, 'metro', 2),
('Disjuntor Residencial', 'Disjuntor 50A para uso residencial', 50.00, 'unidade', 2),
('Parafuso Galvanizado', 'Parafuso para fixação de estruturas', 0.50, 'unidade', 3),
('Dobradiça de Metal', 'Dobradiça para portas e janelas', 10.00, 'unidade', 3),
('Tinta Látex Branca', 'Tinta para parede interna', 150.00, 'lata', 4),
('Pincel de Pintura', 'Pincel de alta qualidade para pintura', 15.00, 'unidade', 4);

-- Consultas

-- 1. Produtos cujo valor seja maior que R$100,00
SELECT * FROM tb_produtos WHERE preco > 100;

-- 2. Produtos cujo valor esteja entre R$70,00 e R$150,00
SELECT * FROM tb_produtos WHERE preco BETWEEN 70 AND 150;

-- 3. Produtos que possuem a letra 'C' no nome
SELECT * FROM tb_produtos WHERE nome LIKE '%C%';

-- 4. INNER JOIN para unir produtos com categorias
SELECT p.id, p.nome AS produto_nome, p.descricao, p.preco, p.unidade,
       c.nome AS categoria_nome, c.setor
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.categoria_id = c.id;

-- 5. INNER JOIN para trazer produtos de uma categoria específica (ex: 'Hidráulica')
SELECT p.id, p.nome AS produto_nome, p.descricao, p.preco, p.unidade, c.nome AS categoria_nome
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.categoria_id = c.id
WHERE c.nome = 'Hidráulica';
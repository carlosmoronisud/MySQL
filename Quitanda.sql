CREATE DATABASE db_quitanda; 
USE db_quitanda;
CREATE TABLE tb_produtos(
id bigint AUTO_INCREMENT,
nome varchar(255) NOT NULL,
quantidade int,
data_validade date,
preco decimal,
PRIMARY KEY (id)
);
 
INSERT INTO tb_produtos(nome, quantidade, data_validade, preco)
VALUES("Banana", 1000, "2025-06-12", 12.49);
 
SELECT * FROM tb_produtos;
 
INSERT INTO tb_produtos(nome, quantidade, data_validade, preco)
VALUES("Maçã", 1500, "2025-06-12", 10.00),
      ("Cenoura", 2000, "2025-07-15", 12.50),
      ("Alface", 3500, "2025-06-19", 4.00);
SELECT nome, preco FROM tb_produtos;
 
ALTER TABLE tb_produtos MODIFY preco decimal(6, 2);

UPDATE tb_produtos SET preco = 12.49 where  ID = 1;

ALTER TABLE tb_produtos ADD descricao 

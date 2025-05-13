-- 1. Criação do banco de dados
CREATE DATABASE escola;
USE escola;

-- 2. Criação da tabela de estudantes
CREATE TABLE estudantes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    matricula VARCHAR(20) UNIQUE,
    curso VARCHAR(100),
    nota_final DECIMAL(4, 2),
    data_matricula DATE
);

-- 3. Inserção de 8 registros
INSERT INTO estudantes (nome, matricula, curso, nota_final, data_matricula)
VALUES 
('Lucas Andrade', '2023001', 'Engenharia de Software', 8.5, '2023-02-01'),
('Ana Beatriz', '2023002', 'Administração', 6.9, '2023-02-01'),
('Carlos Eduardo', '2023003', 'Direito', 7.2, '2023-02-01'),
('Fernanda Lima', '2023004', 'Psicologia', 9.0, '2023-02-01'),
('João Pedro', '2023005', 'História', 5.8, '2023-02-01'),
('Marina Souza', '2023006', 'Engenharia Civil', 6.5, '2023-02-01'),
('Rafael Martins', '2023007', 'Design Gráfico', 7.8, '2023-02-01'),
('Isabela Torres', '2023008', 'Ciências Contábeis', 8.0, '2023-02-01');

-- 4. SELECT - Estudantes com nota MAIOR que 7.0
SELECT * FROM estudantes
WHERE nota_final > 7.0;

-- 5. SELECT - Estudantes com nota MENOR que 7.0
SELECT * FROM estudantes
WHERE nota_final < 7.0;

-- 6. Atualização de um registro (atualizar a nota da Ana Beatriz)
UPDATE estudantes
SET nota_final = 7.1
WHERE nome = 'Ana Beatriz';

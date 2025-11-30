-- =======================================================
-- Script de Inserção de Dados - Clientes e Analistas
-- Pipeline de Entregas de Apresentações Analíticas
-- =======================================================

-- Inserção dos Clientes
INSERT INTO Cliente (id_cliente, nome_cliente, id_equipe_facing) VALUES
(1, 'Magazine Luiza', 1),
(2, 'Carrefour Brasil', 1),
(3, 'Via Varejo', 1),
(4, 'Microsoft Brasil', 2),
(5, 'Google Brasil', 2),
(6, 'IBM Brasil', 2),
(7, 'Hospital Albert Einstein', 3),
(8, 'Rede D\'Or', 3),
(9, 'Hapvida', 3),
(10, 'Banco do Brasil', 4),
(11, 'Itaú Unibanco', 4),
(12, 'Bradesco', 4),
(13, 'Prefeitura de São Paulo', 5),
(14, 'Governo do Estado RJ', 5),
(15, 'Ministério da Saúde', 5);

-- Inserção dos Analistas
INSERT INTO Analista (id_analista, nome_analista, senioridade_analista, id_gestor) VALUES
(1, 'Carlos Eduardo Silva', 'Sênior', 1),
(2, 'Mariana Santos Costa', 'Pleno', 1),
(3, 'Rafael Oliveira Lima', 'Júnior', 1),
(4, 'Juliana Ferreira Souza', 'Especialista', 2),
(5, 'Bruno Henrique Alves', 'Sênior', 2),
(6, 'Camila Rodrigues Martins', 'Pleno', 2),
(7, 'Diego Pereira Santos', 'Júnior', 2),
(8, 'Letícia Gomes Silva', 'Sênior', 3),
(9, 'André Luiz Costa', 'Pleno', 3),
(10, 'Patrícia Moura Ribeiro', 'Júnior', 3),
(11, 'Gabriel Santos Lima', 'Especialista', 4),
(12, 'Natália Oliveira Cruz', 'Sênior', 4),
(13, 'Lucas Ferreira Almeida', 'Pleno', 4),
(14, 'Renata Silva Barbosa', 'Júnior', 5),
(15, 'Thiago Mendes Costa', 'Sênior', 5);

-- =======================================================
-- DADOS INSERIDOS:
-- 
-- 15 Clientes distribuídos entre as 5 equipes por setor
-- 15 Analistas com diferentes níveis de senioridade
-- Distribuição equilibrada de analistas por gestor (3 cada)
-- =======================================================
-- =======================================================
-- Script de Inserção de Dados - Equipes e Gestores
-- Pipeline de Entregas de Apresentações Analíticas
-- =======================================================

-- Inserção das Equipes de Cliente Facing
INSERT INTO Equipe_Facing (id_equipe_facing, nome_equipe) VALUES
(1, 'Equipe Varejo'),
(2, 'Equipe Tecnologia'),
(3, 'Equipe Saúde'),
(4, 'Equipe Financeiro'),
(5, 'Equipe Governo');

-- Inserção dos Gestores
INSERT INTO Gestor (id_gestor, nome_gestor) VALUES
(1, 'Maria Silva Santos'),
(2, 'João Pedro Oliveira'),
(3, 'Ana Carolina Lima'),
(4, 'Roberto Carlos Mendes'),
(5, 'Fernanda Costa Ribeiro');

-- =======================================================
-- DADOS INSERIDOS:
-- 
-- 5 Equipes de Cliente Facing especializadas por setor
-- 5 Gestores responsáveis pela coordenação das equipes
-- =======================================================
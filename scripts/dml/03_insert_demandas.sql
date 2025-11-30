-- =======================================================
-- Script de Inserção de Dados - Demandas
-- Pipeline de Entregas de Apresentações Analíticas
-- =======================================================

-- Inserção das Demandas
INSERT INTO Demanda (id_demanda, tipo_demanda, complexidade, inicio_programado, inicio_real, 
                     entrega_programada, entrega_real, status, nota, comentarios_feedback, 
                     briefing_detalhado, id_cliente, id_gestor, id_analista) VALUES

-- Demandas Concluídas
(1, 'Análise de Satisfação', 'Média', '2024-10-01', '2024-10-01', '2024-10-15', '2024-10-14', 
 'Concluído', 4.2, 'Excelente análise, insights muito úteis para estratégia', 
 'Análise completa de satisfação do cliente com foco em NPS e drivers de satisfação', 1, 1, 1),

(2, 'Segmentação de Mercado', 'Alta', '2024-10-05', '2024-10-06', '2024-10-25', '2024-10-23', 
 'Concluído', 4.6, 'Superou expectativas, segmentação muito precisa', 
 'Segmentação de clientes B2C com base em comportamento de compra e perfil demográfico', 4, 2, 4),

(3, 'Análise de Churn', 'Alta', '2024-10-10', '2024-10-10', '2024-10-30', '2024-11-02', 
 'Concluído', 3.9, 'Boa análise, mas poderia ter mais detalhes sobre ações recomendadas', 
 'Identificação de padrões de churn e desenvolvimento de modelo preditivo', 7, 3, 8),

(4, 'Pesquisa de Brand Awareness', 'Baixa', '2024-10-15', '2024-10-15', '2024-10-22', '2024-10-21', 
 'Concluído', 4.0, 'Análise sólida dentro do prazo esperado', 
 'Medição de conhecimento de marca e posicionamento no mercado', 10, 4, 11),

(5, 'Análise Competitiva', 'Média', '2024-10-20', '2024-10-21', '2024-11-05', '2024-11-04', 
 'Concluído', 4.3, 'Muito bom benchmark competitivo, dados relevantes', 
 'Comparativo detalhado com principais concorrentes do setor', 13, 5, 14),

-- Demandas Em Andamento
(6, 'Análise de Jornada do Cliente', 'Alta', '2024-11-01', '2024-11-01', '2024-11-25', NULL, 
 'Em Andamento', NULL, NULL, 
 'Mapeamento completo da jornada do cliente digital e offline', 2, 1, 2),

(7, 'Pesquisa de Usabilidade', 'Média', '2024-11-05', '2024-11-06', '2024-11-20', NULL, 
 'Em Andamento', NULL, NULL, 
 'Teste de usabilidade de nova plataforma mobile com foco em UX', 5, 2, 5),

(8, 'Análise de Precificação', 'Alta', '2024-11-10', '2024-11-10', '2024-12-05', NULL, 
 'Em Andamento', NULL, NULL, 
 'Estudo de elasticidade de preços e otimização de pricing strategy', 8, 3, 9),

-- Demandas Em Revisão
(9, 'Análise de Tendências', 'Média', '2024-11-08', '2024-11-08', '2024-11-22', '2024-11-20', 
 'Em Revisão', NULL, NULL, 
 'Identificação de tendências emergentes no setor de tecnologia', 6, 2, 6),

(10, 'Pesquisa de Mercado', 'Baixa', '2024-11-12', '2024-11-12', '2024-11-26', '2024-11-25', 
 'Em Revisão', NULL, NULL, 
 'Análise de potencial de mercado para novo produto financeiro', 11, 4, 12),

-- Demandas Planejadas
(11, 'Análise de Retenção', 'Alta', '2024-12-01', NULL, '2024-12-20', NULL, 
 'Planejado', NULL, NULL, 
 'Estudo aprofundado de fatores de retenção de clientes healthcare', 9, 3, 10),

(12, 'Segmentação B2B', 'Média', '2024-12-05', NULL, '2024-12-19', NULL, 
 'Planejado', NULL, NULL, 
 'Segmentação de empresas clientes para estratégia comercial direcionada', 12, 4, 13),

(13, 'Análise de Performance Digital', 'Baixa', '2024-12-10', NULL, '2024-12-20', NULL, 
 'Planejado', NULL, NULL, 
 'Análise de métricas de performance de canais digitais governamentais', 15, 5, 15),

-- Demanda Cancelada
(14, 'Pesquisa de Inovação', 'Média', '2024-11-15', NULL, '2024-12-01', NULL, 
 'Cancelado', NULL, 'Projeto cancelado devido a mudança de prioridades do cliente', 
 'Estudo sobre tendências de inovação no varejo físico', 3, 1, 3),

-- Demandas Adicionais Em Andamento
(15, 'Análise de Cross-selling', 'Alta', '2024-11-18', '2024-11-18', '2024-12-10', NULL, 
 'Em Andamento', NULL, NULL, 
 'Identificação de oportunidades de venda cruzada baseada em dados transacionais', 14, 5, 14);

-- =======================================================
-- DADOS INSERIDOS:
-- 
-- 15 Demandas com diferentes status e tipos
-- Distribuição realista de status do pipeline
-- Notas apenas para demandas concluídas
-- Datas coerentes com cronograma de projetos
-- =======================================================
-- =======================================================
-- Script de Comandos UPDATE - Atualizações no Pipeline
-- Pipeline de Entregas de Apresentações Analíticas
-- =======================================================

-- UPDATE 1: Finalizar demanda em revisão com nota e feedback
-- Cenário: Demanda ID 9 (Análise de Tendências) foi aprovada pelo client facing
UPDATE Demanda 
SET 
    status = 'Concluído',
    nota = 4.1,
    comentarios_feedback = 'Análise de tendências muito bem estruturada, insights valiosos para roadmap de produto'
WHERE id_demanda = 9 AND status = 'Em Revisão';

-- UPDATE 2: Iniciar demanda planejada
-- Cenário: Demanda ID 11 (Análise de Retenção) teve início antecipado
UPDATE Demanda 
SET 
    status = 'Em Andamento',
    inicio_real = '2024-11-25'
WHERE id_demanda = 11 AND status = 'Planejado';

-- UPDATE 3: Reasignar analista por sobrecarga de trabalho  
-- Cenário: Analista Carlos (ID 1) está sobrecarregado, transferir demanda para Mariana (ID 2)
UPDATE Demanda 
SET 
    id_analista = 2,
    comentarios_feedback = 'Demanda reasignada devido a sobrecarga de trabalho do analista original'
WHERE id_demanda = 6 AND id_analista = 1;

-- UPDATE 4: Atualizar prazo de entrega devido a mudança de escopo
-- Cenário: Cliente solicitou ampliação do escopo da demanda ID 7
UPDATE Demanda 
SET 
    entrega_programada = '2024-12-05',
    briefing_detalhado = 'Teste de usabilidade de nova plataforma mobile com foco em UX - ESCOPO AMPLIADO: incluir testes A/B e análise de heatmap'
WHERE id_demanda = 7;

-- UPDATE 5: Finalizar demanda em revisão com nota baixa
-- Cenário: Demanda ID 10 foi finalizada mas precisa de melhorias
UPDATE Demanda 
SET 
    status = 'Concluído',
    nota = 3.2,
    comentarios_feedback = 'Análise adequada mas faltaram detalhes metodológicos. Recomenda-se maior aprofundamento em pesquisas futuras.'
WHERE id_demanda = 10 AND status = 'Em Revisão';

-- UPDATE 6: Promover analista júnior para pleno
-- Cenário: Rafael Oliveira demonstrou evolução e será promovido
UPDATE Analista 
SET senioridade_analista = 'Pleno'
WHERE id_analista = 3 AND nome_analista = 'Rafael Oliveira Lima';

-- =======================================================
-- DESCRIÇÃO DOS UPDATES:
-- 
-- 1-2: Gestão do pipeline - mudanças de status e início de demandas
-- 3: Realocação de recursos por sobrecarga  
-- 4: Ajuste de prazos por mudança de escopo
-- 5: Finalização com avaliação de qualidade
-- 6: Gestão de pessoas - promoção de analista
-- =======================================================
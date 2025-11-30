-- =======================================================
-- Script de Consultas SELECT - Relatórios e Análises
-- Pipeline de Entregas de Apresentações Analíticas
-- =======================================================

-- CONSULTA 1: Dashboard Geral do Pipeline
-- Mostra visão geral das demandas por status com contadores
SELECT 
    d.status,
    COUNT(*) as total_demandas,
    AVG(d.nota) as nota_media,
    COUNT(CASE WHEN d.entrega_real <= d.entrega_programada THEN 1 END) as entregas_no_prazo,
    COUNT(CASE WHEN d.entrega_real > d.entrega_programada THEN 1 END) as entregas_atrasadas
FROM Demanda d
GROUP BY d.status
ORDER BY 
    CASE d.status 
        WHEN 'Em Andamento' THEN 1
        WHEN 'Em Revisão' THEN 2  
        WHEN 'Planejado' THEN 3
        WHEN 'Concluído' THEN 4
        WHEN 'Cancelado' THEN 5
    END;

-- =======================================================

-- CONSULTA 2: Performance dos Analistas (Produtividade e Qualidade)
-- Ranking de analistas baseado em produtividade e qualidade das entregas
SELECT 
    a.nome_analista,
    a.senioridade_analista,
    g.nome_gestor,
    COUNT(d.id_demanda) as total_demandas,
    COUNT(CASE WHEN d.status = 'Concluído' THEN 1 END) as demandas_concluidas,
    AVG(CASE WHEN d.status = 'Concluído' THEN d.nota END) as nota_media,
    ROUND(
        COUNT(CASE WHEN d.status = 'Concluído' THEN 1 END) * 100.0 / 
        NULLIF(COUNT(d.id_demanda), 0), 2
    ) as taxa_conclusao_percent
FROM Analista a
LEFT JOIN Gestor g ON a.id_gestor = g.id_gestor
LEFT JOIN Demanda d ON a.id_analista = d.id_analista
GROUP BY a.id_analista, a.nome_analista, a.senioridade_analista, g.nome_gestor
ORDER BY demandas_concluidas DESC, nota_media DESC;

-- =======================================================

-- CONSULTA 3: Análise de Demandas por Cliente e Setor
-- Mostra performance das entregas agrupadas por equipe e cliente
SELECT 
    ef.nome_equipe,
    c.nome_cliente,
    COUNT(d.id_demanda) as total_demandas,
    AVG(CASE WHEN d.status = 'Concluído' THEN d.nota END) as nota_media_cliente,
    COUNT(CASE WHEN d.complexidade = 'Alta' THEN 1 END) as demandas_alta_complexidade,
    COUNT(CASE WHEN d.complexidade = 'Média' THEN 1 END) as demandas_media_complexidade,
    COUNT(CASE WHEN d.complexidade = 'Baixa' THEN 1 END) as demandas_baixa_complexidade
FROM Equipe_Facing ef
INNER JOIN Cliente c ON ef.id_equipe_facing = c.id_equipe_facing
LEFT JOIN Demanda d ON c.id_cliente = d.id_cliente
GROUP BY ef.id_equipe_facing, ef.nome_equipe, c.id_cliente, c.nome_cliente
HAVING COUNT(d.id_demanda) > 0
ORDER BY ef.nome_equipe, total_demandas DESC;

-- =======================================================

-- CONSULTA 4: Análise de Atrasos e SLA
-- Identifica demandas com problemas de prazo e padrões de atraso
SELECT 
    d.tipo_demanda,
    d.complexidade,
    c.nome_cliente,
    a.nome_analista,
    a.senioridade_analista,
    d.entrega_programada,
    d.entrega_real,
    CASE 
        WHEN d.entrega_real IS NULL AND d.entrega_programada < CURRENT_DATE 
        THEN DATEDIFF(CURRENT_DATE, d.entrega_programada)
        WHEN d.entrega_real > d.entrega_programada 
        THEN DATEDIFF(d.entrega_real, d.entrega_programada)
        ELSE 0
    END as dias_atraso,
    d.status,
    d.nota
FROM Demanda d
INNER JOIN Cliente c ON d.id_cliente = c.id_cliente
LEFT JOIN Analista a ON d.id_analista = a.id_analista
WHERE 
    -- Demandas atrasadas ou que perderam prazo
    (d.entrega_real > d.entrega_programada) 
    OR (d.entrega_real IS NULL AND d.entrega_programada < CURRENT_DATE AND d.status != 'Cancelado')
ORDER BY dias_atraso DESC, d.entrega_programada;

-- =======================================================

-- CONSULTA 5: Top 5 Melhores Entregas por Nota
-- Lista as melhores entregas para identificar boas práticas
SELECT 
    d.tipo_demanda,
    c.nome_cliente,
    a.nome_analista,
    g.nome_gestor,
    d.complexidade,
    d.nota,
    d.comentarios_feedback,
    DATEDIFF(d.entrega_real, d.inicio_real) as dias_execucao,
    CASE 
        WHEN d.entrega_real <= d.entrega_programada THEN 'No Prazo'
        ELSE 'Atrasado'
    END as cumprimento_prazo
FROM Demanda d
INNER JOIN Cliente c ON d.id_cliente = c.id_cliente
INNER JOIN Analista a ON d.id_analista = a.id_analista
INNER JOIN Gestor g ON d.id_gestor = g.id_gestor
WHERE d.status = 'Concluído' AND d.nota IS NOT NULL
ORDER BY d.nota DESC, dias_execucao ASC
LIMIT 5;

-- =======================================================
-- DESCRIÇÃO DAS CONSULTAS:
-- 
-- 1. Dashboard: Visão executiva do pipeline com métricas gerais
-- 2. Performance: Ranking de produtividade dos analistas
-- 3. Clientes: Análise por setor e tipo de demanda
-- 4. SLA: Monitoramento de atrasos e cumprimento de prazos  
-- 5. Benchmarks: Identificação de melhores práticas
-- =======================================================
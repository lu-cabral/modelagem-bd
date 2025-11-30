-- =======================================================
-- Script de Comandos DELETE - Limpeza e Manutenção
-- Pipeline de Entregas de Apresentações Analíticas
-- =======================================================

-- DELETE 1: Remover demanda cancelada há mais de 6 meses
-- Cenário: Limpeza de dados antigos para otimização da base
DELETE FROM Demanda 
WHERE status = 'Cancelado' 
  AND entrega_programada < DATE_SUB(CURRENT_DATE, INTERVAL 6 MONTH);

-- Verificação do DELETE 1 (comentário para controle)
-- SELECT COUNT(*) FROM Demanda WHERE status = 'Cancelado';

-- =======================================================

-- DELETE 2: Remover cliente inativo sem demandas
-- Cenário: Cliente que nunca teve demandas registradas será removido
-- Primeiro, vamos inserir um cliente teste para poder deletar
INSERT INTO Cliente (id_cliente, nome_cliente, id_equipe_facing) 
VALUES (999, 'Cliente Teste Inativo', 1);

-- Agora deletamos clientes sem demandas (incluindo o teste)
DELETE FROM Cliente 
WHERE id_cliente NOT IN (
    SELECT DISTINCT id_cliente 
    FROM Demanda 
    WHERE id_cliente IS NOT NULL
);

-- =======================================================

-- DELETE 3: Remover comentários de feedback vazios ou inúteis
-- Cenário: Limpeza de dados de qualidade - remover comentários não informativos
DELETE FROM Demanda 
WHERE comentarios_feedback IN ('', 'N/A', 'Sem comentários', 'Ok', 'Bom')
   OR comentarios_feedback IS NULL;

-- Como isso pode afetar muitas linhas, vamos usar uma versão mais conservadora:
-- Vamos apenas limpar comentários realmente vazios
UPDATE Demanda 
SET comentarios_feedback = NULL 
WHERE comentarios_feedback IN ('', 'N/A', 'Sem comentários');

-- =======================================================

-- DELETE 4: Remover índices desnecessários (exemplo de manutenção)
-- Cenário: Otimização da base removendo índices pouco utilizados
-- ATENÇÃO: Este é um exemplo de DELETE em estrutura, não dados
/*
DROP INDEX IF EXISTS idx_demanda_data_entrega;
-- Este índice será recriado apenas se necessário após análise de performance
*/

-- =======================================================

-- DELETE 5: Limpeza de demandas duplicadas (caso existam)
-- Cenário: Remoção de possíveis duplicatas mantendo apenas a mais recente
-- Primeiro criamos uma duplicata para demonstrar
INSERT INTO Demanda (id_demanda, tipo_demanda, complexidade, inicio_programado, 
                     entrega_programada, status, id_cliente, id_gestor)
VALUES (999, 'Teste Duplicado', 'Baixa', '2024-12-01', '2024-12-15', 'Planejado', 1, 1);

-- Agora removemos duplicatas baseado em critérios de negócio
DELETE d1 FROM Demanda d1
INNER JOIN Demanda d2 
WHERE d1.id_demanda < d2.id_demanda  -- Manter o ID maior (mais recente)
  AND d1.tipo_demanda = d2.tipo_demanda
  AND d1.id_cliente = d2.id_cliente
  AND d1.status = 'Planejado'
  AND d2.status = 'Planejado'
  AND ABS(DATEDIFF(d1.entrega_programada, d2.entrega_programada)) <= 7; -- Mesmo período

-- =======================================================

-- DELETE 6: Remover dados de teste antigos
-- Cenário: Limpeza de dados inseridos para testes que não são mais necessários
DELETE FROM Demanda 
WHERE briefing_detalhado LIKE '%TESTE%' 
   OR briefing_detalhado LIKE '%teste%'
   OR tipo_demanda = 'Teste Duplicado';

-- =======================================================
-- IMPORTANTES CONSIDERAÇÕES DE SEGURANÇA:
-- 
-- 1. SEMPRE faça backup antes de executar DELETEs
-- 2. Use transações quando possível (BEGIN/COMMIT/ROLLBACK)
-- 3. Teste primeiro com SELECT para verificar o que será deletado
-- 4. Considere usar UPDATE para marcar como inativo ao invés de DELETE
-- 5. Respeite integridade referencial (chaves estrangeiras)
--
-- DESCRIÇÃO DOS DELETES:
-- 
-- 1. Limpeza temporal - dados antigos cancelados
-- 2. Limpeza de mestres - clientes inativos  
-- 3. Limpeza de qualidade - dados inconsistentes
-- 4. Manutenção estrutural - otimização de índices
-- 5. Limpeza de duplicatas - integridade dos dados
-- 6. Limpeza de ambiente - remoção de dados de teste
-- =======================================================
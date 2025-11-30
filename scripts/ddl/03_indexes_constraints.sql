-- =======================================================
-- Script de Índices e Constraints Adicionais
-- Pipeline de Entregas de Apresentações Analíticas
-- =======================================================

-- Índices para otimizar consultas frequentes
CREATE INDEX idx_cliente_equipe ON Cliente(id_equipe_facing);
CREATE INDEX idx_analista_gestor ON Analista(id_gestor);
CREATE INDEX idx_demanda_cliente ON Demanda(id_cliente);
CREATE INDEX idx_demanda_gestor ON Demanda(id_gestor);
CREATE INDEX idx_demanda_analista ON Demanda(id_analista);
CREATE INDEX idx_demanda_status ON Demanda(status);
CREATE INDEX idx_demanda_data_entrega ON Demanda(entrega_programada);

-- Constraints de validação
ALTER TABLE Demanda 
ADD CONSTRAINT chk_complexidade 
CHECK (complexidade IN ('Baixa', 'Média', 'Alta'));

ALTER TABLE Demanda 
ADD CONSTRAINT chk_status 
CHECK (status IN ('Planejado', 'Em Andamento', 'Em Revisão', 'Concluído', 'Cancelado'));

ALTER TABLE Demanda 
ADD CONSTRAINT chk_nota 
CHECK (nota >= 0 AND nota <= 5);

ALTER TABLE Analista 
ADD CONSTRAINT chk_senioridade 
CHECK (senioridade_analista IN ('Júnior', 'Pleno', 'Sênior', 'Especialista'));

-- =======================================================
-- COMENTÁRIOS SOBRE ÍNDICES E CONSTRAINTS:
-- 
-- Índices: Melhoram performance de consultas por relacionamentos
-- Constraints: Garantem integridade dos dados com valores válidos
-- =======================================================
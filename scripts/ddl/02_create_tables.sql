-- =======================================================
-- Script de Criação das Tabelas
-- Pipeline de Entregas de Apresentações Analíticas
-- =======================================================

-- Tabela: Equipe_Facing
-- Responsável por gerenciar os times de atendimento ao cliente
CREATE TABLE Equipe_Facing (
    id_equipe_facing INT NOT NULL PRIMARY KEY,
    nome_equipe VARCHAR(100) NOT NULL
);

-- Tabela: Cliente
-- Armazena informações dos clientes da empresa
CREATE TABLE Cliente (
    id_cliente INT NOT NULL PRIMARY KEY,
    nome_cliente VARCHAR(100) NOT NULL,
    id_equipe_facing INT NOT NULL,
    FOREIGN KEY (id_equipe_facing) REFERENCES Equipe_Facing(id_equipe_facing)
);

-- Tabela: Gestor
-- Armazena informações dos gestores responsáveis pelas equipes
CREATE TABLE Gestor (
    id_gestor INT NOT NULL PRIMARY KEY,
    nome_gestor VARCHAR(100) NOT NULL
);

-- Tabela: Analista
-- Armazena informações dos analistas de dados
CREATE TABLE Analista (
    id_analista INT NOT NULL PRIMARY KEY,
    nome_analista VARCHAR(100) NOT NULL,
    senioridade_analista VARCHAR(50) NOT NULL,
    id_gestor INT NOT NULL,
    FOREIGN KEY (id_gestor) REFERENCES Gestor(id_gestor)
);

-- Tabela: Demanda
-- Controla todas as demandas/projetos do pipeline
CREATE TABLE Demanda (
    id_demanda INT NOT NULL PRIMARY KEY,
    tipo_demanda VARCHAR(50) NOT NULL,
    complexidade VARCHAR(20),
    inicio_programado DATE,
    inicio_real DATE,
    entrega_programada DATE,
    entrega_real DATE,
    status VARCHAR(30),
    nota DECIMAL(2,1), -- Permite notas de 0.0 a 5.0
    comentarios_feedback TEXT,
    briefing_detalhado TEXT,
    id_cliente INT NOT NULL,
    id_gestor INT NOT NULL,
    id_analista INT,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_gestor) REFERENCES Gestor(id_gestor),
    FOREIGN KEY (id_analista) REFERENCES Analista(id_analista)
);

-- =======================================================
-- COMENTÁRIOS SOBRE AS TABELAS:
-- 
-- 1. Equipe_Facing: Representa os times de atendimento
-- 2. Cliente: Cada cliente pertence a uma equipe de atendimento
-- 3. Gestor: Responsáveis pela gestão dos analistas e demandas
-- 4. Analista: Executores das análises, subordinados aos gestores
-- 5. Demanda: Centro do sistema, controla todo o pipeline
-- =======================================================
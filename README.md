# 📊 Pipeline de Entregas de Apresentações Analíticas

Sistema de banco de dados para gerenciamento do pipeline de entregas de análises de uma empresa de pesquisa de consumo, permitindo alocação eficiente de analistas e monitoramento de indicadores de qualidade.

## 🎯 Objetivo do Projeto

Desenvolver um sistema completo de banco de dados relacional que permita:
- Gerenciar o pipeline de entregas de análises para clientes
- Alocar analistas conforme complexidade e volume de trabalho  
- Monitorar indicadores de eficiência e qualidade das entregas
- Controlar SLAs e prazos de entrega

## 👥 Principais Atores

- **Gestor da Equipe**: Administra recursos, organiza pipeline, distribui demandas
- **Analista de Dados**: Executa análises e mantém registro de andamento  
- **Client Facing**: Avalia entregas e registra notas de qualidade (escala 0-5)

## 📋 Estrutura do Banco de Dados

### Entidades Principais

1. **Equipe_Facing**: Times de atendimento especializados por setor
2. **Cliente**: Empresas que contratam as análises
3. **Gestor**: Responsáveis pela coordenação das equipes
4. **Analista**: Executores das análises com diferentes níveis de senioridade
5. **Demanda**: Centro do sistema - controla todo o pipeline de entregas

### Relacionamentos

- Cliente ↔ Demanda (1:N) 
- Gestor ↔ Demanda (1:N)
- Analista ↔ Demanda (1:N)
- Gestor ↔ Analista (1:N) 
- Equipe_Facing ↔ Cliente (1:N)

## 🗂️ Estrutura de Arquivos

```
pipeline-analytics-db/
├── scripts/
│   ├── ddl/
│   │   ├── 01_create_database.sql
│   │   ├── 02_create_tables.sql
│   │   └── 03_indexes_constraints.sql
│   └── dml/
│       ├── 01_insert_equipes_gestores.sql
│       ├── 02_insert_clientes_analistas.sql
│       ├── 03_insert_demandas.sql
│       ├── 04_consultas_select.sql
│       ├── 05_comandos_update.sql
│       └── 06_comandos_delete.sql
└── README.md
```

## Como Executar

### Pré-requisitos

- MySQL 8.0+ ou PostgreSQL 12+
- MySQL Workbench ou PGAdmin
- Acesso administrativo ao servidor de banco

### Passo a Passo

1. **Preparação do Ambiente**
   ```sql
   -- Execute primeiro (ajuste conforme seu SGBD)
   source scripts/ddl/01_create_database.sql
   ```

2. **Criação das Estruturas**
   ```sql
   -- Execute na sequência:
   source scripts/ddl/02_create_tables.sql
   source scripts/ddl/03_indexes_constraints.sql
   ```

3. **Carga de Dados**
   ```sql
   -- Execute na ordem:
   source scripts/dml/01_insert_equipes_gestores.sql
   source scripts/dml/02_insert_clientes_analistas.sql  
   source scripts/dml/03_insert_demandas.sql
   ```

4. **Testes e Consultas**
   ```sql
   -- Execute para validar:
   source scripts/dml/04_consultas_select.sql
   source scripts/dml/05_comandos_update.sql
   source scripts/dml/06_comandos_delete.sql
   ```

### Execução Automática
```bash
# MySQL
mysql -u usuario -p < scripts/ddl/01_create_database.sql
mysql -u usuario -p pipeline_analytics < scripts/ddl/02_create_tables.sql
# ... continue com os demais scripts

# PostgreSQL  
psql -U usuario -d postgres -f scripts/ddl/01_create_database.sql
psql -U usuario -d pipeline_analytics -f scripts/ddl/02_create_tables.sql
# ... continue com os demais scripts
```

## 📊 Scripts Principais

### DDL (Data Definition Language)
- **01_create_database.sql**: Criação do banco de dados
- **02_create_tables.sql**: Criação de todas as tabelas
- **03_indexes_constraints.sql**: Índices e restrições de integridade

### DML (Data Manipulation Language)  
- **01-03_insert_*.sql**: Carga inicial com dados realísticos
- **04_consultas_select.sql**: 5 consultas avançadas com JOINs, agregações
- **05_comandos_update.sql**: 6 comandos UPDATE para diferentes cenários
- **06_comandos_delete.sql**: 6 comandos DELETE seguros com validações

## 🔍 Consultas Destacadas

1. **Dashboard Geral**: Visão executiva do pipeline com métricas de status
2. **Performance de Analistas**: Ranking de produtividade e qualidade
3. **Análise por Cliente/Setor**: Distribuição de demandas por equipe  
4. **Monitoramento de SLA**: Identificação de atrasos e problemas de prazo
5. **Benchmarks de Qualidade**: Top 5 melhores entregas

## ⚠️ Considerações Importantes

### Segurança
- **SEMPRE** faça backup antes de executar comandos UPDATE/DELETE
- Use transações quando possível (`BEGIN`/`COMMIT`/`ROLLBACK`)
- Teste primeiro com `SELECT` para verificar dados afetados

### Performance
- Índices otimizados para consultas frequentes
- Constraints garantem integridade dos dados
- Queries documentadas com planos de execução considerados

### Adaptação para SGBDs
- Scripts compatíveis com MySQL e PostgreSQL
- Ajuste tipos de dados conforme necessário (`AUTO_INCREMENT` vs `SERIAL`)
- Syntax específica comentada onde aplicável

## 📈 Indicadores do Sistema

- **Taxa de Conclusão**: % demandas finalizadas no prazo
- **Nota Média de Qualidade**: Avaliação client facing (0-5)
- **Distribuição por Complexidade**: Balanceamento da carga
- **Performance por Senioridade**: Eficiência dos níveis
- **SLA por Tipo de Demanda**: Cumprimento de prazos

## 🛠️ Tecnologias Utilizadas

- **Banco de Dados**: MySQL 8.0 / PostgreSQL 12+
- **Ferramentas**: MySQL Workbench / PGAdmin
- **Versionamento**: Git / GitHub
- **Documentação**: Markdown

## 👨‍💼 Autor

Desenvolvido como projeto acadêmico para a disciplina de **Modelagem de Banco de Dados**.

**Entrega 4**: Implementação SQL completa com DDL, DML e casos de uso reais.

---

## 📝 Licença

Este projeto é destinado exclusivamente para fins acadêmicos.

---

**🔗 Links Úteis**
- [Documentação MySQL](https://dev.mysql.com/doc/)
- [Documentação PostgreSQL](https://www.postgresql.org/docs/)
- [SQL Tutorial W3Schools](https://www.w3schools.com/sql/)

---

*Última atualização: Novembro 2024*
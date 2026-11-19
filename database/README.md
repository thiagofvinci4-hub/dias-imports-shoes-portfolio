# Exercícios PostgreSQL

Estes scripts são para prática e portfólio. O módulo web atual da Dias Imports Shoes usa SQLite; os exemplos abaixo são independentes e não migram nem alteram o banco da loja.

- `postgresql/01_tabela_aluno.sql`: tabela simples com chave primária, `NOT NULL`, `UNIQUE`, inserção e consulta.
- `postgresql/02_modelo_loja_tenis.sql`: exemplo relacional de loja com chaves estrangeiras, restrições e relacionamento entre pedidos e produtos.

Execute em uma base de testes no pgAdmin. O segundo script é um modelo didático, não o esquema usado em produção.

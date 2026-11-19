-- Exercício introdutório de criação de tabela no PostgreSQL
CREATE TABLE IF NOT EXISTS aluno (
    codigoaluno INTEGER PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE,
    data_nascimento DATE
);

INSERT INTO aluno (codigoaluno, nome, email, data_nascimento)
VALUES (1, 'Aluno Exemplo', 'aluno.exemplo@example.com', DATE '2000-01-01')
ON CONFLICT (codigoaluno) DO NOTHING;

SELECT * FROM aluno;

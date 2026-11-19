-- Modelo didático PostgreSQL para uma loja de tênis.
-- Não é o banco usado pela versão web atual, que utiliza SQLite.

CREATE TABLE IF NOT EXISTS categorias (
    categoria_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome VARCHAR(80) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS produtos (
    produto_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    categoria_id INTEGER NOT NULL REFERENCES categorias(categoria_id),
    nome VARCHAR(140) NOT NULL,
    marca VARCHAR(80) NOT NULL,
    descricao TEXT,
    ativo BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS variantes_produto (
    variante_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    produto_id INTEGER NOT NULL REFERENCES produtos(produto_id) ON DELETE CASCADE,
    tamanho SMALLINT NOT NULL CHECK (tamanho BETWEEN 20 AND 55),
    cor VARCHAR(60) NOT NULL,
    sku VARCHAR(50) NOT NULL UNIQUE,
    preco NUMERIC(10,2) NOT NULL CHECK (preco >= 0),
    estoque INTEGER NOT NULL DEFAULT 0 CHECK (estoque >= 0),
    UNIQUE (produto_id, tamanho, cor)
);

CREATE TABLE IF NOT EXISTS clientes (
    cliente_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome VARCHAR(120) NOT NULL,
    email VARCHAR(160) NOT NULL UNIQUE,
    telefone VARCHAR(24)
);

CREATE TABLE IF NOT EXISTS pedidos (
    pedido_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    cliente_id INTEGER NOT NULL REFERENCES clientes(cliente_id),
    criado_em TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(24) NOT NULL DEFAULT 'recebido',
    total NUMERIC(10,2) NOT NULL DEFAULT 0 CHECK (total >= 0)
);

CREATE TABLE IF NOT EXISTS itens_pedido (
    pedido_id INTEGER NOT NULL REFERENCES pedidos(pedido_id) ON DELETE CASCADE,
    variante_id INTEGER NOT NULL REFERENCES variantes_produto(variante_id),
    quantidade INTEGER NOT NULL CHECK (quantidade > 0),
    preco_unitario NUMERIC(10,2) NOT NULL CHECK (preco_unitario >= 0),
    PRIMARY KEY (pedido_id, variante_id)
);

CREATE INDEX IF NOT EXISTS idx_produtos_categoria ON produtos(categoria_id);
CREATE INDEX IF NOT EXISTS idx_pedidos_cliente_data ON pedidos(cliente_id, criado_em DESC);

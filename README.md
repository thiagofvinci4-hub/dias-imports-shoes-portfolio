# Dias Imports Shoes — projeto de portfólio

Projeto de e-commerce para a Dias Imports Shoes, reunindo o módulo web da loja, um aplicativo móvel complementar e exercícios de modelagem de dados.

## Tecnologias

- **Web:** Python, Flask, SQLite, HTML, CSS e JavaScript.
- **App:** React Native, Expo e TypeScript.
- **Banco de estudo:** PostgreSQL e SQL.

> O módulo web desta versão usa SQLite. Os scripts de PostgreSQL são exercícios independentes para praticar criação de tabelas, chaves e relacionamentos; eles ainda não estão conectados ao site.

## O que o projeto demonstra

- Vitrine de produtos, busca, filtros, categorias, variantes e conteúdo promocional.
- Carrinho, checkout e acompanhamento de pedidos integrados ao servidor da loja.
- Aplicativo móvel com catálogo, favoritos, carrinho, conta do cliente e notificações.
- Modelagem relacional e comandos SQL em PostgreSQL.

## Estrutura

```text
web/                       Módulo Flask da loja e templates
mobile/                    Aplicativo Expo / React Native
database/postgresql/       Exercícios e modelo relacional de estudo
```

## Executar o app móvel

1. Instale uma versão LTS do Node.js.
2. Entre na pasta `mobile`.
3. Copie `.env.example` para `.env` e configure `EXPO_PUBLIC_API_URL` com a URL do seu servidor de desenvolvimento.
4. Execute `npm install` e depois `npx expo start`.
5. Abra no Expo Go ou em um emulador compatível.

O app depende de um servidor Flask compatível com os endpoints usados em `mobile/src/lib/api.ts`. O servidor de produção não está incluído neste repositório. Para testes, use um ambiente próprio e não conecte dados de clientes reais.

## Usar os scripts PostgreSQL

Abra o pgAdmin, conecte-se a um banco de desenvolvimento e execute primeiro `database/postgresql/01_tabela_aluno.sql`. O segundo arquivo apresenta um modelo ilustrativo de loja de tênis com categorias, produtos, variantes, clientes, pedidos e itens.

## Segurança

- Não armazene senhas, tokens de pagamento, chaves de API ou dados de clientes neste repositório.
- O painel web deve receber um PIN forte por variável de ambiente (`DIAS_ADMIN_PIN`) antes da primeira inicialização.
- Configure URL de API e credenciais apenas em ambientes privados e arquivos `.env` que não sejam enviados ao GitHub.

## Observação

Este repositório é uma apresentação técnica do projeto. O módulo web deve ser integrado a uma aplicação Flask hospedeira; ele não é um servidor completo independente.

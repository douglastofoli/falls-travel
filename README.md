# FallsTravel

Bem-vindo a FallsTravel - Sua solução de viagem personalizada!

## Descrição

FallsTravel é uma aplicação inspirada no turismo da minha cidade, Foz do Iguaçu - PR. Ela permite a criação de carrinhos de compras e todo o fluxo de adição, listagem e removeção dos itens, seja eles serviços ou produtos.

## Como Executar

## Instalação

1. Clone o repositório do FallsTravel em sua máquina local:
   `git clone https://github.com/douglastofoli/falls-travel.git`

2. Navegue até o diretório do projeto:
   `cd falls-travel`

## Execução local

3. Instale as dependências e execute a criação do banco

- Talvez seja necessário alterar as configurações de conexão com o banco em `dev.exs` e `test.exs`
  `mix deps.get && mix ecto.setup`

4. Execute o servidor
   `mix phx.server`

5. Para executar os testes
   `mix test`

## Execução com Docker

3. Execute o build do container Docker
   `docker compose build`

4. Execute a criação do banco. As configurações de conexão já estão definidas para funcionar no Docker
   `docker compose run --rm falls_travel_app mix ecto.setup`

5. Inicie a aplicação

   - Com logs no terminal
     `docker compose up`
   - Em detached mode
     `docker compose up -d`

6. Para acessar o container
   `docker compose run --rm falls_travel_app ash`

7. Para executar os testes
   `docker compose run --rm falls_travel_app mix test`

## API

Acesso da API através da URL `http://localhost:4000/api/graphiql`.

## Insomnia

Na raiz do projeto, há um JSON do Insomnia com todas as requests criadas e testadas por mim.

## Queries

As queries podem ser vistas no diretório de documentação em [Queries](https://github.com/douglastofoli/falls-travel/blob/main/docs/queries.md).

## Mutations

As mutations podem ser vistas no diretório de documentação em [Mutations](https://github.com/douglastofoli/falls-travel/blob/main/docs/mutations.md).

## Referências

Outros detalhes da aplicação podem ser consultados [aqui](https://github.com/douglastofoli/falls-travel/blob/main/docs/references.md).

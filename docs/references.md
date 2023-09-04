# References

Aqui você encontra mais sobre a modelagem do banco de dados e outros detalhes da execução.

# Banco de dados

```
Table customers {
  id uuid [PK]
  name varchar
}

Table items {
  id uuid [PK]
  name varchar
  description varchar
  price float
}

Enum cart_status_type {
  OPEN
  IN_CHECKOUT
  COMPLETED
  EMPTY
  CANCELED
}

Table carts {
  id uuid [PK]
  status cart_status_type
  customer_id uuid [ref: > customers.id]
}

Table cart_items {
  id uuid [PK]
  cart_id uuid [ref: > carts.id]
  item_id uuid [ref: > items.id]
  quantity integer
}
```

### Tabela Customers

A tabela "Customers" armazena todos os clientes da aplicação. Cada cliente pode ter vários carrinhos de compra, mas apenas um carrinho com status "aberto" por vez. Manter um histórico dos carrinhos de compras dos clientes é útil para gerar métricas que ajudam a entender o comportamento de consumo de cada cliente, permitindo a recomendação de produtos similares.

### Relação Many-to-Many

Existe uma relação "many-to-many" entre as tabelas "Cart" e "Items", o que resulta na criação de uma tabela de associação chamada "Cart_Items". Esta tabela de associação armazena as relações entre os carrinhos de compra (através do "cart_id") e os itens disponíveis para compra (através do "item_id"). Isso permite que um carrinho de compra contenha múltiplos itens e, ao mesmo tempo, um item pode estar presente em vários carrinhos de compra diferentes.

### Relação com a tabela Customers

Além disso, a tabela "Customers" está relacionada com a tabela "Carts", vinculando os clientes aos seus carrinhos de compra. Isso permite que cada cliente tenha uma visão geral dos seus carrinhos de compra e do seu histórico de compras ao longo do tempo.

# Nix

O Nix foi incorporado ao desenvolvimento deste projeto por meio dos arquivos `flake.nix` e `.envrc`. É importante observar que a utilização do Nix para a instalação do Elixir e PostgreSQL é completamente opcional. Portanto, esses arquivos não terão efeito caso o Nix não esteja instalado em sua máquina.

### O que é Nix?

O Nix é um sistema de gerenciamento de pacotes e uma distribuição de Linux que adota uma abordagem rigorosa para o controle e a organização de software em um sistema computacional. Ao contrário dos métodos tradicionais de instalação de programas diretamente no sistema, o Nix oferece uma estrutura na qual os programas são adquiridos e instalados por meio de pacotes de software.

O aspecto distintivo do Nix é a criação de ambientes isolados para cada pacote de software. Isso significa que cada programa é instalado em um ambiente virtual que é independente do sistema principal. Essa separação rigorosa impede conflitos entre programas e garante que a instalação de um pacote não afete a estabilidade ou o desempenho do sistema em geral.

Em essência, o Nix atua como um "guardião" que controla e supervisiona a instalação de software, mantendo a integridade do sistema operacional. Essa abordagem garante que as dependências de software sejam gerenciadas de maneira precisa e que várias versões de um programa possam coexistir harmoniosamente no mesmo sistema, tornando-o altamente flexível e controlado.

# ChatGPT

O projeto aproveitou o ChatGPT para criar dados fictícios que foram usados como seeds para preencher o banco de dados. Essa abordagem possibilitou uma geração eficiente de dados fictícios

O input para geração foi: `Escreva 20 itens entre serviços e produtos, envolvendo destinos turisticos da cidade de Foz do Iguaçu no Paraná, Brasil`

O resultado pode ser encontrado no arquivo [priv/repo/seeds.exs](https://github.com/douglastofoli/falls-travel/blob/main/priv/repo/seeds.exs)

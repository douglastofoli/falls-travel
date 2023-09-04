# Mutations

## Mutations propostas para esta aplicação

### Adicionar item ao carrinho

```
mutation {
  addItemToCart(
    cartId: "fb4c9125-70aa-4f41-8d61-49724e66663a",
    items: [
      {itemId: "c108dfce-ba6d-4c6f-969f-698dedeab9c9", quantity: 3},
      {itemId: "adb1e838-ef74-489a-a040-f1b3558f36d3", quantity: 2}
    ]
  ) {
    status
    items {
      name
      price
    }
  }
}
```

### Remover item do carrinho

```
mutation {
  removeItemFromCart(
    cartId: "fb4c9125-70aa-4f41-8d61-49724e66663a",
    items: [
        "c108dfce-ba6d-4c6f-969f-698dedeab9c9",
        "adb1e838-ef74-489a-a040-f1b3558f36d3"
    ]
  ) {
    items {
      name
    }
  }
}
```

## Criar um cliente

```
mutation {
  createCustomer(input: {name: "João"}) {
    id
    name
  }
}
```

## Atualizar um cliente

```
mutation {
  updateCustomer(id: "65c6dcfe-8499-41bd-897c-c3c32101a09e",
  input: {
    name: "João da Silva"
  }) {
    id
    name
  }
}
```

# Queries

## Queries propostas para esta aplicação

### Listar carrinho

```
query {
  cart(cartId: "fb4c9125-70aa-4f41-8d61-49724e66663a"
  ) {
    customer {
      name
    }
    totalPrice
    totalPriceWithDiscount
    items {
      name
      price
      type
    }
  }
}
```

### Listar todos os carrinhos

```
query {
  carts {
    customer {
      name
    }
    status
    totalPrice
    totalPriceWithDiscount
    items {
      name
      description
      type
      price
    }
  }
}
```

### Listar items

```
query {
  items {
    id
    name
    description
    price
    type
  }
}
```

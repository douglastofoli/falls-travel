alias FallsTravel.Customers.Actions.Create, as: CreateCustomer
alias FallsTravel.Customers.Models.Customer
alias FallsTravel.Items.Actions.Create, as: CreateItem
alias FallsTravel.Repo
alias FallsTravel.ShoppingCarts.Actions.Create, as: CreateShoppingCart

customers = [
  %{
    name: "Alice Johnson"
  },
  %{
    name: "Carlos Silva"
  },
  %{
    name: "Sophia Santos"
  }
]

items = [
  %{
    name: "Ingresso para as Cataratas do Iguaçu",
    description:
      "Acesso às belas Cataratas do Iguaçu, uma das sete maravilhas naturais do mundo.",
    type: :product,
    price: 50.50
  },
  %{
    name: "Passeio de barco pelas Cataratas",
    description: "Um emocionante passeio de barco que leva você bem perto das quedas d'água.",
    type: :service,
    price: 75.25
  },
  %{
    name: "Visita ao Parque das Aves",
    description: "Encontro com aves tropicais exóticas e oportunidade de tirar fotos incríveis.",
    type: :product,
    price: 30.75
  },
  %{
    name: "Jantar no restaurante gourmet Belmond Hotel das Cataratas",
    description: "Desfrute de uma refeição gourmet com vista para as Cataratas do Iguaçu.",
    type: :service,
    price: 150.99
  },
  %{
    name: "Passeio de helicóptero sobre as Cataratas",
    description: "Um emocionante voo de helicóptero para apreciar as Cataratas de cima.",
    type: :service,
    price: 200.50
  },
  %{
    name: "Lembrança de artesanato Guarani",
    description:
      "Artesanato feito à mão pela comunidade indígena Guarani, incluindo colares e pulseiras.",
    type: :product,
    price: 15.25
  },
  %{
    name: "Guia turístico local",
    description: "Serviço de guia experiente para explorar a região de Foz do Iguaçu.",
    type: :service,
    price: 80.60
  },
  %{
    name: "Visita à Usina Hidrelétrica de Itaipu",
    description:
      "Tour pela maior usina hidrelétrica do mundo, com informações sobre energia e sustentabilidade.",
    type: :product,
    price: 40.99
  },
  %{
    name: "Trilha na selva com guia",
    description: "Exploração da selva com guia para observar a flora e fauna local.",
    type: :service,
    price: 65.75
  },
  %{
    name: "Cerveja artesanal local",
    description: "Uma seleção de cervejas artesanais produzidas em Foz do Iguaçu.",
    type: :product,
    price: 8.99
  },
  %{
    name: "Passeio de bicicleta pela cidade",
    description: "Aluguel de bicicletas para explorar Foz do Iguaçu de forma ecológica.",
    type: :service,
    price: 25.50
  },
  %{
    name: "Pôr do sol nas Cataratas do Iguaçu",
    description: "Tour noturno para apreciar o pôr do sol espetacular sobre as Cataratas.",
    type: :service,
    price: 60.75
  },
  %{
    name: "Lanche de empanadas argentinas",
    description: "Deliciosas empanadas argentinas recheadas com diversos sabores.",
    type: :product,
    price: 5.49
  },
  %{
    name: "Massagem relaxante em spa local",
    description: "Uma massagem relaxante para rejuvenescer após um dia de exploração.",
    type: :service,
    price: 90.25
  },
  %{
    name: "Livro de fotografia das Cataratas do Iguaçu",
    description: "Um livro de fotografias impressionantes das Cataratas e sua beleza natural.",
    type: :product,
    price: 20.99
  },
  %{
    name: "Passeio de jipe pela Mata Atlântica",
    description: "Aventura off-road na Mata Atlântica para apreciar a biodiversidade local.",
    type: :service,
    price: 110.50
  },
  %{
    name: "Pacote de rafting no Rio Iguaçu",
    description: "Emocionante aventura de rafting nas águas do Rio Iguaçu.",
    type: :service,
    price: 70.25
  },
  %{
    name: "Arte em pedra de Itaipu",
    description: "Esculturas em pedra feitas por artistas locais, inspiradas na Usina de Itaipu.",
    type: :product,
    price: 25.75
  },
  %{
    name: "Aula de dança latina",
    description: "Aprenda a dançar ritmos latinos, como salsa e samba.",
    type: :service,
    price: 35.99
  },
  %{
    name: "Lembrança de camiseta personalizada de Foz do Iguaçu",
    description: "Camiseta com estampas personalizadas que lembram a visita a Foz do Iguaçu.",
    type: :product,
    price: 12.49
  }
]

Enum.map(customers, fn customer ->
  CreateCustomer.call(customer)
end)

Enum.map(items, fn item ->
  CreateItem.call(item)
end)

Customer
|> Repo.all()
|> Enum.map(fn customer ->
  %{status: :open, customer_id: customer.id}
  |> CreateShoppingCart.call()
end)

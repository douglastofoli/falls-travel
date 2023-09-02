defmodule FallsTravelWeb.Schema.ShoppingCarts.ShoppingCartQueries do
  use Absinthe.Schema.Notation

  alias FallsTravelWeb.Resolvers.ShoppingCarts, as: ShoppingCartResolver

  object :shopping_carts_queries do
    field :shopping_cart, type: :shopping_cart do
      arg(:id, non_null(:id))

      resolve(&ShoppingCartResolver.find/3)
    end

    field :shopping_carts, list_of(:shopping_cart) do
      resolve(&ShoppingCartResolver.all/3)
    end
  end
end

defmodule FallsTravelWeb.Schema.ShoppingCarts.ShoppingCartMutations do
  use Absinthe.Schema.Notation

  alias Crudry.Middlewares.TranslateErrors
  alias FallsTravelWeb.Resolvers.ShoppingCarts, as: ShoppingCartResolver

  object :shopping_carts_mutations do
    field :create_shopping_cart, type: :shopping_cart do
      arg(:input, non_null(:shopping_cart_input))

      resolve(&ShoppingCartResolver.create/3)
      middleware(TranslateErrors)
    end

    # field :update_shopping_cart, type: :shopping_cart do
    #   arg(:id, non_null(:id))
    #   arg(:input, non_null(:shopping_cart_input))

    #   resolve(&ShoppingCartResolver.update/3)
    #   middleware(TranslateErrors)
    # end
  end
end

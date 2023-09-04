defmodule FallsTravelWeb.Schema.Carts.CartMutations do
  use Absinthe.Schema.Notation

  alias Crudry.Middlewares.TranslateErrors
  alias FallsTravelWeb.Resolvers.Carts, as: CartResolver

  object :carts_mutations do
    field :add_item_to_cart, type: :cart do
      arg(:cart_id, non_null(:id))
      arg(:items, non_null(list_of(:add_item_to_cart_input)))

      resolve(&CartResolver.add_item/3)
      middleware(TranslateErrors)
    end
  end
end

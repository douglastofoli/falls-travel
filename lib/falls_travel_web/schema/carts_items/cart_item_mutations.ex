defmodule FallsTravelWeb.Schema.CartsItems.CartItemMutations do
  use Absinthe.Schema.Notation

  alias Crudry.Middlewares.TranslateErrors
  alias FallsTravelWeb.Resolvers.CartsItems, as: CartItemResolver

  object :carts_items_mutations do
    field :add_item_to_cart2, type: :cart do
      arg(:cart_id, non_null(:id))
      arg(:items, non_null(list_of(:add_item_to_cart_input)))

      resolve(&CartItemResolver.add_item/3)
      middleware(TranslateErrors)
    end
  end
end

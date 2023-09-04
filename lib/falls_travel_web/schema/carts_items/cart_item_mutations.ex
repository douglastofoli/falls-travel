defmodule FallsTravelWeb.Schema.CartsItems.CartItemMutations do
  @moduledoc """
  CartItem mutations.
  """

  use Absinthe.Schema.Notation

  alias Crudry.Middlewares.TranslateErrors
  alias FallsTravelWeb.Resolvers.CartsItems, as: CartItemResolver

  object :carts_items_mutations do
    field :remove_item_from_cart, type: :cart do
      arg(:cart_id, non_null(:id))
      arg(:items, non_null(list_of(:id)))

      resolve(&CartItemResolver.remove_item/3)
      middleware(TranslateErrors)
    end
  end
end

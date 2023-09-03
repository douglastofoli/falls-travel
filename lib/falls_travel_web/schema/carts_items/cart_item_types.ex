defmodule FallsTravelWeb.Schema.CartsItems.CartItemTypes do
  use Absinthe.Schema.Notation

  @desc "A cart of the application"
  object :cart_item do
    field(:id, :id)
    field(:cart_id, :id)
    field(:item_id, :id)
  end

  @desc "A input of item to add to cart"
  input_object :add_item_to_cart_input do
    field(:item_id, non_null(:id))
    field(:quantity, :integer)
  end
end

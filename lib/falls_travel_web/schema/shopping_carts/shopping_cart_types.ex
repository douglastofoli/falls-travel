defmodule FallsTravelWeb.Schema.ShoppingCarts.ShoppingCartTypes do
  use Absinthe.Schema.Notation

  @desc "A shopping cart of the application"
  object :shopping_cart do
    field(:id, :id)
    field(:status, :status_type)
    field(:customer_id, :id)
  end

  @desc "A item input"
  input_object :shopping_cart_input do
    field(:status, non_null(:status_type))
    field(:customer_id, non_null(:id))
    field(:items, non_null(list_of(:item_shopping_cart_input)))
  end

  @desc "A shopping cart status type"
  enum :status_type do
    value(:open)
    value(:in_checkout)
    value(:completed)
    value(:empty)
    value(:cancelled)
  end
end

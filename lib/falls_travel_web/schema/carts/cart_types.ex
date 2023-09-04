defmodule FallsTravelWeb.Schema.Carts.CartTypes do
  use Absinthe.Schema.Notation

  @desc "A cart of the application"
  object :cart do
    field(:id, :id)
    field(:status, :status_type)
    field(:customer, :customer)
    field(:total_price, :decimal)
    field(:items, list_of(:item))
  end

  @desc "A item input"
  input_object :cart_input do
    field(:status, non_null(:status_type))
    field(:customer_id, non_null(:id))
    field(:items, non_null(list_of(:add_item_to_cart_input)))
  end

  @desc "A cart status type"
  enum :status_type do
    value(:open)
    value(:in_checkout)
    value(:completed)
    value(:empty)
    value(:cancelled)
  end
end

defmodule FallsTravelWeb.Schema.Items.ItemTypes do
  use Absinthe.Schema.Notation

  import_types(Absinthe.Type.Custom)

  @desc "A item type, that has products and services"
  object :item do
    field(:id, :id)
    field(:name, :string)
    field(:description, :string)
    field(:type, :item_type)
    field(:price, :decimal)
  end

  @desc "A item input to create an item"
  input_object :item_input do
    field(:name, :string)
    field(:description, :string)
    field(:type, :item_type)
    field(:price, :decimal)
  end

  @desc "A item input to add to a shopping cart"
  input_object :item_shopping_cart_input do
    field(:id, :id)
    field(:quantity, :integer)
  end

  @desc "A item type"
  enum :item_type do
    value(:product)
    value(:service)
  end
end

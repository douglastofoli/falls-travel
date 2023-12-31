defmodule FallsTravelWeb.Schema.Items.ItemTypes do
  @moduledoc """
  Item types.
  """

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

  @desc "A item type"
  enum :item_type do
    value(:product)
    value(:service)
  end
end

defmodule FallsTravelWeb.Schema.Types do
  use Absinthe.Schema.Notation

  alias FallsTravelWeb.Schema.Carts.CartTypes
  alias FallsTravelWeb.Schema.CartsItems.CartItemTypes
  alias FallsTravelWeb.Schema.Customers.CustomerTypes
  alias FallsTravelWeb.Schema.Items.ItemTypes

  import_types(CartTypes)
  import_types(CartItemTypes)
  import_types(CustomerTypes)
  import_types(ItemTypes)
end

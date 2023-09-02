defmodule FallsTravelWeb.Schema.Types do
  use Absinthe.Schema.Notation

  alias FallsTravelWeb.Schema.Customers.CustomerTypes
  alias FallsTravelWeb.Schema.Items.ItemTypes
  alias FallsTravelWeb.Schema.ShoppingCarts.ShoppingCartTypes

  import_types(CustomerTypes)
  import_types(ItemTypes)
  import_types(ShoppingCartTypes)
end

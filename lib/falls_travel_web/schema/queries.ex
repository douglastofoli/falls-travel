defmodule FallsTravelWeb.Schema.Queries do
  use Absinthe.Schema.Notation

  alias FallsTravelWeb.Schema.Customers.CustomerQueries
  alias FallsTravelWeb.Schema.Items.ItemQueries
  alias FallsTravelWeb.Schema.ShoppingCarts.ShoppingCartQueries

  import_types(CustomerQueries)
  import_types(ItemQueries)
  import_types(ShoppingCartQueries)
end

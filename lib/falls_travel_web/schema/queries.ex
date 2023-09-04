defmodule FallsTravelWeb.Schema.Queries do
  @moduledoc """
  Module that imports all queries.
  """

  use Absinthe.Schema.Notation

  alias FallsTravelWeb.Schema.Carts.CartQueries
  alias FallsTravelWeb.Schema.Customers.CustomerQueries
  alias FallsTravelWeb.Schema.Items.ItemQueries

  import_types(CartQueries)
  import_types(CustomerQueries)
  import_types(ItemQueries)
end

defmodule FallsTravelWeb.Schema.Mutations do
  use Absinthe.Schema.Notation

  alias FallsTravelWeb.Schema.Carts.CartMutations
  alias FallsTravelWeb.Schema.CartsItems.CartItemMutations
  alias FallsTravelWeb.Schema.Customers.CustomerMutations

  import_types(CartMutations)
  import_types(CartItemMutations)
  import_types(CustomerMutations)
end

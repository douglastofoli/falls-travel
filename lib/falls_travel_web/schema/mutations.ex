defmodule FallsTravelWeb.Schema.Mutations do
  use Absinthe.Schema.Notation

  alias FallsTravelWeb.Schema.Customers.CustomerMutations
  alias FallsTravelWeb.Schema.ShoppingCarts.ShoppingCartMutations

  import_types(CustomerMutations)
  import_types(ShoppingCartMutations)
end

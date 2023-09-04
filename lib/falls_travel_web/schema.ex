defmodule FallsTravelWeb.Schema do
  @moduledoc """
  Module that imports all types, queries and mutations. This is the main schema.
  """

  use Absinthe.Schema

  alias FallsTravelWeb.Schema.{Mutations, Queries, Types}

  import_types(Mutations)
  import_types(Queries)
  import_types(Types)

  query do
    import_fields(:customers_queries)
    import_fields(:items_queries)
    import_fields(:carts_queries)
  end

  mutation do
    import_fields(:carts_mutations)
    import_fields(:carts_items_mutations)
    import_fields(:customers_mutations)
  end
end

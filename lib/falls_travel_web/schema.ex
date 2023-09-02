defmodule FallsTravelWeb.Schema do
  use Absinthe.Schema

  alias FallsTravelWeb.Schema.{Mutations, Queries, Types}

  import_types(Mutations)
  import_types(Queries)
  import_types(Types)

  query do
    import_fields(:customers_queries)
    import_fields(:items_queries)
    import_fields(:shopping_carts_queries)
  end

  mutation do
    import_fields(:customers_mutations)
    import_fields(:shopping_carts_mutations)
  end
end

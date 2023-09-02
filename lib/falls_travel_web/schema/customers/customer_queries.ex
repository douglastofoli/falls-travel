defmodule FallsTravelWeb.Schema.Customers.CustomerQueries do
  use Absinthe.Schema.Notation

  alias FallsTravelWeb.Resolvers.Customers, as: CustomerResolver

  object :customers_queries do
    field :customer, type: :customer do
      arg(:id, non_null(:id))

      resolve(&CustomerResolver.find/3)
    end
  end
end

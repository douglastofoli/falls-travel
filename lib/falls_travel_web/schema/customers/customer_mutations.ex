defmodule FallsTravelWeb.Schema.Customers.CustomerMutations do
  use Absinthe.Schema.Notation

  alias Crudry.Middlewares.TranslateErrors
  alias FallsTravelWeb.Resolvers.Customers, as: CustomerResolver

  object :customers_mutations do
    field :create_customer, type: :customer do
      arg(:input, non_null(:customer_input))

      resolve(&CustomerResolver.create/3)
      middleware(TranslateErrors)
    end

    field :update_customer, type: :customer do
      arg(:id, non_null(:id))
      arg(:input, non_null(:customer_input))

      resolve(&CustomerResolver.update/3)
      middleware(TranslateErrors)
    end
  end
end

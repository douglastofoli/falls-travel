defmodule FallsTravelWeb.Schema.Carts.CartQueries do
  @moduledoc """
  Cart queries.
  """

  use Absinthe.Schema.Notation

  alias Crudry.Middlewares.TranslateErrors
  alias FallsTravelWeb.Resolvers.Carts, as: CartResolver

  object :carts_queries do
    field :carts, list_of(:cart) do
      resolve(&CartResolver.all/3)
    end

    field :cart, type: :cart do
      arg(:cart_id, non_null(:id))

      resolve(&CartResolver.find/3)
      middleware(TranslateErrors)
    end
  end
end

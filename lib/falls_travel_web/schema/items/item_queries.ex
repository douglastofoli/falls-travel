defmodule FallsTravelWeb.Schema.Items.ItemQueries do
  @moduledoc """
  Item queries.
  """

  use Absinthe.Schema.Notation

  alias FallsTravelWeb.Resolvers.Items, as: ItemResolver

  object :items_queries do
    field :item, type: :item do
      arg(:id, non_null(:id))

      resolve(&ItemResolver.find/3)
    end

    field :items, list_of(:item) do
      resolve(&ItemResolver.all/3)
    end
  end
end

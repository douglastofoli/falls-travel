defmodule FallsTravelWeb.Resolvers.CartsItems do
  @moduledoc """
  Resolver to handle carts_items queries and mutations.
  """

  alias FallsTravel.CartsItems.Actions.Delete

  def remove_item(_parent, %{cart_id: cart_id, items: items}, _resolution) do
    Delete.call(cart_id, items)
  end
end

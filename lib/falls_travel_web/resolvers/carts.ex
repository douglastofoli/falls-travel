defmodule FallsTravelWeb.Resolvers.Carts do
  alias FallsTravel.Carts.Actions.{Create, Get, Update}
  alias FallsTravel.Carts.Models.Cart

  def add_item(_parent, %{cart_id: _cart_id} = attrs, _resolution) do
    case Create.add_item(attrs) do
      {:ok, carts} -> {:ok, carts}
      {:error, changeset} -> {:error, changeset}
    end
  end
end

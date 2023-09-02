defmodule FallsTravelWeb.Resolvers.ShoppingCarts do
  alias FallsTravel.ShoppingCarts.Actions.{Create, Get, Update, Delete}

  def create(_parent, %{input: input}, _resolution) do
    case Create.call(input) do
      {:ok, shopping_cart} -> {:ok, shopping_cart}
      {:error, changeset} -> {:error, changeset}
    end
  end
end

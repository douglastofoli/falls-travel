defmodule FallsTravel.ShoppingCarts.Actions.Update do
  alias FallsTravel.ShoppingCarts.Models.ShoppingCart
  alias FallsTravel.Repo

  def call(shopping_cart, attrs) do
    shopping_cart
    |> ShoppingCart.changeset(attrs)
    |> Repo.update()
  end
end

defmodule FallsTravel.ShoppingCarts.Actions.Delete do
  alias FallsTravel.ShoppingCarts.Models.ShoppingCart
  alias FallsTravel.Repo

  def call(%ShoppingCart{} = shopping_cart) do
    Repo.delete(shopping_cart)
  end
end

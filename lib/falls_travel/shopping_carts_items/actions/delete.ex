defmodule FallsTravel.ShoppingCartsItems.Actions.Delete do
  alias FallsTravel.ShoppingCartsItems.Models.ShoppingCartItem
  alias FallsTravel.Repo

  def call(%ShoppingCartItem{} = shopping_carts_item) do
    Repo.delete(shopping_carts_item)
  end
end

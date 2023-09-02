defmodule FallsTravel.ShoppingCartsItems.Actions.Update do
  alias FallsTravel.ShoppingCartsItems.Models.ShoppingCartItem
  alias FallsTravel.Repo

  def call(shopping_carts_item, attrs) do
    shopping_carts_item
    |> ShoppingCartItem.changeset(attrs)
    |> Repo.update()
  end
end

defmodule FallsTravel.ShoppingCartsItems.Actions.Create do
  alias FallsTravel.ShoppingCartsItems.Models.ShoppingCartItem
  alias FallsTravel.Repo

  def call(attrs) do
    %ShoppingCartItem{}
    |> ShoppingCartItem.changeset(attrs)
    |> Repo.insert()
  end
end

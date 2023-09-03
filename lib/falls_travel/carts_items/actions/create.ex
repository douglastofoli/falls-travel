defmodule FallsTravel.CartsItems.Actions.Create do
  alias FallsTravel.Carts.Actions.HandleItems
  alias FallsTravel.CartsItems.Models.CartItem
  alias FallsTravel.Repo

  def add_cart_item(cart_id, attrs) do
    attrs
    |> HandleItems.handle()
    |> Map.get(:carts_items)
    |> Enum.map(fn item ->
      item
      |> Map.put(:cart_id, attrs.cart_id)
      |> CartItem.changeset()
      |> Repo.insert()
    end)
  end
end

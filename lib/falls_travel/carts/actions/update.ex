defmodule FallsTravel.Carts.Actions.Update do
  alias FallsTravel.Carts.Actions.Get
  alias FallsTravel.Carts.Models.Cart
  alias FallsTravel.Repo

  def call(id, attrs) do
    case Get.call(id) do
      {:error, _error} = error -> error
      {:ok, cart} -> do_update(cart, attrs)
    end
  end

  defp do_update(cart, attrs) do
    cart
    |> Cart.changeset(attrs)
    |> Repo.update()
  end
end

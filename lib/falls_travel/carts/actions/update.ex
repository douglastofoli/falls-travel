defmodule FallsTravel.Carts.Actions.Update do
  alias FallsTravel.Carts.Actions.{Get, HandleItems}
  alias FallsTravel.Carts.Models.Cart
  alias FallsTravel.{Error, Repo}

  def call(id, attrs) do
    case Get.call(id) do
      nil -> {:error, Error.build_cart_not_found_error()}
      cart -> do_update(cart, attrs)
    end
  end

  defp do_update(cart, attrs) do
    cart
    |> Cart.changeset(attrs)
    |> Repo.update()
  end
end

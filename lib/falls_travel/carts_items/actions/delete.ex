defmodule FallsTravel.CartsItems.Actions.Delete do
  import Ecto.Query

  alias FallsTravel.Carts.Models.Cart
  alias FallsTravel.Carts.Actions.Get, as: GetCart
  alias FallsTravel.CartsItems.Models.CartItem
  alias FallsTravel.{Error, Repo}

  def call(cart_id, items) do
    case GetCart.call(cart_id) do
      {:ok, cart} -> handle_delete(cart, items)
      {:error, _error} -> {:error, Error.build_cart_not_found_error()}
    end
  end

  defp handle_delete(%Cart{id: cart_id}, items) do
    query =
      from ci in CartItem,
        where: ci.cart_id == ^cart_id and ci.item_id in ^items

    case Repo.delete_all(query) do
      {_count, nil} -> GetCart.call(cart_id)
      _ -> {:error, Error.build(:bad_request, "Failed to delete items from cart")}
    end
  end
end

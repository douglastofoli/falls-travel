defmodule FallsTravel.Carts.Actions.Get do
  alias FallsTravel.Carts.Actions.TotalPrice
  alias FallsTravel.Carts.Models.Cart
  alias FallsTravel.Carts.Queries.CartQueries
  alias FallsTravel.{Error, Repo}

  def call(attrs) do
    case Repo.get(Cart, attrs.cart_id) do
      nil -> {:error, Error.build_cart_not_found_error()}
      %Cart{} = cart -> handle_get(cart, attrs)
    end
  end

  def find(id) do
    Cart
    |> Repo.get(id)
    |> Repo.preload(:items)
  end

  def status_open_by_cart_id(cart_id) do
    cart_id
    |> CartQueries.by_cart_id()
    |> Repo.one()
  end

  def status_open_by_customer_id(customer_id) do
    customer_id
    |> CartQueries.by_customer_id()
    |> Repo.one()
  end

  defp handle_get(cart, attrs) do
    result =
      cart
      |> Repo.preload([:items, :customer])
      |> TotalPrice.calculate()
      |> TotalPrice.apply_discount(attrs)

    {:ok, result}
  end
end

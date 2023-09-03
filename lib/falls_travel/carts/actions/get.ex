defmodule FallsTravel.Carts.Actions.Get do
  alias FallsTravel.Carts.Models.Cart
  alias FallsTravel.Carts.Queries.CartQueries
  alias FallsTravel.{Error, Repo}

  def call(id) do
    case Repo.get(Cart, id) do
      nil -> {:error, Error.build_cart_not_found_error()}
      cart -> {:ok, cart}
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
end

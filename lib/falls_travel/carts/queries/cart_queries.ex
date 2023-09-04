defmodule FallsTravel.Carts.Queries.CartQueries do
  @moduledoc """
  Carts queries to get rows from database.
  """

  import Ecto.Query

  alias FallsTravel.Carts.Models.Cart

  @doc """
  Query from carts table
  """
  @spec query :: Ecto.Query.t()
  def query do
    from(sc in Cart)
  end

  def by_cart_id(cart_id) do
    query()
    |> where(id: ^cart_id)
  end

  def by_customer_id(customer_id) do
    query()
    |> where(customer_id: ^customer_id)
  end

  def by_status(status) do
    query()
    |> where(status: ^status)
  end
end

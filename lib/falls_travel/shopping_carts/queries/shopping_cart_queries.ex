defmodule FallsTravel.ShoppingCarts.Queries.ShoppingCartQueries do
  import Ecto.Query

  alias FallsTravel.ShoppingCarts.Models.ShoppingCart
  alias FallsTravel.Repo

  @doc """
  Query from shopping carts table
  """
  @spec query :: Ecto.Query.t()
  def query do
    from(sc in ShoppingCart)
  end

  def by_customer_id_open(customer_id) do
    query()
    |> where(customer_id: ^customer_id)
    |> where(status: :open)
    |> Repo.one()
  end
end

defmodule FallsTravel.Customers.Actions.Get do
  @moduledoc """
  Customers actions to retrieve rows from database.
  """

  alias FallsTravel.Customers.Models.Customer
  alias FallsTravel.Repo

  def find(id) do
    Repo.get(Customer, id)
  end
end

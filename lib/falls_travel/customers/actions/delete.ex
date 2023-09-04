defmodule FallsTravel.Customers.Actions.Delete do
  @moduledoc """
  Customers actions to delete rows from database.
  """

  alias FallsTravel.Customers.Models.Customer
  alias FallsTravel.Repo

  def call(%Customer{} = customer) do
    Repo.delete(customer)
  end
end

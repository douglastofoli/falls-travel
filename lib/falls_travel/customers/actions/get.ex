defmodule FallsTravel.Customers.Actions.Get do
  alias FallsTravel.Customers.Models.Customer
  alias FallsTravel.Repo

  def find(id) do
    Repo.get(Customer, id)
  end
end

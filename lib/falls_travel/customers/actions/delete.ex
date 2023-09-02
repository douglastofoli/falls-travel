defmodule FallsTravel.Customers.Actions.Delete do
  alias FallsTravel.Customers.Models.Customer
  alias FallsTravel.Repo

  def call(%Customer{} = customer) do
    Repo.delete(customer)
  end
end

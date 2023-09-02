defmodule FallsTravel.Customers.Actions.Create do
  alias FallsTravel.Customers.Models.Customer
  alias FallsTravel.Repo

  def call(attrs) do
    %Customer{}
    |> Customer.changeset(attrs)
    |> Repo.insert()
  end
end

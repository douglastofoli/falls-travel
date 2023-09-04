defmodule FallsTravel.Customers.Actions.Create do
  @moduledoc """
  Customers actions to insert rows into database.
  """

  alias FallsTravel.Customers.Models.Customer
  alias FallsTravel.Repo

  def call(attrs) do
    %Customer{}
    |> Customer.changeset(attrs)
    |> Repo.insert()
  end
end

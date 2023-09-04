defmodule FallsTravel.Customers.Actions.Update do
  @moduledoc """
  Customers actions to update rows in database.
  """

  alias FallsTravel.Customers.Actions.Get
  alias FallsTravel.Customers.Models.Customer
  alias FallsTravel.Repo

  def call(customer_id, attrs) do
    with %Customer{} = customer <- Get.find(customer_id) do
      do_update(customer, attrs)
    end
  end

  defp do_update(customer, attrs) do
    customer
    |> Customer.changeset(attrs)
    |> Repo.update()
  end
end

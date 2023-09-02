defmodule FallsTravelWeb.Resolvers.Customers do
  alias FallsTravel.Customers.Actions.{Create, Get, Update, Delete}

  def find(_parent, %{id: id}, _resolution) do
    case Get.find(id) do
      nil -> {:error, "Customer ID #{id} not found"}
      customer -> {:ok, customer}
    end
  end

  def create(_parent, %{input: input}, _resolution) do
    case Create.call(input) do
      {:ok, customer} -> {:ok, customer}
      {:error, changeset} -> {:error, changeset}
    end
  end

  def update(_parent, %{id: id, input: input}, _resolution) do
    case Update.call(id, input) do
      nil -> {:error, "Customer ID #{id} not found"}
      {:ok, customer} -> {:ok, customer}
      {:error, changeset} -> {:error, changeset}
    end
  end
end

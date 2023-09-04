defmodule FallsTravelWeb.Resolvers.Items do
  @moduledoc """
  Resolver to handle items queries and mutations.
  """

  alias FallsTravel.Items.Actions.{Create, Get, Update}

  def all(_parent, _args, _resolution) do
    {:ok, Get.all()}
  end

  def find(_parent, %{id: id}, _resolution) do
    case Get.find(id) do
      nil -> {:error, "Item ID #{id} not found"}
      item -> {:ok, item}
    end
  end

  def create(_parent, %{input: input}, _resolution) do
    case Create.call(input) do
      {:ok, item} -> {:ok, item}
      {:error, changeset} -> {:error, changeset}
    end
  end

  def update(_parent, %{id: id, input: input}, _resolution) do
    case Update.call(id, input) do
      nil -> {:error, "Item ID #{id} not found"}
      {:ok, item} -> {:ok, item}
      {:error, changeset} -> {:error, changeset}
    end
  end
end

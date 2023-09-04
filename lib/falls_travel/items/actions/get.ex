defmodule FallsTravel.Items.Actions.Get do
  @moduledoc """
  Items actions to retrieve rows from database.
  """

  alias FallsTravel.Items.Models.Item
  alias FallsTravel.Repo

  def all do
    Repo.all(Item)
  end

  def find(id) do
    Repo.get(Item, id)
  end
end

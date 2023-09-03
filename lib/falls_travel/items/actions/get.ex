defmodule FallsTravel.Items.Actions.Get do
  alias FallsTravel.Items.Models.Item
  alias FallsTravel.Repo

  def all do
    Repo.all(Item)
  end

  def find(id) do
    Repo.get(Item, id)
  end
end

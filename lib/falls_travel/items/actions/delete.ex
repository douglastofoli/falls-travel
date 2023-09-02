defmodule FallsTravel.Items.Actions.Delete do
  alias FallsTravel.Items.Models.Item
  alias FallsTravel.Repo

  def call(%Item{} = item) do
    Repo.delete(item)
  end
end

defmodule FallsTravel.Items.Actions.Delete do
  @moduledoc """
  Items actions to delete rows from database.
  """

  alias FallsTravel.Items.Models.Item
  alias FallsTravel.Repo

  def call(%Item{} = item) do
    Repo.delete(item)
  end
end

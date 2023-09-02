defmodule FallsTravel.Items.Actions.Create do
  alias FallsTravel.Items.Models.Item
  alias FallsTravel.Repo

  def call(attrs) do
    %Item{}
    |> Item.changeset(attrs)
    |> Repo.insert()
  end
end

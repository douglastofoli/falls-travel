defmodule FallsTravel.Items.Actions.Update do
  alias FallsTravel.Items.Actions.Get
  alias FallsTravel.Items.Models.Item
  alias FallsTravel.Repo

  def call(item_id, attrs) do
    with %Item{} = item <- Get.find(item_id) do
      do_update(item, attrs)
    end
  end

  defp do_update(item, attrs) do
    item
    |> Item.changeset(attrs)
    |> Repo.update()
  end
end

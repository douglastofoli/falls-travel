defmodule FallsTravel.Carts.Actions.ValidateAndMultiplyItems do
  @moduledoc """
  Carts actions to validate if item exists and multiply it quantity.
  """

  def call(items, items_ids, items_params) do
    items_map = Map.new(items, fn item -> {item.id, item} end)

    items_ids
    |> Enum.map(fn id -> {id, Map.get(items_map, id)} end)
    |> Enum.any?(fn {_id, value} -> is_nil(value) end)
    |> multiply_items(items_map, items_params)
  end

  defp multiply_items(true, _items, _items_params), do: {:error, "Invalid ids!"}

  defp multiply_items(false, items, items_params) do
    items =
      Enum.reduce(items_params, [], fn %{item_id: id, quantity: quantity}, acc ->
        item = Map.get(items, id)

        acc ++ List.duplicate(item, quantity)
      end)

    {:ok, items}
  end
end

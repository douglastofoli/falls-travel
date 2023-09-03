defmodule FallsTravel.Carts.Actions.HandleItems do
  def handle(%{carts_items: items} = attrs) do
    Map.put(
      attrs,
      :carts_items,
      Enum.map(items, fn item ->
        %{item_id: item.item_id, quantity: item.quantity}
      end)
    )
    |> Map.delete(:items)
  end
end

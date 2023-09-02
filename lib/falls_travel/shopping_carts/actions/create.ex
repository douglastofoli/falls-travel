defmodule FallsTravel.ShoppingCarts.Actions.Create do
  alias FallsTravel.Items.Actions.Get, as: GetItem
  alias FallsTravel.ShoppingCarts.Models.ShoppingCart
  alias FallsTravel.Repo

  def call(attrs) do
    attrs = find_items(attrs)
    IO.inspect(attrs)

    %ShoppingCart{}
    |> ShoppingCart.changeset(attrs)
    |> Repo.insert()
  end

  defp find_items(%{items: items} = attrs) do
    %{attrs | items: Enum.map(items, &GetItem.find(&1.id))}
  end

  defp find_items(attrs), do: attrs
end

defmodule FallsTravel.Carts.Actions.Create do
  import Ecto.Query

  alias FallsTravel.Carts.Actions.{Get, ValidateAndMultiplyItems}
  alias FallsTravel.Carts.Models.Cart
  alias FallsTravel.Items.Models.Item
  alias FallsTravel.{Error, Repo}

  def call(attrs) do
    %Cart{}
    |> Cart.changeset(attrs, [])
    |> Repo.insert()
    |> handle_insert()
  end

  def add_item(%{cart_id: cart_id} = attrs) do
    case Get.call(cart_id) do
      {:ok, cart} ->
        cart
        |> Repo.preload(:items)
        |> handle_items(attrs)

      {:error, _changeset} ->
        {:error, Error.build(:not_found, "Cart not found")}
    end
  end

  defp handle_items(cart, %{items: items} = attrs) do
    items_ids = Enum.map(items, fn item -> item.item_id end)

    query =
      from i in Item,
        where: i.id in ^items_ids

    query
    |> Repo.all()
    |> ValidateAndMultiplyItems.call(items_ids, items)
    |> handle_items(cart, attrs)
  end

  defp handle_items({:error, result}, _cart, _attrs),
    do: {:error, Error.build(:bad_request, result)}

  defp handle_items({:ok, items}, cart, attrs) do
    cart
    |> Cart.changeset(attrs, items)
    |> Repo.update()
    |> handle_insert()
  end

  defp handle_insert({:ok, %Cart{} = result}), do: {:ok, result}

  defp handle_insert({:error, %Ecto.Changeset{} = changeset}) do
    {:error, Error.build(:bad_request, changeset)}
  end
end

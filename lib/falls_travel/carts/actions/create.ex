defmodule FallsTravel.Carts.Actions.Create do
  alias FallsTravel.Carts.Actions.Get
  alias FallsTravel.Carts.Models.Cart
  alias FallsTravel.{Error, Repo}

  def call(attrs) do
    attrs
    |> Cart.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  def add_item(%{cart_id: cart_id} = attrs) do
    IO.inspect(attrs)

    case Get.call(cart_id) do
      {:ok, cart} ->
        cart
        |> Repo.preload(:items)
        |> Cart.changeset(attrs)
        |> Repo.update()

      {:error, _changeset} ->
        {:error, Error.build(:not_found, "Cart not found")}
    end
  end

  defp handle_insert({:ok, %Cart{} = result}), do: result

  defp handle_insert({:error, %Ecto.Changeset{} = changeset}) do
    {:error, Error.build(:bad_request, changeset)}
  end
end

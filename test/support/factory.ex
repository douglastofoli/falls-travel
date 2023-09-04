defmodule FallsTravel.Factory do
  @moduledoc false

  use ExMachina.Ecto, repo: FallsTravel.Repo

  alias FallsTravel.Carts.Models.Cart
  alias FallsTravel.CartsItems.Models.CartItem
  alias FallsTravel.Customers.Models.Customer
  alias FallsTravel.Items.Models.Item

  def cart_params_factory do
    %{
      status: :open,
      customer_id: uuid()
    }
  end

  def cart_factory do
    %Cart{
      id: uuid(),
      status: :open,
      customer_id: uuid(),
      inserted_at: now(),
      updated_at: now()
    }
  end

  def cart_item_params_factory do
    %{
      cart_id: uuid(),
      item_id: uuid()
    }
  end

  def cart_item_factory do
    %CartItem{
      cart_id: uuid(),
      item_id: uuid()
    }
  end

  def customer_params_factory do
    %{
      name: "John Doe"
    }
  end

  def customer_factory do
    %Customer{
      id: uuid(),
      name: "John Doe",
      inserted_at: now(),
      updated_at: now()
    }
  end

  def item_params_factory do
    %{
      name: "Item",
      description: "Description",
      type: Enum.random(~w(product service)a),
      price: 100
    }
  end

  def item_factory do
    %Item{
      id: uuid(),
      name: "Item",
      description: "Description",
      type: Enum.random(~w(product service)a),
      price: 100,
      inserted_at: now(),
      updated_at: now()
    }
  end

  defp now, do: DateTime.utc_now()
  defp uuid, do: Ecto.UUID.generate()
end

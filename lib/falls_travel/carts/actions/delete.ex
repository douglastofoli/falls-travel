defmodule FallsTravel.Carts.Actions.Delete do
  alias FallsTravel.Carts.Actions.{Get, Update}
  alias FallsTravel.Carts.Models.Cart
  alias FallsTravel.{Error, Repo}

  def call(id) do
    attrs = %{
      status: :completed,
      deleted_at: DateTime.utc_now()
    }

    Update.call(id, attrs)
  end
end

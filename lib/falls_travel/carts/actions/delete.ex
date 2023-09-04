defmodule FallsTravel.Carts.Actions.Delete do
  @moduledoc """
  Carts actions to delete rows from database.
  """

  alias FallsTravel.Carts.Actions.Update

  def call(id) do
    attrs = %{
      status: :completed,
      deleted_at: DateTime.utc_now()
    }

    Update.call(id, attrs)
  end
end

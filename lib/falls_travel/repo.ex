defmodule FallsTravel.Repo do
  use Ecto.Repo,
    otp_app: :falls_travel,
    adapter: Ecto.Adapters.Postgres
end

defmodule FallsTravel.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      FallsTravelWeb.Telemetry,
      # Start the Ecto repository
      FallsTravel.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: FallsTravel.PubSub},
      # Start Finch
      {Finch, name: FallsTravel.Finch},
      # Start the Endpoint (http/https)
      FallsTravelWeb.Endpoint
      # Start a worker by calling: FallsTravel.Worker.start_link(arg)
      # {FallsTravel.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: FallsTravel.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    FallsTravelWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

defmodule Shoplist.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      ShoplistWeb.Telemetry,
      # Start the Ecto repository
      Shoplist.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Shoplist.PubSub},
      # Start Finch
      {Finch, name: Shoplist.Finch},
      # Start the Endpoint (http/https)
      ShoplistWeb.Endpoint
      # Start a worker by calling: Shoplist.Worker.start_link(arg)
      # {Shoplist.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Shoplist.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ShoplistWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

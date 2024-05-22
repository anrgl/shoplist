defmodule Shoplist.Repo do
  use Ecto.Repo,
    otp_app: :shoplist,
    adapter: Ecto.Adapters.Postgres
end

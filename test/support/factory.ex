defmodule Shoplist.Factory do
  use ExMachina.Ecto, repo: Shoplist.Repo
  use Shoplist.UserFactory
  use Shoplist.UserTokenFactory
  use Shoplist.ProductFactory
end

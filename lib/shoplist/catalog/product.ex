defmodule Shoplist.Catalog.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :name, :string
    belongs_to :user, Shoplist.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :user_id])
    |> validate_required([:name])
  end
end

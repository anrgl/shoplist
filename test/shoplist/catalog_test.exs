defmodule Shoplist.CatalogTest do
  use Shoplist.DataCase

  alias Shoplist.Catalog

  describe "products" do
    alias Shoplist.Catalog.Product

    @invalid_attrs %{name: nil}

    test "list_products/0 returns all products" do
      product = insert(:product)
      assert Catalog.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = insert(:product)
      assert Catalog.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Product{} = product} = Catalog.create_product(valid_attrs)
      assert product.name == "some name"
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Catalog.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = insert(:product)
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Product{} = product} = Catalog.update_product(product, update_attrs)
      assert product.name == "some updated name"
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = insert(:product)
      assert {:error, %Ecto.Changeset{}} = Catalog.update_product(product, @invalid_attrs)
      assert product == Catalog.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = insert(:product)
      assert {:ok, %Product{}} = Catalog.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> Catalog.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = insert(:product)
      assert %Ecto.Changeset{} = Catalog.change_product(product)
    end
  end
end

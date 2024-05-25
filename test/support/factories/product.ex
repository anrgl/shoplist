defmodule Shoplist.ProductFactory do
  defmacro __using__(_opts) do
    quote do
      def product_factory do
        %Shoplist.Catalog.Product{
          name: Faker.Pokemon.En.name()
        }
      end
    end
  end
end

defmodule Shoplist.UserFactory do
  defmacro __using__(_opts) do
    quote do
      def user_factory(attrs) do
        %Shoplist.Accounts.User{
          email: Faker.Internet.email(),
          password: attrs[:password],
          hashed_password: Bcrypt.hash_pwd_salt(attrs[:password]),
          confirmed_at: DateTime.utc_now()
        }
      end
    end
  end
end

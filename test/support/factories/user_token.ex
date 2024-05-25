defmodule Shoplist.UserTokenFactory do
  defmacro __using__(_opts) do
    quote do
      def user_token_factory do
        %Shoplist.Accounts.UserToken{
          token:
            <<116, 178, 23, 102, 6, 236, 44, 61, 247, 41, 107, 225, 205, 183, 10, 71, 42, 63, 189,
              109, 12, 117, 150, 8, 174, 2, 114, 53, 84, 26, 153, 172>>,
          context: "session",
          sent_to: nil
        }
      end
    end
  end
end

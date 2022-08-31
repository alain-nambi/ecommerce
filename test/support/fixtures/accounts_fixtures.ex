defmodule Ecommerce.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Ecommerce.Accounts` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        firstname: "some firstname",
        is_valid: true,
        lastname: "some lastname",
        mail: "some mail",
        password: "some password",
        phone: "some phone"
      })
      |> Ecommerce.Accounts.create_user()

    user
  end
end

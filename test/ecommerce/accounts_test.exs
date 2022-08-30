defmodule Ecommerce.AccountsTest do
  use Ecommerce.DataCase

  alias Ecommerce.Accounts

  describe "users" do
    alias Ecommerce.Accounts.User

    import Ecommerce.AccountsFixtures

    @invalid_attrs %{firstname: nil, is_valid: nil, lastname: nil, mail: nil, password: nil, phone: nil}

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{firstname: "some firstname", is_valid: true, lastname: "some lastname", mail: "some mail", password: "some password", phone: "some phone"}

      assert {:ok, %User{} = user} = Accounts.create_user(valid_attrs)
      assert user.firstname == "some firstname"
      assert user.is_valid == true
      assert user.lastname == "some lastname"
      assert user.mail == "some mail"
      assert user.password == "some password"
      assert user.phone == "some phone"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{firstname: "some updated firstname", is_valid: false, lastname: "some updated lastname", mail: "some updated mail", password: "some updated password", phone: "some updated phone"}

      assert {:ok, %User{} = user} = Accounts.update_user(user, update_attrs)
      assert user.firstname == "some updated firstname"
      assert user.is_valid == false
      assert user.lastname == "some updated lastname"
      assert user.mail == "some updated mail"
      assert user.password == "some updated password"
      assert user.phone == "some updated phone"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end
end

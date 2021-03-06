defmodule GW.UserTest do
  use GW.DataCase

  alias GW.User.Query

  describe "users" do
    alias GW.User

    @valid_attrs %{email: "test@example.com", password: "some encrypted_password", firstname: "some firstname", lastname: "some lastname"}
    @update_attrs %{email: "test2@example.com", password: "some updated encrypted_password", firstname: "some updated firstname", lastname: "some updated lastname"}
    @invalid_attrs %{email: nil, encrypted_password: nil, firstname: nil, lastname: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> User.Query.create_user()

      %{user | password: nil}
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert User.Query.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert User.Query.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = User.Query.create_user(@valid_attrs)
      assert user.email == "test@example.com"
      assert is_binary(user.encrypted_password)
      assert user.firstname == "some firstname"
      assert user.lastname == "some lastname"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = User.Query.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, user} = User.Query.update_user(user, @update_attrs)
      assert %User{} = user
      assert user.email == "test2@example.com"
      assert is_binary(user.encrypted_password)
      assert user.firstname == "some updated firstname"
      assert user.lastname == "some updated lastname"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = User.Query.update_user(user, @invalid_attrs)
      assert user == User.Query.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = User.Query.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> User.Query.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = User.Query.change_user(user)
    end
  end
end

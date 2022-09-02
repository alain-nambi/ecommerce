defmodule Ecommerce.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false

  require Logger

  alias Ecommerce.Repo

  alias Ecommerce.Accounts.User

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]

  """
  def list_users do
    Repo.all(User)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user!(id), do: Repo.get!(User, id)

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    process_attrs = field_process(attrs)

    %User{}
    |> User.signup_changeset(process_attrs)
    |> Repo.insert()
  end

  defp field_process(attrs) do
    # Transform the attributes of the family name into capital letters
    lastname = String.upcase(attrs["lastname"])

    # Transform the attributes of the first name into capital letters
    firstname =
      attrs["firstname"]
      |> String.split()
      |> Enum.map(&(String.capitalize/1))
      |> Enum.join(" ")


    # Replace the field [firstname, lastname] in attributs by a new field.
    new_attrs =
      Map.replace(attrs, "lastname", lastname)
      |> Map.replace!("firstname", firstname)

    Map.merge(attrs, new_attrs)
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    process_attrs = field_process(attrs)

    user
    |> User.changeset(process_attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a user.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{data: %User{}}

  """
  def change_user(%User{} = user, attrs \\ %{}) do
    User.changeset(user, attrs)
  end

  def signup_user(%User{} = user, attrs \\ %{}) do
    User.signup_changeset(user, attrs)
  end
end

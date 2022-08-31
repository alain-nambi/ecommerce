defmodule Ecommerce.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :firstname, :string
    field :lastname, :string
    field :mail, :string
    field :password, :string
    field :phone, :string
    field :is_valid, :boolean, default: false

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:lastname, :firstname, :mail, :password, :phone, :is_valid])
    |> validate_required([:lastname, :firstname, :mail, :password, :phone])
    |> unique_constraint(:mail)
  end

  def signup_changeset(user, attrs) do
    user
    |> cast(attrs, [:lastname, :firstname, :mail, :password, :phone, :is_valid])
    |> validate_required(:lastname, message: "Entrer votre nom de famille")
    |> validate_required(:firstname, message: "Entrer votre prénom")
    |> validate_required(:mail, message: "Entrer votre mail")
    |> validate_required(:password, message: "Entrer votre mot de passe")
    |> validate_required(:phone, message: "Entrer votre numéro de téléphone")
    |> unique_constraint(:mail)
  end
end

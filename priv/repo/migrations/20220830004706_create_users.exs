defmodule Ecommerce.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :lastname, :string
      add :firstname, :string
      add :mail, :string
      add :password, :string
      add :phone, :string
      add :is_valid, :boolean, default: false, null: false

      timestamps()
    end
  end
end

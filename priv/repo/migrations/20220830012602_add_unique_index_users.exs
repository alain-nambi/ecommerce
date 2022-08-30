defmodule Ecommerce.Repo.Migrations.AddUniqueIndexUsers do
  use Ecto.Migration

  def change do
    create unique_index(:users, [:mail])
  end
end

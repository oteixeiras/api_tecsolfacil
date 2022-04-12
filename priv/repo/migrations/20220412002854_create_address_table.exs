defmodule ApiTecsolfacil.Repo.Migrations.CreateAddressTable do
  use Ecto.Migration

  def change do
    create table(:adresses, primary_key: false) do
      add :id, :uuid, primary_key: true, null: false
      add :cep, :integer
      add :locality, :string
      add :uf, :string

      timestamps()
  end

  create unique_index(:adresses, [:id, :cep, :locality, :uf])
  end
end

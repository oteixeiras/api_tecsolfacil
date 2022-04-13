 defmodule ApiTecsolfacil.Repo.Migrations.CreateAddressTable do
  use Ecto.Migration

  def change do
    create table(:adresses) do
      add :cep, :string, null: false
      add :logradouro, :string
      add :complemento, :string
      add :bairro, :string
      add :localidade, :string, null: false
      add :uf, :string, null: false
      add :ddd, :integer

      timestamps()
    end

    create(unique_index(:adresses, [:cep]))
  end
end

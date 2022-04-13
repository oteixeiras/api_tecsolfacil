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


# defmodule SearchAddress.Repo.Migrations.CreateAddressesTable do
#   use Ecto.Migration

#   def change do
#     create table(:addresses) do
#       add(:cep, :string, null: false)
#       add(:logradouro, :string)
#       add(:complemento, :string)
#       add(:bairro, :string)
#       add(:localidade, :string, null: false)
#       add(:uf, :string, null: false)
#       add(:ddd, :integer)

#       timestamps()
#     end

#     create(unique_index(:addresses, [:cep]))
#   end
# end


# schema
# defmodule SearchAddress.Address do
#   use Ecto.Schema

#   import Ecto.Changeset

#   @required_params [:cep, :localidade, :uf]
#   @optional_params [:logradouro, :complemento, :bairro, :ddd]

#   @derive {Jason.Encoder,
#            only: [:id, :cep, :logradouro, :complemento, :bairro, :localidade, :uf, :ddd]}

#   schema "addresses" do
#     field :cep, :string
#     field :logradouro, :string
#     field :complemento, :string
#     field :bairro, :string
#     field :localidade, :string
#     field :uf, :string
#     field :ddd, :integer

#     timestamps()
#   end

#   def changeset(struct \\ %__MODULE__{}, params) do
#     struct
#     |> cast(params, @required_params ++ @optional_params)
#     |> validate_required(@required_params)
#     |> unique_constraint([:cep])
#   end
# end

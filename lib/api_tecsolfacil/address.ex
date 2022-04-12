defmodule ApiTecsolfacil.Address do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, Ecto.UUID, autogenerate: true}

  schema "adresses" do
    field :cep, :integer
    field :locality, :string
    field :uf, :string

    timestamps()
  end

  @required_params [:cep, :locality, :uf]

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
  end
end

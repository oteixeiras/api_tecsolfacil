defmodule ApiTecsolfacil.Address do
  use Ecto.Schema
  import Ecto.Changeset

  schema "adresses" do
    field :cep, :string
    field :logradouro, :string
    field :complemento, :string
    field :bairro, :string
    field :localidade, :string
    field :uf, :string
    field :ddd, :integer

    timestamps()
  end

  def build(params) do
    params
    |> changeset()
    |> apply_action(:insert)

  end

  @required_params [:cep, :localidade, :uf]
  @required_opt [:logradouro, :complemento, :bairro, :ddd]

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params ++ @required_opt)
    |> validate_required(@required_params)
    |> unique_constraint([:cep])
  end
end

 defmodule ApiTecsolfacil.ClientHttp.RequireData do
  @keys [:id, :cep, :locality, :uf]

  @enforce_keys @keys

  defstruct @keys

  def build({:ok, %{"cep" => cep, "localidade" => locality, "uf" => uf}}) do
  %{
      cep: cep,
      locality: locality,
      uf: uf
    }
  end
end

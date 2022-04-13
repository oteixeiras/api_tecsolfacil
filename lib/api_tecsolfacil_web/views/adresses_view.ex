defmodule ApiTecsolfacilWeb.AdressesView do
  use ApiTecsolfacilWeb, :view

  alias ApiTecsolfacil.Address

  def render("create.json", %{address: %Address{bairro: bairro, cep: cep, complemento: complemento, ddd: ddd, localidade: localidade, uf: uf, inserted_at: inserted_at}}) do
    %{
      cep: cep,
      complemento: complemento,
      bairro: bairro,
      localidade: localidade,
      uf: uf,
      ddd: ddd,
      inserted_at: inserted_at
    }
  end
end

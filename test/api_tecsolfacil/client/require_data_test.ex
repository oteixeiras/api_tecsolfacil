defmodule ApiTecsolfacil.Client.RequireDataTest do
  use ExUnit.Case
  alias ApiTecsolfacil.ClientHttp.RequireData

  describe "build/2" do
    test "when there struct valid, get address information" do
      params = {:ok,
      %{
        "bairro" => "Rio Preto",
        "cep" => "29938-540",
        "complemento" => "",
        "ddd" => "27",
        "localidade" => "São Mateus",
        "logradouro" => "Rua Minas Gerais",
        "uf" => "ES"
      }}

      response = RequireData.build(params)

      assert response == %{cep: "29938-540", locality: "São Mateus", uf: "ES"}
    end

    test "when there struct invalid, return error" do
      params = {:error, %{"erro" => true}}

      response = RequireData.build(params)

      assert response == {:error, %{"erro" => true}}
    end
  end
end

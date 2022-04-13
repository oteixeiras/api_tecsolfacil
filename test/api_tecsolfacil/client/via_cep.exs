defmodule ApiTecsolfacil.Client.ViaCep do
  use ExUnit.Case

  import Tesla.Mock

  alias ApiTecsolfacil.ClientHttp.ViaCep
  alias Tesla.Env

  describe "get_address/1" do
    test "when there is a valid cep, it returns a structure containing the address" do
      params = 65695000

      body = %{"cep" => "65695-000", "logadouro" => "", "complemento" => "", "bairro" => "", "uf" => "MA", "localidade" => "Fortuna", "ddd" => "99"}

      mock(fn %{method: :get, url: "https://viacep.com.br/ws/65695000/json"} ->
        %Env{status: 200, body: body}
      end)

      response = ViaCep.get_address(params)

      expected_response = {:ok, %{"cep" => "65695-000", "logadouro" => "", "complemento" => "", "bairro" => "", "uf" => "MA", "localidade" => "Fortuna", "ddd" => "99"}}

      assert response == expected_response
    end

    # test "When a cep with a valid but non-existent format is consulted" do
    #   params = 99999999

    #   body = %{"erro": "true"}

    #   mock(fn %{method: :get, url: "https://viacep.com.br/ws/99999999/json"} ->
    #     %Env{status: 200, body: body}
    #   end)

    #   response = ViaCep.get_address(params)

    #   expected_response = {:error, "Address not found"}

    #   assert response == expected_response
    # end

    test "When queried for an invalid format cep, return bad request" do
      params = 299385408 # 9 digits

      body = %{}

      mock(fn %{method: :get, url: "https://viacep.com.br/ws/299385408/json"} ->
        %Env{status: 400, body: body}
      end)

      response = ViaCep.get_address(params)

      expected_response = {:error, "Bad request: Format Invalid CEP"}

      assert response == expected_response
    end

    test "When queried for an invalid format cep, return error " do
      params = 299385408 # 9 digits

      body = {:econnrefused}

      mock(fn %{method: :get, url: "https://viacep.com.br/ws/299385408/json"} ->
        %Env{body: body}
      end)

      response = ViaCep.get_address(params)

      expected_response = {:error, :econnrefused}

      assert response == expected_response
    end
  end
end

defmodule ApiTecsolfacil.ClientHttp.ViaCep do
  use Tesla

  plug Tesla.Middleware.BaseUrl, "https://viacep.com.br"
  plug Tesla.Middleware.JSON

  def get_address(cep) do
    "/ws/#{cep}/json"
    |> get()
    |> handle_get()
  end

  defp handle_get({:ok, %Tesla.Env{body: %{"erro" => true}}}) do
    {:error, "Address not found"}
  end

  defp handle_get({:ok, %Tesla.Env{status: 200, body: body}}), do: {:ok, body}
  defp handle_get({:ok, %Tesla.Env{status: 400, body: _body}}), do: {:error, "Invalid CEP"}
  defp handle_get({:error, reason}), do: {:error, reason}
end

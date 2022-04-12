defmodule ApiTecsolfacil.ClientHttp.ViaCep do
  use Tesla

  plug Tesla.Middleware.BaseUrl, "https://viacep.com.br"
  plug Tesla.Middleware.JSON

  def get_address(cep) do
    "/ws/#{cep}/json"
    |> get()
    |> handle_response()
  end

  # defp handle_response({:ok, %Tesla.Env{status: 200, body: body}}) when body == {"error" => true}, do: {:error, "Address not found"}
  defp handle_response({:ok, %Tesla.Env{status: 200, body: body}}), do: {:ok, body}
  defp handle_response({:error, %Tesla.Env{body: reason}}), do: reason
end

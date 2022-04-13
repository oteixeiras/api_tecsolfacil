defmodule ApiTecsolfacil.Address.Create do
  alias ApiTecsolfacil.{Repo, Address}
  alias ApiTecsolfacil.ClientHttp.{ViaCep}

    def call(endpoint) do
      endpoint
      |> ViaCep.get_address()
      |> handle_response()
    end

    defp handle_response({:error, _reason} = error), do: error

    defp handle_response({:ok, content}) do
      content
      |> Address.build()
      |> handle_creation()
    end

  defp handle_creation({:error, _changeset} = error), do: error

  defp handle_creation({:ok, address}), do: Repo.insert(address)
end

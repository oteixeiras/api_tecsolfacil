defmodule ApiTecsolfacil.Address.FormateInputCep do

  def call(cep) do
    to_string(cep)
    |> handle_length()
  end

  defp handle_length(endpoint) do
    case String.length(endpoint) do
      8 -> handle_output(endpoint)
      _auther -> {:error, "invalid number of characters"}
    end
  end

  defp handle_output(cep_string) do
    {cep, _content} = Integer.parse(cep_string)
    cep
  end
end

defmodule ApiTecsolfacil.Address.Get do
  alias ApiTecsolfacil.{Repo, Address}

  def call(cep) do
    case Repo.get(Address, cep) do
      nil -> {:error, "Address not found"}
      address -> {:ok, address}
    end
  end
end

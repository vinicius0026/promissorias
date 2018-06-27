defmodule Promissorias.Customers.Customer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "customers" do
    field(:address, :string)
    field(:cpf, :string)
    field(:name, :string)
    field(:phone, :string)

    timestamps()
  end

  @doc false
  def changeset(customer, attrs) do
    customer
    |> cast(attrs, [:name, :cpf, :phone, :address])
    |> validate_required([:name, :cpf, :phone, :address])
    |> validate_cpf(:cpf)
    |> unique_constraint(:cpf)
  end

  defp validate_cpf(changeset, field, options \\ []) do
    validate_change(changeset, field, fn _, value ->
      case Brcpfcnpj.cpf_valid?(%Cpf{number: value}) do
        true -> []
        false -> [{field, options[:message] || "Invalid CPF"}]
      end
    end)
  end
end

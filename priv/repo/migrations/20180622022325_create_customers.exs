defmodule Promissorias.Repo.Migrations.CreateCustomers do
  use Ecto.Migration

  def change do
    create table(:customers) do
      add(:name, :string)
      add(:cpf, :string)
      add(:phone, :string)
      add(:address, :string)

      timestamps()
    end

    create(unique_index(:customers, [:cpf]))
  end
end

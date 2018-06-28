defmodule Promissorias.Repo.Migrations.CreatePromissoryNotes do
  use Ecto.Migration

  def change do
    create table(:promissory_notes) do
      add(:amount, :decimal)
      add(:customer_id, references(:customers, on_delete: :nothing))

      timestamps()
    end

    create(index(:promissory_notes, [:customer_id]))
  end
end

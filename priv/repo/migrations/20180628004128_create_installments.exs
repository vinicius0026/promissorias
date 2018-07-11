defmodule Promissorias.Repo.Migrations.CreateInstallments do
  use Ecto.Migration

  def change do
    create table(:installments) do
      add(:amount, :decimal, precision: 10, scale: 2)
      add(:paid_amount, :decimal)
      add(:due_date, :date)
      add(:barcode, :string)
      add(:promissory_note_id, references(:promissory_notes, on_delete: :nothing))

      timestamps()
    end

    create(index(:installments, [:promissory_note_id]))
  end
end

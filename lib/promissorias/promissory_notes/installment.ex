defmodule Promissorias.PromissoryNotes.Installment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "installments" do
    field(:amount, :decimal)
    field(:barcode, :string)
    field(:due_date, :date)
    field(:paid_amount, :decimal, default: 0)

    belongs_to(:promissory_note, Promissorias.PromissoryNotes.PromissoryNote)

    timestamps()
  end

  @doc false
  def changeset(installment, attrs) do
    installment
    |> cast(attrs, [:amount, :due_date])
    |> validate_required([:amount, :due_date])
    |> put_barcode(:barcode)
  end

  defp put_barcode(changeset, field) do
    barcode = UUID.uuid4()

    changeset
    |> put_change(field, barcode)
  end
end

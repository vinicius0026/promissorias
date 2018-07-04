defmodule PromissoriasWeb.InstallmentView do
  use PromissoriasWeb, :view
  alias PromissoriasWeb.InstallmentView

  def render("index.json", %{installments: installments}) do
    %{data: render_many(installments, InstallmentView, "installment.json")}
  end

  def render("show.json", %{installment: installment}) do
    %{data: render_one(installment, InstallmentView, "installment.json")}
  end

  def render("installment.json", %{installment: installment}) do
    %{id: installment.id,
      amount: installment.amount,
      paid_amount: installment.paid_amount,
      due_date: installment.due_date,
      barcode: installment.barcode}
  end
end

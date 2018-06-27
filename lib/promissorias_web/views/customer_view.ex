defmodule PromissoriasWeb.CustomerView do
  use PromissoriasWeb, :view
  alias PromissoriasWeb.CustomerView

  def render("index.json", %{customers: customers}) do
    %{data: render_many(customers, CustomerView, "customer.json")}
  end

  def render("show.json", %{customer: customer}) do
    %{data: render_one(customer, CustomerView, "customer.json")}
  end

  def render("customer.json", %{customer: customer}) do
    %{
      id: customer.id,
      name: customer.name,
      cpf: customer.cpf,
      phone: customer.phone,
      address: customer.address
    }
  end
end

defmodule PromissoriasWeb.InstallmentControllerTest do
  use PromissoriasWeb.ConnCase

  alias Promissorias.PromissoryNotes
  alias Promissorias.PromissoryNotes.Installment

  @create_attrs %{amount: "120.5", barcode: "some barcode", due_date: ~D[2010-04-17], paid_amount: "120.5"}
  @update_attrs %{amount: "456.7", barcode: "some updated barcode", due_date: ~D[2011-05-18], paid_amount: "456.7"}
  @invalid_attrs %{amount: nil, barcode: nil, due_date: nil, paid_amount: nil}

  def fixture(:installment) do
    {:ok, installment} = PromissoryNotes.create_installment(@create_attrs)
    installment
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all installments", %{conn: conn} do
      conn = get conn, Routes.installment_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create installment" do
    test "renders installment when data is valid", %{conn: conn} do
      conn = post conn, Routes.installment_path(conn, :create), installment: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, Routes.installment_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "amount" => "120.5",
        "barcode" => "some barcode",
        "due_date" => "2010-04-17",
        "paid_amount" => "120.5"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, Routes.installment_path(conn, :create), installment: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update installment" do
    setup [:create_installment]

    test "renders installment when data is valid", %{conn: conn, installment: %Installment{id: id} = installment} do
      conn = put conn, Routes.installment_path(conn, :update, installment), installment: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, Routes.installment_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "amount" => "456.7",
        "barcode" => "some updated barcode",
        "due_date" => "2011-05-18",
        "paid_amount" => "456.7"}
    end

    test "renders errors when data is invalid", %{conn: conn, installment: installment} do
      conn = put conn, Routes.installment_path(conn, :update, installment), installment: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete installment" do
    setup [:create_installment]

    test "deletes chosen installment", %{conn: conn, installment: installment} do
      conn = delete conn, Routes.installment_path(conn, :delete, installment)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, Routes.installment_path(conn, :show, installment)
      end
    end
  end

  defp create_installment(_) do
    installment = fixture(:installment)
    {:ok, installment: installment}
  end
end

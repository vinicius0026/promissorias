defmodule PromissoriasWeb.PromissoryNoteControllerTest do
  use PromissoriasWeb.ConnCase

  alias Promissorias.PromissoryNotes
  alias Promissorias.PromissoryNotes.PromissoryNote

  @create_attrs %{amount: "120.5"}
  @update_attrs %{amount: "456.7"}
  @invalid_attrs %{amount: nil}

  def fixture(:promissory_note) do
    {:ok, promissory_note} = PromissoryNotes.create_promissory_note(@create_attrs)
    promissory_note
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all promissory_notes", %{conn: conn} do
      conn = get(conn, Routes.promissory_note_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create promissory_note" do
    test "renders promissory_note when data is valid", %{conn: conn} do
      conn =
        post(conn, Routes.promissory_note_path(conn, :create), promissory_note: @create_attrs)

      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.promissory_note_path(conn, :show, id))
      assert json_response(conn, 200)["data"] == %{"id" => id, "amount" => "120.5"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn =
        post(conn, Routes.promissory_note_path(conn, :create), promissory_note: @invalid_attrs)

      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update promissory_note" do
    setup [:create_promissory_note]

    test "renders promissory_note when data is valid", %{
      conn: conn,
      promissory_note: %PromissoryNote{id: id} = promissory_note
    } do
      conn =
        put(
          conn,
          Routes.promissory_note_path(conn, :update, promissory_note),
          promissory_note: @update_attrs
        )

      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.promissory_note_path(conn, :show, id))
      assert json_response(conn, 200)["data"] == %{"id" => id, "amount" => "456.7"}
    end

    test "renders errors when data is invalid", %{conn: conn, promissory_note: promissory_note} do
      conn =
        put(
          conn,
          Routes.promissory_note_path(conn, :update, promissory_note),
          promissory_note: @invalid_attrs
        )

      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete promissory_note" do
    setup [:create_promissory_note]

    test "deletes chosen promissory_note", %{conn: conn, promissory_note: promissory_note} do
      conn = delete(conn, Routes.promissory_note_path(conn, :delete, promissory_note))
      assert response(conn, 204)

      assert_error_sent(404, fn ->
        get(conn, Routes.promissory_note_path(conn, :show, promissory_note))
      end)
    end
  end

  defp create_promissory_note(_) do
    promissory_note = fixture(:promissory_note)
    {:ok, promissory_note: promissory_note}
  end
end

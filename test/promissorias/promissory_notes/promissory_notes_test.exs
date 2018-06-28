defmodule Promissorias.PromissoryNotesTest do
  use Promissorias.DataCase

  alias Promissorias.PromissoryNotes

  describe "promissory_notes" do
    alias Promissorias.PromissoryNotes.PromissoryNote

    @valid_attrs %{amount: "120.5"}
    @update_attrs %{amount: "456.7"}
    @invalid_attrs %{amount: nil}

    def promissory_note_fixture(attrs \\ %{}) do
      {:ok, promissory_note} =
        attrs
        |> Enum.into(@valid_attrs)
        |> PromissoryNotes.create_promissory_note()

      promissory_note
    end

    test "list_promissory_notes/0 returns all promissory_notes" do
      promissory_note = promissory_note_fixture()
      assert PromissoryNotes.list_promissory_notes() == [promissory_note]
    end

    test "get_promissory_note!/1 returns the promissory_note with given id" do
      promissory_note = promissory_note_fixture()
      assert PromissoryNotes.get_promissory_note!(promissory_note.id) == promissory_note
    end

    test "create_promissory_note/1 with valid data creates a promissory_note" do
      assert {:ok, %PromissoryNote{} = promissory_note} =
               PromissoryNotes.create_promissory_note(@valid_attrs)

      assert promissory_note.amount == Decimal.new("120.5")
    end

    test "create_promissory_note/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = PromissoryNotes.create_promissory_note(@invalid_attrs)
    end

    test "update_promissory_note/2 with valid data updates the promissory_note" do
      promissory_note = promissory_note_fixture()

      assert {:ok, %PromissoryNote{} = promissory_note} =
               PromissoryNotes.update_promissory_note(promissory_note, @update_attrs)

      assert promissory_note.amount == Decimal.new("456.7")
    end

    test "update_promissory_note/2 with invalid data returns error changeset" do
      promissory_note = promissory_note_fixture()

      assert {:error, %Ecto.Changeset{}} =
               PromissoryNotes.update_promissory_note(promissory_note, @invalid_attrs)

      assert promissory_note == PromissoryNotes.get_promissory_note!(promissory_note.id)
    end

    test "delete_promissory_note/1 deletes the promissory_note" do
      promissory_note = promissory_note_fixture()
      assert {:ok, %PromissoryNote{}} = PromissoryNotes.delete_promissory_note(promissory_note)

      assert_raise Ecto.NoResultsError, fn ->
        PromissoryNotes.get_promissory_note!(promissory_note.id)
      end
    end

    test "change_promissory_note/1 returns a promissory_note changeset" do
      promissory_note = promissory_note_fixture()
      assert %Ecto.Changeset{} = PromissoryNotes.change_promissory_note(promissory_note)
    end
  end
end

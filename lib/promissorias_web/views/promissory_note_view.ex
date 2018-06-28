defmodule PromissoriasWeb.PromissoryNoteView do
  use PromissoriasWeb, :view
  alias PromissoriasWeb.PromissoryNoteView

  def render("index.json", %{promissory_notes: promissory_notes}) do
    %{data: render_many(promissory_notes, PromissoryNoteView, "promissory_note.json")}
  end

  def render("show.json", %{promissory_note: promissory_note}) do
    %{data: render_one(promissory_note, PromissoryNoteView, "promissory_note.json")}
  end

  def render("promissory_note.json", %{promissory_note: promissory_note}) do
    %{id: promissory_note.id, amount: promissory_note.amount}
  end
end

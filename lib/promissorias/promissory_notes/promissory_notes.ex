defmodule Promissorias.PromissoryNotes do
  @moduledoc """
  The PromissoryNotes context.
  """

  import Ecto.Query, warn: false
  alias Promissorias.Repo

  alias Promissorias.PromissoryNotes.PromissoryNote
  alias Promissorias.Customers.Customer

  @doc """
  Returns the list of promissory_notes.

  ## Examples

      iex> list_promissory_notes()
      [%PromissoryNote{}, ...]

  """
  def list_promissory_notes do
    Repo.all(PromissoryNote)
  end

  @doc """
  Gets a single promissory_note.

  Raises `Ecto.NoResultsError` if the Promissory note does not exist.

  ## Examples

      iex> get_promissory_note!(123)
      %PromissoryNote{}

      iex> get_promissory_note!(456)
      ** (Ecto.NoResultsError)

  """
  def get_promissory_note!(id), do: Repo.get!(PromissoryNote, id)

  @doc """
  Creates a promissory_note.

  ## Examples

      iex> create_promissory_note(%{field: value})
      {:ok, %PromissoryNote{}}

      iex> create_promissory_note(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_promissory_note(%Customer{} = customer, attrs \\ %{}) do
    %PromissoryNote{}
    |> PromissoryNote.changeset(attrs)
    |> put_customer(customer)
    |> Repo.insert()
  end

  defp put_customer(changeset, customer) do
    Ecto.Changeset.put_assoc(changeset, :customer, customer)
  end

  @doc """
  Updates a promissory_note.

  ## Examples

      iex> update_promissory_note(promissory_note, %{field: new_value})
      {:ok, %PromissoryNote{}}

      iex> update_promissory_note(promissory_note, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_promissory_note(%PromissoryNote{} = promissory_note, attrs) do
    promissory_note
    |> PromissoryNote.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a PromissoryNote.

  ## Examples

      iex> delete_promissory_note(promissory_note)
      {:ok, %PromissoryNote{}}

      iex> delete_promissory_note(promissory_note)
      {:error, %Ecto.Changeset{}}

  """
  def delete_promissory_note(%PromissoryNote{} = promissory_note) do
    Repo.delete(promissory_note)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking promissory_note changes.

  ## Examples

      iex> change_promissory_note(promissory_note)
      %Ecto.Changeset{source: %PromissoryNote{}}

  """
  def change_promissory_note(%PromissoryNote{} = promissory_note) do
    PromissoryNote.changeset(promissory_note, %{})
  end

  alias Promissorias.PromissoryNotes.Installment

  @doc """
  Returns the list of installments.

  ## Examples

      iex> list_installments()
      [%Installment{}, ...]

  """
  def list_installments do
    Repo.all(Installment)
  end

  @doc """
  Gets a single installment.

  Raises `Ecto.NoResultsError` if the Installment does not exist.

  ## Examples

      iex> get_installment!(123)
      %Installment{}

      iex> get_installment!(456)
      ** (Ecto.NoResultsError)

  """
  def get_installment!(id), do: Repo.get!(Installment, id)

  @doc """
  Creates a installment.

  ## Examples

      iex> create_installment(%{field: value})
      {:ok, %Installment{}}

      iex> create_installment(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_installment(attrs \\ %{}) do
    %Installment{}
    |> Installment.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a installment.

  ## Examples

      iex> update_installment(installment, %{field: new_value})
      {:ok, %Installment{}}

      iex> update_installment(installment, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_installment(%Installment{} = installment, attrs) do
    installment
    |> Installment.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Installment.

  ## Examples

      iex> delete_installment(installment)
      {:ok, %Installment{}}

      iex> delete_installment(installment)
      {:error, %Ecto.Changeset{}}

  """
  def delete_installment(%Installment{} = installment) do
    Repo.delete(installment)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking installment changes.

  ## Examples

      iex> change_installment(installment)
      %Ecto.Changeset{source: %Installment{}}

  """
  def change_installment(%Installment{} = installment) do
    Installment.changeset(installment, %{})
  end
end

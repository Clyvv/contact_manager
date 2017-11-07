defmodule ContactManager.TitleController do
  use ContactManager.Web, :controller

  alias ContactManager.Title

  def index(conn, _params) do
    titles = Repo.all(Title)
    render conn, "index.html", titles: titles
  end

  def new(conn, _params) do
    changeset = Title.changeset(%Title{})
    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"title" => title_params}) do
    changeset = %Title{} |> Title.changeset(title_params)
    case Repo.insert(changeset) do
      {:ok, title} ->
        conn
        |> put_flash(:info, "#{title.title} created!")
        |> redirect(to: title_path(conn, :show, title))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def update(conn, %{"id" => id, "title" => title_params}) do
    title = Repo.get!(Title, id)
    changeset = Title.changeset(title, title_params)

    case Repo.update(changeset) do
      {:ok, _title} ->
        conn
        |> put_flash(:info, "Title edited successfully.")
        |> redirect(to: title_path(conn, :index))
      {:error, changeset} ->
        render(conn, "edit.html", title: title, changeset: changeset)
    end
  end

  def edit(conn, %{"id" => id}) do
    title = Repo.get!(Title, id)
    changeset = Title.changeset(title)
    render conn, "edit.html", changeset: changeset, title: title
  end

  def show(conn, %{"id" => id}) do
    title = Repo.get!(Title, id)
    render(conn, "show.html", title: title)
  end

  def delete(conn, %{"id" => id}) do
    title = Repo.get!(Title, id)
    Repo.delete!(title)
    conn
    |> put_flash(:info, "Title deleted successfully.")
    |> redirect(to: title_path(conn, :index))
  end
end

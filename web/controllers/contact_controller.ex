defmodule ContactManager.ContactController do
  use ContactManager.Web, :controller
  import Ecto.Query, only: [from: 2]

  alias ContactManager.{User, Contact, Title}

  def index(conn, _params) do
    contacts = from(c in Contact,
                    join: t in assoc(c, :title),
                    where: c.user_id == 1,
                    preload: [title: t]) |> Repo.all() 
    render conn, "index.html", contacts: contacts
  end

  def new(conn, _params) do
    changeset = Contact.changeset(%Contact{})
    titles = Repo.all(Title)
    render conn, "new.html", changeset: changeset, titles: titles
  end

  def create(conn, %{"contact" => contact_params}) do
    user = Repo.get!(User, "1")
    title = Repo.get!(Title, Map.get(contact_params, "title_id"))
    contact = build_assoc(title, :contacts, Enum.map(contact_params, fn({key, value}) -> {String.to_atom(key), value} end))
    contact = build_assoc(user, :contacts, Map.from_struct contact)
    changeset = Contact.changeset(contact)

    case Repo.insert(changeset) do
      {:ok, contact} ->
        conn
        |> put_flash(:info, "#{contact.firstname} #{contact.lastname} created!")
        |> redirect(to: contact_path(conn, :show, contact))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset, page: "new")
    end
  end

  def update(conn, %{"id" => id, "contact" => contact_params}) do
    contact = Repo.get!(Contact, id) |>  Repo.preload(title: :contacts)
    changeset = Contact.changeset(contact, contact_params)

    case Repo.update(changeset) do
      {:ok, _contact} ->
        conn
        |> put_flash(:info, "Contact edited successfully.")
        |> redirect(to: contact_path(conn, :show, contact))
      {:error, changeset} ->
        render(conn, "edit.html", contact: contact, changeset: changeset)
    end
  end

  def edit(conn, %{"id" => id}) do
    contact = Repo.get!(Contact, id)
    changeset = Contact.changeset(contact)
    titles = Repo.all(Title)
    render conn, "edit.html", changeset: changeset, contact: contact, titles: titles
  end

  def show(conn, %{"id" => id}) do
    contact = Repo.get!(Contact, id) |> Repo.preload([:title])
    IO.inspect(contact)
    render(conn, "show.html", contact: contact)
  end

  def delete(conn, %{"id" => id}) do
    contact = Repo.get!(Contact, id)
    Repo.delete!(contact)
    conn
    |> put_flash(:info, "Contact deleted successfully.")
    |> redirect(to: contact_path(conn, :index))
  end
end

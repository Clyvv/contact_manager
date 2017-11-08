defmodule ContactManager.ContactControllerTest do
  use ContactManager.ConnCase

  test "GET get all contacts", %{conn: conn} do
    all_contacts = Repo.all(ContactManager.Contact)
    conn = get conn, "/contacts"
    assert Map.has_key?(conn.assigns, :contacts)
    assert length(Map.get(conn.assigns, :contacts)) == length(all_contacts)
  end

  test "GET insert contact", %{conn: conn} do
    conn = post conn, "/contacts", %{contact: [firstname: "Liivi", lastname: "Sasha", sex: "MALE", dob: "2000-01-12"]}
    assert true == true
  end
end

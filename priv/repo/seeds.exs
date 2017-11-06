alias ContactManager.{Repo, User, Title}

[%{fullname: "Clive Mawoko", email: "cmawoko@gmail.com", password: "clive", is_admin: true},
 %{fullname: "Tino Maponda", email: "tmaponda@gmail.com", password: "tino", is_admin: false}]
|> Enum.map(fn user_data -> User.changeset(%User{}, user_data) end)
|> Enum.each(fn changeset -> Repo.insert!(changeset) end)

[%{title: "Mr"},
%{title: "Mrs"}]
|> Enum.map(fn title_data -> Title.changeset(%Title{}, title_data) end)
|> Enum.each(fn changeset -> Repo.insert!(changeset) end)
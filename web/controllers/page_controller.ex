defmodule ContactManager.PageController do
  use ContactManager.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end

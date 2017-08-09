defmodule Budget.UserController do
  use Budget.Web, :controller

  def index(conn, _params) do
    users = Repo.all(Budget.User)
    render conn, "index.html", users: users
  end

  def show(conn, %{"id" => id}) do
    user = Repo.get(Budget.User, id)
    render conn, "show.html", user: user
  end
end

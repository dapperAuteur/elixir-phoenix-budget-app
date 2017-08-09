defmodule Budget.PageController do
  use Budget.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end

defmodule Budget.UserView do
  use Budget.Web, :view
  alias Budget.User

  def first_name(%User{name: name}) do
    name
    |> String.split(" ")
    |> Enum.at(0)
  end
end

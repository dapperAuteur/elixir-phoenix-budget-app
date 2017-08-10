defmodule Budget.Transaction do
  use Budget.Web, :model

  schema "transactions" do
    field :vendor, :string
    field :amount, :float
    field :balance, :float
    field :credit, :boolean, default: false
    field :debit, :boolean, default: false
    field :transfer, :boolean, default: false
    field :description, :string
    belongs_to :user, Budget.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  @required_fields ~w(vendor amount description)
  @optional_fields ~w()

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end

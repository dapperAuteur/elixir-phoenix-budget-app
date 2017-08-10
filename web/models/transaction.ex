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
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:vendor, :amount, :balance, :credit, :debit, :transfer, :description])
    |> validate_required([:vendor, :amount, :balance, :credit, :debit, :transfer, :description])
  end
end

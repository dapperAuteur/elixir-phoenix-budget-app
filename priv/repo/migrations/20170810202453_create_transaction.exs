defmodule Budget.Repo.Migrations.CreateTransaction do
  use Ecto.Migration

  def change do
    create table(:transactions) do
      add :vendor, :string
      add :amount, :float
      add :balance, :float
      add :credit, :boolean, default: false, null: false
      add :debit, :boolean, default: false, null: false
      add :transfer, :boolean, default: false, null: false
      add :description, :text
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end
    create index(:transactions, [:user_id])

  end
end

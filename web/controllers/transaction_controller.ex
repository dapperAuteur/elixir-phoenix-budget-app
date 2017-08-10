defmodule Budget.TransactionController do
  use Budget.Web, :controller

  alias Budget.Transaction

  def index(conn, _params, user) do
    transactions = Repo.all(user_transactions(user))
    render(conn, "index.html", transactions: transactions)
  end

  def new(conn, _params, user) do
    changeset =
      user
      |> build_assoc(:transactions)
      |> Transaction.changeset()

    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"transaction" => transaction_params}, user) do
    changeset =
      user
      |> build_assoc(:transactions)
      |> Transaction.changeset(transaction_params)

    case Repo.insert(changeset) do
      {:ok, _transaction} ->
        conn
        |> put_flash(:info, "Transaction created successfully.")
        |> redirect(to: transaction_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}, user) do
    transaction = Repo.get!(user_transactions(user), id)
    render(conn, "show.html", transaction: transaction)
  end

  def edit(conn, %{"id" => id}, user) do
    transaction = Repo.get!(user_transactions(user), id)
    changeset = Transaction.changeset(transaction)
    render(conn, "edit.html", transaction: transaction, changeset: changeset)
  end

  def update(conn, %{"id" => id, "transaction" => transaction_params}, user) do
    transaction = Repo.get!(user_transactions(user), id)
    changeset = Transaction.changeset(transaction, transaction_params)

    case Repo.update(changeset) do
      {:ok, transaction} ->
        conn
        |> put_flash(:info, "Transaction updated successfully.")
        |> redirect(to: transaction_path(conn, :show, transaction))
      {:error, changeset} ->
        render(conn, "edit.html", transaction: transaction, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}, user) do
    transaction = Repo.get!(user_transactions(user), id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(transaction)

    conn
    |> put_flash(:info, "Transaction deleted successfully.")
    |> redirect(to: transaction_path(conn, :index))
  end

  def action(conn, _) do
    apply(__MODULE__, action_name(conn),
          [conn, conn.params, conn.assigns.current_user])
  end

  defp user_transactions(user) do
    assoc(user, :transactions)
  end
end

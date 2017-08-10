defmodule Budget.TransactionTest do
  use Budget.ModelCase

  alias Budget.Transaction

  @valid_attrs %{amount: "120.5", balance: "120.5", credit: true, debit: true, description: "some content", transfer: true, vendor: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Transaction.changeset(%Transaction{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Transaction.changeset(%Transaction{}, @invalid_attrs)
    refute changeset.valid?
  end
end

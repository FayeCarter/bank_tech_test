require_relative 'transaction'

class Account

  attr_reader :transaction_history

  def initialize
    @balance = 0.00
    @transaction_history = []
  end

  def display_balance
    "£#{format("%<balance>.2f", balance: @balance)}"
  end

  def deposit(value)
    transaction = Transaction.new(balance: @balance, credit: value)
    transaction_history.insert(0, transaction)
    @balance += value
  end

  def withdraw(value)
    transaction = Transaction.new(balance: @balance, debit: value)
    transaction_history.insert(0, transaction)
    @balance -= value
  end

  def print_statement
    "date || credit || debit || balance"
  end

end

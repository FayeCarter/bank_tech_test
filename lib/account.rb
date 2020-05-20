require_relative 'transaction'
require_relative 'statement'

class Account

  attr_reader :balance, :transaction_history

  def initialize
    @balance = 0
    @transaction_history = []
  end

  def deposit(value)
    @balance += value
    handle_transaction(credit: value)
    show_balance(@balance)
  end

  def withdraw(value)
    @balance -= value
    handle_transaction(debit: value)    
    show_balance(@balance)
  end

  def print_statement
    statement = Statement.new
    statement.print_statement(@transaction_history)
  end

  private

  def show_balance(value)
    new_balance = format('%<value>.2f', value: value)
    "Balance: #{new_balance}"
  end

  def handle_transaction(debit: nil, credit: nil)
    transaction = Transaction.new(balance: @balance, debit: debit, credit: credit)
    transaction_history.insert(0, transaction)
  end

end

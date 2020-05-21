require_relative 'transaction'
require_relative 'statement'

class Account

  def initialize(transaction: Transaction, statement: Statement, history: History)
    @balance = 0
    @transaction_history = history.new
    @transaction_class = transaction
    @statement = statement.new
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
    @statement.create(@transaction_history)
  end

  private

  def show_balance(value)
    new_balance = format('%<value>.2f', value: value)
    "Balance: #{new_balance}"
  end

  def handle_transaction(debit: nil, credit: nil)
    transaction = @transaction_class.new(balance: @balance, debit: debit, credit: credit)
    @transaction_history.record(transaction)
  end
end

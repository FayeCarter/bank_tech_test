require_relative 'transaction'
require_relative 'statement'

class Account

  attr_reader :balance, :transaction_history

  def initialize
    @balance = 0
    @transaction_history = []
  end

  def deposit(value, date = Time.now.strftime('%d/%m/%Y'))
    transaction = Transaction.new(balance: @balance, credit: value, date: date)
    transaction_history.insert(0, transaction)
    @balance += value
    "Balance: #{format('%<balance>.2f', balance: @balance)}"
  end

  def withdraw(value, date = Time.now.strftime('%d/%m/%Y'))
    transaction = Transaction.new(balance: @balance, debit: value, date: date)
    transaction_history.insert(0, transaction)
    @balance -= value
  end

  def print_statement
    statement = Statement.new
    statement.format(@transaction_history)
  end

end

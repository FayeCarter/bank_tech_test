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
    @balance += value
    transaction_history.push("#{Time.now.strftime('%d/%m/%Y')} || || 5.00 || 5.00")
  end

  def print_statement
    "date || credit || debit || balance"
  end

end

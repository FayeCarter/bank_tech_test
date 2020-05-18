class Account

  def initialize
    @balance = 0.00
  end

  def display_balance
    "£#{format("%<balance>.2f", balance: @balance)}"
  end

end

class Transaction

  attr_reader :date, :debit, :credit, :balance

  def initialize(credit: nil, debit: nil, balance:)
    @date = Time.now.strftime('%d/%m/%Y')
    @credit = credit
    @debit = debit
    @balance = calculate(balance)
  end

  def calculate(balance)
    if @credit
      balance += credit
    elsif @debit
      balance -= debit
    else
      balance
    end
  end

end

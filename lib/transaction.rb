class Transaction

  attr_reader :date, :debit, :credit, :balance

  def initialize(credit: nil, debit: nil, balance:)
    @date = Time.now.strftime('%d/%m/%Y')
    @credit = float(credit)
    @debit = float(debit)
    @balance = calculate(balance, credit, debit)
  end

  private

  def float(value)
    return value == nil ? value : format("%<value>.2f", value: value)
  end

  def calculate(balance, credit, debit)
    if credit
      float(balance + credit)
    elsif debit
      float(balance - debit)
    else
      float(balance)
    end
  end

end

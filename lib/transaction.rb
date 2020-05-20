class Transaction

  attr_reader :date, :debit, :credit, :balance

  def initialize(credit: nil, debit: nil, balance:)
    @date = Time.now.strftime('%d/%m/%Y')
    @credit = float(credit)
    @debit = float(debit)
    @balance = float(balance)
  end

  private

  def float(value)
    return value.nil? ? value : format("%<value>.2f ", value: value)
  end

end

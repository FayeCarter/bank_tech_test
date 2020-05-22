class Transaction

  attr_reader :date, :debit, :credit, :balance

  def initialize(credit: nil, debit: nil, balance:)
    @date = Time.now.strftime('%d/%m/%Y')
    @credit = to_currency(credit)
    @debit = to_currency(debit)
    @balance = to_currency(balance)
  end

  private

  def to_currency(value)
    return value.nil? ? value : format("%<value>.2f ", value: value)
  end

end

class Transaction

  attr_reader :date, :debit, :credit
  
  def initialize(credit: nil, debit: nil)
    @date = Time.now.strftime('%d/%m/%Y')
    @credit = credit
    @debit = debit
  end

end

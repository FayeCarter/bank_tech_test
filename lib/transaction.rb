class Transaction

  def initialize(credit = nil, debit = nil)
    @date = Time.now.strftime('%d/%m/%Y')
    @credit = credit
    @debit = debit
  end

  def date
    @date
  end

  def credit
    @credit
  end

  def debit
    @credit
  end

end
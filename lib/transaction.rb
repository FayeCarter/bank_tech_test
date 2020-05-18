class Transaction

  def initialize(credit)
    @credit = credit
  end

  def date
    Time.now.strftime('%d/%m/%Y')
  end

  def credit
    @credit
  end

end
class Transaction

  def initialize(credit = nil)
    @credit = credit
    @date = Time.now.strftime('%d/%m/%Y')
  end

  def date
    @date
  end

  def credit
    @credit
  end

end
class History

  def initialize
    @transactions = []
  end

  def record(transaction)
    @transactions.insert(0, transaction)
  end

  def show
    @transactions
  end

end

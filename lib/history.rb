class History

  def initialize
    @transactions = []
  end

  def record(transaction)
    @transactions << transaction
  end

  def show
    @transactions
  end

end

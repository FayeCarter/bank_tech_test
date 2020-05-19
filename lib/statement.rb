class Statement

  def initialize
    @statement = "date || credit || debit || balance"
    @transactions = []
  end

  def format(transactions)
    transactions.each { |record|
      transaction = "#{record.date} || #{record.credit} || #{record.debit} || #{record.balance}"
      @transactions.push(transaction)
    }
    @transactions
  end

  def print
    @transactions.each { |transaction|
      @statement += "\n#{transaction}"
    }
    @statement
  end

end

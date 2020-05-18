class Statement

  def initialize
    @header = "date || credit || debit || balance"
  end

  def format(transactions)
    display = []
    transactions.each { |record|
      transaction = "#{record.date} || #{record.credit} || #{record.debit} || #{record.balance}"
      display.push(transaction)
    }
    display
  end

  def print
    @header
  end

end

class Statement

  attr_reader :printout

  def initialize
    @printout = "date || credit || debit || balance"
  end

  def format(transactions)
    transactions.each { |record|
      transaction = "#{record.date} || #{record.credit} || #{record.debit} || #{record.balance}"
      printout << "\n#{transaction}"
    }
    print printout
  end

end

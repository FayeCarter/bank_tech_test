class Statement

  def print_statement(transactions = nil)
    if transactions
      print "date || credit || debit || balance"
      transactions.each { |record|
        print "\n#{record.date} || #{record.credit} || #{record.debit} || #{record.balance}"
      }
    else
      "date || credit || debit || balance"
    end
  end

end

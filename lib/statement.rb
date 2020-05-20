class Statement

  def print_statement(transactions = nil)
    display = "date || credit || debit || balance"

    transactions&.each { |row|
      display << "\n#{row.date} || #{row.credit}|| #{row.debit}|| #{row.balance}"        
    }

    print display
  end

end

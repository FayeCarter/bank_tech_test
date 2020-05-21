class Statement

  STATAMENT_HEADER = "date || credit || debit || balance"

  def create(transactions = nil)
    display = ""
    transactions&.each { |row|
      display << "\n#{row.date} || #{row.credit}|| #{row.debit}|| #{row.balance}"        
    }
    print Statement::STATAMENT_HEADER + display
  end
end

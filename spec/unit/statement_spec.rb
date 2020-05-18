require 'statement'

describe Statement do
  
  it 'initializes with column names' do
    statement = Statement.new
    expect(statement.print).to eq "date || credit || debit || balance"
  end
  
end

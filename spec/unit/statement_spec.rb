require 'statement'

describe Statement do
  
  it 'initializes with column names' do
    statement = Statement.new
    expect(statement.print).to eq "date || credit || debit || balance"
  end

  describe "#format" do
    it 'takes transactions and adds formatting' do
      statement = Statement.new
      transaction = double(
        date: '18/05/2020',
        credit: '100.00',
        debit: nil,
        balance: '200.00'
      )
      expect(statement.format([transaction])).to eq ["18/05/2020 || 100.00 ||  || 200.00"]
    end
  end

  describe '#print' do
    it 'prints a transaction on a row underneath the header' do
      statement = Statement.new
      transaction = double(
        date: '18/05/2020',
        credit: '100.00',
        debit: nil,
        balance: '200.00'
      )
      statement.format([transaction])
      expect(statement.print).to eq 'date || credit || debit || balance
18/05/2020 || 100.00 ||  || 200.00'
    end
  end

end

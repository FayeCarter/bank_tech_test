require 'statement'

describe Statement do

  subject(:statement) { described_class.new }
  let(:transaction) { double(:transaction, date: '18/05/2020', credit: '100.00', debit: nil, balance: '200.00') }

  it 'initializes with column names' do
    expect(statement.print).to eq "date || credit || debit || balance"
  end

  it 'takes transactions and adds formatting' do
    expect(statement.format([transaction])).to eq ["18/05/2020 || 100.00 ||  || 200.00"]
  end

  it 'prints a transaction on a row underneath the header' do
    statement.format([transaction])
    expect(statement.print).to eq 'date || credit || debit || balance
18/05/2020 || 100.00 ||  || 200.00'
  end

end

require 'statement'

describe Statement do

  subject(:statement) { described_class.new }
  let(:transaction) { double(:transaction, date: '18/05/2020', credit: '100.00', debit: nil, balance: '200.00') }

  it 'initializes with column names' do
    expect(statement.printout).to eq "date || credit || debit || balance"
  end

  it 'prints a transaction on a row underneath the header' do
    expect { statement.format([transaction]) }.to output(
      "date || credit || debit || balance\n18/05/2020 || 100.00 ||  || 200.00"
    ).to_stdout
  end

end

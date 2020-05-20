require 'statement'

describe Statement do

  let(:transaction) { double(:transaction, date: '18/05/2020', credit: '100.00', debit: nil, balance: '200.00') }

  it 'initializes with column names' do
    expect(subject.printout).to eq "date || credit || debit || balance"
  end

  it 'prints a transaction on a row underneath the header' do
    expect { subject.format([transaction]) }.to output(
      "date || credit || debit || balance\n18/05/2020 || 100.00 ||  || 200.00"
    ).to_stdout
  end

end

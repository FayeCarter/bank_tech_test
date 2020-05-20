require 'statement'

describe Statement do

  it 'prints column header' do
    expect(subject.print_statement()).to eq "date || credit || debit || balance"
  end

  it 'prints a transaction on a row underneath the header' do
    transaction = double(:transaction)
    allow(transaction).to receive_messages(date: '18/05/2020', credit: '100.00', debit: nil, balance: '200.00')

    expect { subject.print_statement([transaction]) }.to output(
      "date || credit || debit || balance\n18/05/2020 || 100.00 ||  || 200.00"
    ).to_stdout
  end

end

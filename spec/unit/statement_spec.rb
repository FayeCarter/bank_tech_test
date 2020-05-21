require 'statement'

describe Statement do
  it '#create method reveals statement header when no transactions are passed to it' do
    empty_statement = "date || credit || debit || balance"
    expect { subject.create() }.to output(empty_statement).to_stdout
  end

  it 'When given a transaction, #create prints the transaction underneath the header' do
    statement = "date || credit || debit || balance"\
                "\n18/05/2020 || 100.00 || || 200.00 "
    transaction = double(:transaction)
    allow(transaction).to receive_messages(date: '18/05/2020', credit: '100.00 ', debit: nil, balance: '200.00 ')

    expect { subject.create([transaction]) }.to output(statement).to_stdout
  end

  it 'When given two transactions, #create prints each of them on a new line underneath the header' do
    statement = "date || credit || debit || balance"\
                "\n18/05/2020 || 100.00 || || 200.00 "\
                "\n20/05/2020 || || 300.00 || 200.00 "

    transaction_one = double(:transaction)
    allow(transaction_one).to receive_messages(date: '18/05/2020', credit: '100.00 ', debit: nil, balance: '200.00 ')

    transaction_two = double(:transaction)
    allow(transaction_two).to receive_messages(date: '20/05/2020', credit: nil, debit: '300.00 ', balance: '200.00 ')

    transactions = [transaction_one, transaction_two]

    expect { subject.create(transactions) }.to output(statement).to_stdout
  end

end

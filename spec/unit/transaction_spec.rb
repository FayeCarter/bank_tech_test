require 'transaction'

describe Transaction do 
  it 'uses "Time" to add date to statement' do
    date = Time.new(2012, 1, 10)
    allow(Time).to receive_message_chain(:now, :strftime).and_return(date)
    transaction = Transaction.new(balance: 100)

    expect(transaction.date).to eq date
  end

  it 'creates a credit value' do
    transaction = Transaction.new(balance: 100, credit: 5)
    expect(transaction.credit).to include "5.00"
  end

  it 'creates a debit value' do
    transaction = Transaction.new(balance: 100, debit: 5)
    expect(transaction.debit).to include "5.00"
  end

  it 'creates a balance value' do
    transaction = Transaction.new(balance: 100)
    expect(transaction.balance).to include "100.00"
  end
end

require 'transaction'

describe Transaction do 

  
  it 'has a todays date by default' do
    today = Time.now.strftime('%d/%m/%Y')
    transaction = Transaction.new(balance: 100)

    expect(transaction.date).to eq today
  end

  it 'creates a credit value' do
    transaction = Transaction.new(balance: 100, credit: 5)
    expect(transaction.credit).to eq "5.00"
  end

  it 'creates a debit' do
    transaction = Transaction.new(balance: 100, debit: 5)
    expect(transaction.debit).to eq "5.00"
  end

  it 'creates a balance value' do
    transaction = Transaction.new(balance: 100)
    expect(transaction.balance).to eq "100.00"
  end
end

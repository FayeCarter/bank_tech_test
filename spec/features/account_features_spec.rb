require 'account'

describe 'Account creationa nd function test' do
  
  it 'Account can print a statement of transactions in reverse chronological order' do
    account = Account.new

    date = Time.new(2012, 1, 10)
    allow(Time).to receive(:now).and_return(date)
    account.deposit(1000)

    date = Time.new(2012, 1, 13)
    allow(Time).to receive(:now).and_return(date)
    account.deposit(2000)

    date = Time.new(2012, 1, 14)
    allow(Time).to receive(:now).and_return(date)
    account.withdraw(500)

    predicted_statement = "date || credit || debit || balance\n14/01/2012 || || 500.00 || 2500.00 \n13/01/2012 || 2000.00 || || 3000.00 \n10/01/2012 || 1000.00 || || 1000.00 "
    
    expect { account.print_statement }.to output(predicted_statement).to_stdout
  end

end

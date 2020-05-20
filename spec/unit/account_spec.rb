require 'account'
require 'transaction'

describe Account do
  subject(:account) { described_class.new } 
  today = Time.now.strftime('%d/%m/%Y')

  it 'can be created with initial balance of £0.00' do
    expect(account.balance).to eq 0
  end

  it 'transactions should be added in reverse chronological order' do
    account.deposit(5)
    expect(account.balance).to eq 5
    account.withdraw(5)
    expect(account.balance).to eq 0
    expect(account.transaction_history[0].balance).to eq format("%<balance>.2f", balance: 0)
  end

  describe "#deposit" do
    it 'increases the balance' do
      account.deposit(5)
      expect(account.balance).to eq 5
    end

    it 'returns the balance' do
      expect(account.deposit(5.00)).to eq "Balance: 5.00"
    end

    it 'increases account transaction_history' do
      account.deposit(5)
      expect(account.transaction_history.length).to eq 1
    end

    it 'creates a transaction' do
      account.deposit(5)
      expect(account.transaction_history[0]).to be_a Transaction
    end

    it 'can be passed with a date' do
      account.deposit(5.00, "07/04/1990")
      expect(account.transaction_history[0].date).to eq "07/04/1990"
    end
  end

  describe "#withdraw" do
    it 'decreases the balance' do
      account.deposit(25)
      account.withdraw(5)
      expect(account.balance).to eq 20
    end

    it 'increases account transaction_history' do
      account.withdraw(5)
      expect(account.transaction_history.length).to eq 1
    end

    it 'creates a transaction' do
      account.withdraw(5)
      expect(account.transaction_history[0]).to be_a Transaction
    end

    it 'can be passed with a date' do
      account.withdraw(5, "07/04/1990")
      expect(account.transaction_history[0].date).to eq "07/04/1990"
    end
  end

  describe "#print_statement" do
    it 'returns an empty statement for a new account' do
      expect { account.print_statement }.to output(
        "date || credit || debit || balance"
      ).to_stdout
    end

    it 'returns credit history when deposit is made' do
      account.deposit(5)
      expect { account.print_statement }.to output(
        "date || credit || debit || balance\n#{today} || 5.00 ||  || 5.00"
      ).to_stdout
    end
  end
end

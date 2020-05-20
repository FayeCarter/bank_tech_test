require 'account'
require 'transaction'

describe Account do
  today = Time.now.strftime('%d/%m/%Y')

  it 'account has a balance of 0 when created' do
    account = Account.new
    expect(account.balance).to eq 0
  end

  it 'transactions should be added in reverse chronological order' do
    account = Account.new

    account.deposit(5)
    expect(account.balance).to eq 5
    account.withdraw(5)
    expect(account.balance).to eq 0
    expect(account.transaction_history[0].balance).to eq format("%<balance>.2f", balance: 0)
  end

  describe "#deposit" do
    it 'returns the increasedbalance' do
      account = Account.new
      expect(account.deposit(5)).to eq "Balance: 5.00"
    end

    it 'increases account transaction_history' do
      account = Account.new
      account.deposit(5)
      expect(account.transaction_history.length).to eq 1
    end

    it 'creates a transaction' do
      account = Account.new
      account.deposit(5)
      expect(account.transaction_history[0]).to be_a Transaction
    end

  end

  describe "#withdraw" do
    it 'returns the decreased balance' do
      account = Account.new
      expect(account.withdraw(5)).to eq "Balance: -5.00"
    end

    it 'increases account transaction_history' do
      account = Account.new
      account.withdraw(5)
      expect(account.transaction_history.length).to eq 1
    end

    it 'creates a transaction' do
      account = Account.new
      account.withdraw(5)
      expect(account.transaction_history[0]).to be_a Transaction
    end

  end

  describe "#print_statement" do
    it 'returns an empty statement for a new account' do
      account = Account.new
      expect { account.print_statement }.to output(
        "date || credit || debit || balance"
      ).to_stdout
    end

    it 'returns credit history when deposit is made' do
      account = Account.new
      account.deposit(5)
      expect { account.print_statement }.to output(
        "date || credit || debit || balance\n#{today} || 5.00 ||  || 5.00"
      ).to_stdout
    end
  end
end

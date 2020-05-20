require 'account'

describe Account do

  it 'account has a balance of 0 when created' do
    expect(subject.balance).to eq 0
  end

  describe "#deposit" do
    it 'depositing 5 returns a balance of 5.00' do
      expect(subject.deposit(5)).to eq "Balance: 5.00"
    end

    it 'adds to the transaction_history' do
      subject.deposit(5)
      expect(subject.transaction_history).to_not be_empty
    end

    it 'uses the transaction class' do
      transaction = double(:transaction)
      allow(transaction).to receive(:new).with(balance: 5, credit: 5, debit: nil)
      account = described_class.new(transaction: transaction)

      expect(transaction).to receive(:new)
      account.deposit(5)
    end
  end

  describe "#withdraw" do
    it 'withdrawing 5 returns a negative balance of -5.00' do
      expect(subject.withdraw(5)).to eq "Balance: -5.00"
    end

    it 'increases the transaction_history' do
      subject.withdraw(5)
      expect(subject.transaction_history).to_not be_empty
    end

    it 'uses the transaction class' do
      transaction = double(:transaction, new: "new transaction")
      allow(transaction).to receive(:new).with(balance: -5, credit: nil, debit: 5)
      account = described_class.new(transaction: transaction)

      expect(transaction).to receive(:new)
      account.withdraw(5)
    end
  end

  describe "#print_statement" do
    it 'to use statement class' do
      account_statement = double(:statement)
      statement_class = double(:statement_class, new: account_statement)
      account = described_class.new(statement: statement_class)
      
      expect(account_statement).to receive(:print_statement)
      account.print_statement
    end
  end
end

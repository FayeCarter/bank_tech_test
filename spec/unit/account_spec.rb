require 'account'

describe 'Account' do

  describe "#deposit" do
    it 'depositing 5 returns a balance of 5.00' do
      account = Account.new
      call = account.deposit(5)
      expection = "Balance: 5.00"

      expect(call).to eq expection
    end

    it 'adds a record to the transaction_history' do
      account = Account.new
      account.deposit(5)
      expect(account.transaction_history).to_not be_empty
    end

    it 'uses the transaction class' do
      transaction = double(:transaction)
      allow(transaction).to receive(:new).with(balance: 5, credit: 5, debit: nil)
      account = Account.new(transaction: transaction)

      expect(transaction).to receive(:new)
      account.deposit(5)
    end

    it 'stores a transaction using the history class' do
      transaction = double(:transaction)
      history = double(:history)
      history_class = double(:history_class, new: history)
      allow(history).to receive(:record).with(transaction)
      allow(history_class).to receive(:new).with(history)
      account = Account.new(history: history_class)

      expect(history).to receive(:record)
      account.deposit(5)
    end
  end

  describe "#withdraw" do
    it 'withdrawing 5 returns a negative balance of -5.00' do
      account = Account.new
      call = account.withdraw(5)
      expection = "Balance: -5.00"

      expect(call).to eq expection
    end

    it 'adds a record to the transaction_history' do
      account = Account.new
      account.withdraw(5)
      expect(account.transaction_history).to_not be_empty
    end

    it 'uses the transaction class' do
      transaction = double(:transaction, new: "new transaction")
      allow(transaction).to receive(:new).with(balance: -5, credit: nil, debit: 5)
      account = Account.new(transaction: transaction)

      expect(transaction).to receive(:new)
      account.withdraw(5)
    end
  end

  describe "#print_statement" do
    it 'uses the statement class' do
      account_statement = double(:statement)
      statement_class = double(:statement_class, new: account_statement)
      account = Account.new(statement: statement_class)
      
      expect(account_statement).to receive(:create)
      account.print_statement
    end
  end
end

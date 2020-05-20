require 'account'

describe Account do
  today = Time.now.strftime('%d/%m/%Y')

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

    it 'creates a transaction' do
      subject.deposit(5)
      expect(subject.transaction_history[0]).to be_a Transaction
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

    it 'creates a transaction' do
      subject.withdraw(5)
      expect(subject.transaction_history[0]).to be_a Transaction
    end
  end

  describe "#print_statement" do
    it 'returns an empty statement for a new account' do
      statement = "date || credit || debit || balance"

      expect { subject.print_statement }.to output(statement).to_stdout
    end

    it 'returns credit history when deposit is made' do
      statement = "date || credit || debit || balance\n#{today} || 5.00 ||  || 5.00"
      subject.deposit(5)
      expect { subject.print_statement }.to output(statement).to_stdout
    end
  end
end

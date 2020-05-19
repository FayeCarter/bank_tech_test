require 'transaction'

describe Transaction do 

  today = Time.now.strftime('%d/%m/%Y')
  subject(:transaction) { described_class.new(balance: 100.00) } 

  it 'has a date' do
    expect(transaction.date).to eq today
  end

  it 'has a balance' do
    expect(transaction.balance).to eq 100.00
  end

  describe "#credit" do 
    it 'credit value is empty by default' do
      expect(transaction.credit).to eq nil
    end

    it 'transaction can be initialized with credit' do
      transaction = Transaction.new(balance: 100.00, credit: 5.00)
      expect(transaction.credit).to eq format("%<balance>.2f", balance: 5)
      expect(transaction.debit).to eq nil
      expect(transaction.balance).to eq 105.00
    end

    it 'increases the balance' do
      transaction = Transaction.new(balance: 100.00, credit: 5.00)
      expect(transaction.balance).to eq 105.00
    end

    it 'credit value is a float with 2 decimal places' do
      transaction = Transaction.new(balance: 100.00, credit: 5)
      expect(transaction.credit).to eq format("%<balance>.2f", balance: 5)
    end
  end

  describe "#debit" do 
    it 'debit value is empty by default' do
      expect(transaction.debit).to eq nil
    end

    it 'transaction can be initialized with debit' do
      transaction = Transaction.new(balance: 100.00, debit: 5.00)
      expect(transaction.credit).to eq nil
      expect(transaction.debit).to eq 5.00
      expect(transaction.balance).to eq 95.00
    end

    it 'decreases the balance' do
      transaction = Transaction.new(balance: 100.00, debit: 5.00)
      expect(transaction.balance).to eq 95.00
    end
  end
end

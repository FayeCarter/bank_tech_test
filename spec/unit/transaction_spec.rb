require 'transaction'

describe Transaction do 

  today = Time.now.strftime('%d/%m/%Y')

  it 'has a todays date by default' do
    transaction = Transaction.new(balance: 100)
    expect(transaction.date).to eq today
  end

  it 'credit value is empty by default' do
    transaction = Transaction.new(balance: 100)
    expect(transaction.credit).to eq nil
  end

  it 'debit value is empty by default' do
    transaction = Transaction.new(balance: 100)
    expect(transaction.debit).to eq nil
  end

  it 'balance value is a float with 2 decimal places' do
    transaction = Transaction.new(balance: 100)
    expect(transaction.balance).to eq format("%<balance>.2f", balance: 100)
  end

  describe "#credit" do 

    it 'transaction can be initialized with credit' do
      transaction = Transaction.new(balance: 100, credit: 5)
      expect(transaction.credit).to eq format("%<balance>.2f", balance: 5)
    end

    it 'credit value is a float with 2 decimal places' do
      transaction = Transaction.new(balance: 100, credit: 5)
      expect(transaction.credit).to eq format("%<credit>.2f", credit: 5)
    end
  end

  describe "#debit" do 

    it 'transaction can be initialized with debit' do
      transaction = Transaction.new(balance: 100, debit: 5)
      expect(transaction.debit).to  eq format("%<debit>.2f", debit: 5)
    end

    it 'debit value is a float with 2 decimal places' do
      transaction = Transaction.new(balance: 100, debit: 5)

      expect(transaction.debit).to eq format("%<debit>.2f", debit: 5)
    end
  end
end

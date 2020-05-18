require 'transaction'

describe Transaction do 

  today = Time.now.strftime('%d/%m/%Y')

  it 'has a date' do
    transaction = Transaction.new()
    expect(transaction.date).to eq today
  end

  describe "#credit" do 
    it 'credit value is empty by default' do
      transaction = Transaction.new()
      expect(transaction.credit).to eq nil
    end

    it 'transaction can be initialized with credit' do
      transaction = Transaction.new(credit: 5.00)
      expect(transaction.credit).to eq 5.00
      expect(transaction.debit).to eq nil
    end
  end

  describe "#debit" do 
    it 'debit value is empty by default' do
      transaction = Transaction.new()
      expect(transaction.debit).to eq nil
    end

    it 'transaction can be initialized with debit' do
      transaction = Transaction.new(debit: 5.00)
      expect(transaction.credit).to eq nil
      expect(transaction.debit).to eq 5.00
    end
  end
end

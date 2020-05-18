require 'account'

describe Account do
  subject(:account) { described_class.new } 

  it 'Can be created with initial balance of £0.00' do
    expect(account.display_balance).to eq "£0.00"
  end

  describe "#deposit" do
    it 'increases the balance' do
      account.deposit(5.00)
      expect(account.display_balance).to eq "£5.00"
    end

    it 'increases account transaction_history' do
      account.deposit(5.00)
      expect(account.transaction_history.length).to eq 1
    end
  end

  describe "#print_statement" do
    it 'returns an empty statement for a new account' do
      expect(account.print_statement).to eq "date || credit || debit || balance"
    end
  end
end

require 'account'

describe Account do
  it 'Can be created with initial balance of £0.00' do
    account = Account.new
    expect(account.display_balance).to eq "£0.00"
  end

  it 'Balance is increased with a deposit' do
    account = Account.new
    account.deposit(5.00)
    expect(account.display_balance).to eq "£5.00"
  end
end

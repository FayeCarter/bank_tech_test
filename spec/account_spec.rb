require 'account'

describe Account do
  it 'Can be created with initial balance of £0.00' do
    account = Account.new
    expect(account.display_balance).to eq "£0.00"
  end
end

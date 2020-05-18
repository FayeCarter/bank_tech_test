require 'transaction'

describe Transaction do 

  today = Time.now.strftime('%d/%m/%Y')
  
  it 'has a date' do
    transaction = Transaction.new
    expect(transaction.date).to eq today
  end
end
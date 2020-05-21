require 'history'

describe History do
  
  it 'adds a transaction to transaction history' do
    transaction = "a"
    subject.record(transaction)

    expect(subject.show).to include transaction

  end
end

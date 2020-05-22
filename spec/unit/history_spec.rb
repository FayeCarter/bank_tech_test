require 'history'

describe History do
  it 'adds a transaction to transaction history' do
    transaction = double(:transaction)
    subject.record(transaction)

    expect(subject.show).to include transaction
  end

  it 'stores transactions in reverse chronological order' do
    transaction_one = double(:transaction)
    subject.record(transaction_one)

    transaction_two = double(:transaction)
    subject.record(transaction_two)

    expect(subject.show).to eq [transaction_two, transaction_one]
  end
end

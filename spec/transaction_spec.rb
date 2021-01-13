# frozen_string_literal: true

require 'transaction'

describe Transaction do
  before(:each) do
    allow(Time).to receive(:now).and_return(Time.parse('11/01/2021'))
  end

  it 'formats the date on a new instance of the Transaction class' do
    transaction = Transaction.new(credit: 1000, debit: 0, balance: 1000)
    expect(transaction.date).to eq '11/01/2021'
  end

  it 'formats the debit amount' do
    transaction = Transaction.new(credit: 0, debit: 1000, balance: 0)
    expect(transaction.debit).to eq '1000.00'
  end

  it 'formats the credit amount' do
    transaction = Transaction.new(credit: 1000, debit: 0, balance: 1000)
    expect(transaction.credit).to eq '1000.00'
  end

  it 'formats the balance amount' do
    transaction = Transaction.new(credit: 1000, debit: 0, balance: 1000)
    expect(transaction.balance).to eq '1000.00'
  end
end

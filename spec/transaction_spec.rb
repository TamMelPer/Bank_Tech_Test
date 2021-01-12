# frozen_string_literal: true

require 'transaction'

describe Transaction do

  before(:each) do
    allow(Time).to receive(:now).and_return(Time.parse("11/01/2021"))
  end

  it 'creates a credit tranction' do
    transaction = Transaction.new("credit", 1000, 1000)
    expect(transaction.create).to eq ({:balance=>"1000.00", :credit=>"1000.00", :date=>"11/01/2021"})
  end

  it 'creates a debit tranction' do
    transaction = Transaction.new("debit", 1000, 0)
    expect(transaction.create).to eq ({:balance=>"0.00", :debit=>"1000.00", :date=>"11/01/2021"})
  end
end

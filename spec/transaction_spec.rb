# frozen_string_literal: true

require 'transaction'

describe Transaction do

  before(:each) do
    allow(Time).to receive(:now).and_return(Time.parse("11/01/2021"))
  end

  subject(:transaction) { Transaction.new("debit", 500, 1000) }

    it 'knows its type' do
      expect(transaction.type).to eq "debit"
    end

    it 'knows its amount' do
      expect(transaction.amount).to eq ("500.00")
    end

    it 'knows its balance' do
      expect(transaction.balance).to eq ("1000.00")
    end

    it 'knows its amount' do
      expect(transaction.date).to eq "11/01/2021"
    end

end

# frozen_string_literal: true

require 'bank_account'

describe BankAccount do

subject(:account) { BankAccount.new }

  it 'opens a new bank account with a 0 balance' do
    expect(account.balance).to eq 0
  end

  it 'prints a blank statement' do
    expect{account.print_statement}.to output("date || credit || debit || balance").to_stdout
  end

  it 'updates the balance from 0 to 1000.00 when a deposit of 1000 is made' do
    account.deposit(1000)
    expect(account.balance).to eq 1000.00
  end

end

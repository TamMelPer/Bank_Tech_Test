# frozen_string_literal: true

require 'bank_account'

describe BankAccount do

  it 'opens a new bank account with a 0 balance' do
    account = BankAccount.new
    expect(account.balance).to eq 0
  end

  it 'prints a blank statement' do
    account = BankAccount.new
    expect{account.print_statement}.to output("date || credit || debit || balance").to_stdout
  end

end

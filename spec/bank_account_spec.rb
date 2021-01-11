# frozen_string_literal: true

require 'bank_account'

describe BankAccount do

subject(:account) { BankAccount.new }

  it 'opens a new bank account with a 0 balance' do
    expect(account.balance).to eq 0
  end

  it 'updates the balance from 0 to 1000.00 when a deposit of 1000 is made' do
    account.deposit(1000)
    expect(account.balance).to eq 1000.00
  end

  it 'prints a statement with the date, credit and balance after a deposit is made' do
    account.deposit(1000)
    expect{account.print_statement}.to output("date || credit || debit || balance\n11/01/2021 || 1000.00 ||  || 1000.00\n").to_stdout
  end

  it 'prints a statement with the date, credit and balance after a different deposit amount is made' do
    account.deposit(2000)
    expect{account.print_statement}.to output("date || credit || debit || balance\n11/01/2021 || 2000.00 ||  || 2000.00\n").to_stdout
  end

  it 'prints a statement with the date, credit and balance after two deposits are made' do
    account.deposit(1000)
    account.deposit(2000)
    expect{account.print_statement}.to output("date || credit || debit || balance\n11/01/2021 || 1000.00 ||  || 1000.00\n11/01/2021 || 2000.00 ||  || 3000.00\n").to_stdout
  end

end

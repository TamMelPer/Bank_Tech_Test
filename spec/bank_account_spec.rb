# frozen_string_literal: true

require 'bank_account'

describe BankAccount do
  subject(:account) { BankAccount.new }

  before(:each) do
    allow(Time).to receive(:now).and_return(Time.parse("11/01/2021"))
  end

  it 'opens a new bank account with a 0 balance' do
    expect(account.balance).to eq 0
  end

  describe '#deposit' do
    it 'updates the balance from 0 to 1000.00 when a deposit of 1000 is made' do
      account.deposit(1000)
      expect(account.balance).to eq 1000.00
    end
    it 'stores the transaction when a deposit is made' do
      transaction_double = double :transaction
      transaction_class_double = double :transaction_class, new: transaction_double
      bank_account = BankAccount.new(transaction_class_double)
      expect(transaction_double).to receive(:create)
      bank_account.deposit(1000)
    end
  end

  describe '#withdraw' do
    it 'updates the balance from 1000.00 to 500.00 when a withdrawal of 500 is made' do
      account.deposit(1000)
      account.withdraw(500)
      expect(account.balance).to eq 500.00
    end
  end

  describe '#print_statement' do
    it 'prints a statement with the date, credit and balance after a deposit is made' do
      account.deposit(1000)
      expect { account.print_statement }.to output("date || credit || debit || balance\n11/01/2021 || 1000.00 ||  || 1000.00\n").to_stdout
    end

    it 'prints a statement with the date, credit and balance after a different deposit amount is made' do
      account.deposit(2000)
      expect { account.print_statement }.to output("date || credit || debit || balance\n11/01/2021 || 2000.00 ||  || 2000.00\n").to_stdout
    end

    it 'prints a statement with the date, credit and balance after two deposits are made in reverse chronological order' do
      account.deposit(1000)
      account.deposit(2000)
      expect { account.print_statement }.to output("date || credit || debit || balance\n11/01/2021 || 2000.00 ||  || 3000.00\n11/01/2021 || 1000.00 ||  || 1000.00\n").to_stdout
    end

    it 'prints a statement with the date, credit and balance after a deposit and withdrawal is made in reverse chronological order' do
      account.deposit(1000)
      account.deposit(2000)
      account.withdraw(500)
      expect { account.print_statement }.to output("date || credit || debit || balance\n11/01/2021 ||  || 500.00 || 2500.00\n11/01/2021 || 2000.00 ||  || 3000.00\n11/01/2021 || 1000.00 ||  || 1000.00\n").to_stdout
    end
  end
end

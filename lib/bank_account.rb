# frozen_string_literal: true
require_relative 'transaction'

class BankAccount
  attr_reader :balance
  STATEMENT_HEADER = 'date || credit || debit || balance'

  def initialize(transaction_class = Transaction)
    @balance = 0
    @transactions = []
    @transaction_class = transaction_class
  end

  def print_statement
    puts STATEMENT_HEADER
    @transactions.reverse_each do |transaction|
      puts "#{transaction[:date]} || #{transaction[:credit]} || #{transaction[:debit]} || #{transaction[:balance]}"
    end
  end

  def deposit(amount)
    @balance += amount
    @transactions << (@transaction_class.new("credit", amount, @balance))
  end

  def withdraw(amount)
    @balance -= amount
    @transactions << (@transaction_class.new("debit", amount, @balance))
  end

end

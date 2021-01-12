# frozen_string_literal: true
require_relative 'transaction'

class BankAccount
  attr_reader :balance
  STATEMENT_HEADER = 'date || credit || debit || balance'

  def initialize
    @balance = 0
    @transactions = []
  end

  def print_statement
    puts STATEMENT_HEADER
    @transactions.reverse_each do |transaction|
      puts "#{transaction[:date]} || #{transaction[:credit]} || #{transaction[:debit]} || #{transaction[:balance]}"
    end
  end

  def deposit(amount)
    @balance += amount
    @transactions << (Transaction.new("credit", amount, @balance)).create
  end

  def withdraw(amount)
    @balance -= amount
    @transactions << (Transaction.new("debit", amount, @balance)).create
  end

end

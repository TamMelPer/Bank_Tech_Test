# frozen_string_literal: true

require_relative 'transaction'
require_relative 'statement'

class BankAccount
  attr_reader :balance, :transactions
  STATEMENT_HEADER = 'date || credit || debit || balance'

  def initialize(transaction_class = Transaction)
    @balance = 0
    @transactions = []
    @transaction_class = transaction_class
  end

  def print_statement
    statement = Statement.new
    statement.print(@transactions)
  end

  def deposit(amount)
    @balance += amount
    @transactions << @transaction_class.new(credit: amount, debit: 0, balance: @balance)
  end

  def withdraw(amount)
    @balance -= amount
    @transactions << @transaction_class.new(credit: 0, debit: amount, balance: @balance)
  end
end

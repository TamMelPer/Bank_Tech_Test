# frozen_string_literal: true

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
    @transactions << { date: current_date, credit: format_amount(amount), balance: format_amount(@balance) }
  end

  def withdraw(amount)
    @balance -= amount
    @transactions << { date: current_date, debit: format_amount(amount), balance: format_amount(@balance) }
  end

  private

  def format_amount(amount)
    '%.2f' % amount
  end

  def current_date
    Time.now.strftime('%d/%m/%Y')
  end
end

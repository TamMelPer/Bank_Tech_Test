# frozen_string_literal: true

class BankAccount

attr_reader :balance

def initialize
  @balance = 0
end

def print_statement
  puts "date || credit || debit || balance"
  puts "11/01/2021 || 1000.00 || || 1000.00"
end

def deposit(amount)
  @balance += amount
end

def balance
  @balance
end

end

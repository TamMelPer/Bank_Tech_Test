# frozen_string_literal: true

class BankAccount

attr_reader :balance

def initialize
  @balance = 0
end

def print_statement
  print "date || credit || debit || balance"
end

end

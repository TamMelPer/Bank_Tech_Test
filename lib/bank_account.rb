# frozen_string_literal: true

class BankAccount

attr_reader :balance

def initialize
  @balance = 0
  @transactions = []
end

def print_statement
  puts "date || credit || debit || balance"
  @transactions.each do |transaction|
    puts "#{transaction[:date]} || #{transaction[:credit]} || #{transaction[:debit]} || #{transaction[:balance]}"
  end
end

def deposit(amount)
  @balance += amount
  @transactions << {date: Time.now.strftime("%d/%m/%Y"), credit: '%.2f' % amount, balance: '%.2f' % @balance}
end


end

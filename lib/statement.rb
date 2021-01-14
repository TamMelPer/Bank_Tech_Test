class Statement

STATEMENT_HEADER = 'date || credit || debit || balance'

def print(transactions)
  puts STATEMENT_HEADER
  transactions.reverse_each do |transaction|
    puts "#{transaction.date} || #{transaction.credit} || #{transaction.debit} || #{transaction.balance}"
  end
end

end

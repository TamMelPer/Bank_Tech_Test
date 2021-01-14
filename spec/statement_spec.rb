require 'statement'

describe Statement do
  subject(:statement) { Statement.new }

  describe '#print' do

    it 'prints a statement with the headers when a transaction is made' do
      credit = double(date: "11/01/2021", credit: "50.00", debit: "0.00", balance: "50.00")
      transactions_double = double(transactions: [credit])
      expect { statement.print(transactions_double.transactions) }.to output("date || credit || debit || balance\n11/01/2021 || 50.00 || 0.00 || 50.00\n").to_stdout
    end
  end
end

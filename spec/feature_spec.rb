require 'bank_account'

describe BankAccount do

let(:account) { BankAccount.new}

before(:each) do
  allow(Time).to receive(:now).and_return(Time.parse('11/01/2021'))
end

it 'prints a statement with the date, credit and balance after a different deposit amount is made' do
  account.deposit(2000)
  expect { account.print_statement }.to output("date || credit || debit || balance\n11/01/2021 || 2000.00 || 0.00 || 2000.00\n").to_stdout
end

it 'prints a statement with the date, credit and balance after two deposits are made in reverse chronological order' do
  account.deposit(1000)
  account.deposit(2000)
  expect { account.print_statement }.to output("date || credit || debit || balance\n11/01/2021 || 2000.00 || 0.00 || 3000.00\n11/01/2021 || 1000.00 || 0.00 || 1000.00\n").to_stdout
end

it 'prints a statement with the date, credit and balance after a deposit and withdrawal is made in reverse chronological order' do
  account.deposit(1000)
  account.deposit(2000)
  account.withdraw(500)
  expect { account.print_statement }.to output("date || credit || debit || balance\n11/01/2021 || 0.00 || 500.00 || 2500.00\n11/01/2021 || 2000.00 || 0.00 || 3000.00\n11/01/2021 || 1000.00 || 0.00 || 1000.00\n").to_stdout
end

end

# frozen_string_literal: true

class Transaction
  attr_reader :date, :credit, :debit, :balance

  def initialize(credit:, debit:, balance:)
    @date = current_date
    @credit = format_amount(credit)
    @debit = format_amount(debit)
    @balance = format_amount(balance)
  end

  private

  def current_date
    Time.now.strftime('%d/%m/%Y')
  end

  def format_amount(amount)
    '%.2f' % amount
  end
end

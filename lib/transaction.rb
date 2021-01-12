class Transaction
  def initialize(type, amount, balance)
    @type = type
    @amount = amount
    @balance = balance
  end

  def create
    if @type == "credit"
      { date: current_date, credit: format_amount(@amount), balance: format_amount(@balance) }
    elsif @type == "debit"
      { date: current_date, debit: format_amount(@amount), balance: format_amount(@balance) }
    end
  end

  def current_date
    Time.now.strftime('%d/%m/%Y')
  end

  def format_amount(amount)
    '%.2f' % amount
  end

end

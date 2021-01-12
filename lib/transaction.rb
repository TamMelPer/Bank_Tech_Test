class Transaction
  def initialize(type, amount, balance)
    @type = type
    @amount = amount
    @balance = balance
  end

  def create
    if @type == "credit"
      "#{current_date} || #{format_amount(@amount)} ||  || #{format_amount(@balance)}"
    elsif @type == "debit"
      "#{current_date} ||  || #{format_amount(@amount)} || #{format_amount(@balance)}"
    end
  end

  def current_date
    Time.now.strftime('%d/%m/%Y')
  end

  def format_amount(amount)
    '%.2f' % amount
  end

end

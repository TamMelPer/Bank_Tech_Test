class Transaction

  attr_reader :type, :amount, :balance, :date
  
  def initialize(type, amount, balance)
    @date = current_date
    @type = type
    @amount = format_amount(amount)
    @balance = format_amount(balance)
  end


  def current_date
    Time.now.strftime('%d/%m/%Y')
  end

  def format_amount(amount)
    '%.2f' % amount
  end

end

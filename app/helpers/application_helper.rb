module ApplicationHelper
  def format_price(amount)
    return "" if amount.nil?

    "#{number_with_delimiter(amount, delimiter: ',')}円"
  end
end

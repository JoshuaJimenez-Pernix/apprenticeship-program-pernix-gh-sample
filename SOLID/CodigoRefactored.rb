class Order
  def initialize(items, calculator: OrderCalculator.new, email_service: EmailService.new, printer: OrderPrinter.new)
    @items = items
    @calculator = calculator
    @email_service = email_service
    @printer = printer
  end

  def calculate_total
    @calculator.calculate(@items)
  end

  def send_confirmation_email
    @email_service.send_email
  end

  def print_order
    @printer.print(@items)
  end
end

class OrderCalculator
  def calculate(items)
    total = 0
    items.each do |item|
      total += item.price
    end
    total
  end
end

class PercentageDiscountCalculator < OrderCalculator
  def initialize(discount_percentage)
    @discount_percentage = discount_percentage
  end

  def calculate(items)
    total = super
    discounted_total = total * (1 - @discount_percentage / 100.0)
    puts "Total with #{@discount_percentage}% discount: #{discounted_total}"
    discounted_total
  end
end

class FixedDiscountCalculator < OrderCalculator
  def initialize(discount_amount)
    @discount_amount = discount_amount
  end

  def calculate(items)
    total = super
    discounted_total = [total - @discount_amount, 0].max  # evita negativos
    puts "Total with $#{@discount_amount} fixed discount: #{discounted_total}"
    discounted_total
  end
end

class EmailService
  def send_email
    # Lógica para enviar un correo electrónico de confirmación
    puts "Email enviado a customer@example.com"
  end
end

class OrderPrinter
  def print(items)
    items.each do |item|
      puts "Item: #{item.name} - Price: #{item.price}"
    end
  end
end

class Item
  attr_accessor :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end
end

#Uso del codigo refactored
items = [Item.new("Item 1", 100), Item.new("Item 2", 200)]

# Order with no discount
order = Order.new(items)
puts "Original total: #{order.calculate_total}"
order.send_confirmation_email
order.print_order

# Order with percentage discount
percentage_calculator = PercentageDiscountCalculator.new(10)  # 10% discount
order_with_percentage = Order.new(items, calculator: percentage_calculator)
puts "Percentage discount total: #{order_with_percentage.calculate_total}"

# Order with fixed discount
fixed_calculator = FixedDiscountCalculator.new(50)  # $50 discount
order_with_fixed = Order.new(items, calculator: fixed_calculator)
puts "Fixed discount total: #{order_with_fixed.calculate_total}"
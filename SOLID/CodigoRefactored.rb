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
order = Order.new(items)
puts order.calculate_total
order.send_confirmation_email
order.print_order
require_relative "lib/errors"
require_relative "lib/customer"
require_relative "lib/product"
require_relative "lib/transaction"

# PRODUCTS

Product.new(title: "LEGO Iron Man vs. Ultron", price: 22.99, stock: 55)
Product.new(title: "Nano Block Empire State Building", price: 49.99, stock: 12)
Product.new(title: "LEGO Firehouse Headquarter", price: 199.99, stock: 0)

puts "Product count: #{Product.all.count}" # Should return 3

# Product.new(title: "LEGO Iron Man vs. Ultron", price: 22.99, stock: 55)
# Should return DuplicateProductError: 'LEGO Iron Man vs. Ultron' already exists. (WORKS!)

nanoblock = Product.find_by_title("Nano Block Empire State Building")
firehouse = Product.find_by_title("LEGO Firehouse Headquarter")

puts "Nanoblock title: #{nanoblock.title}" # Should return 'Nano Block Empire State Building'
puts "Nanobloc.price: #{nanoblock.price}" # Should return 49.99
puts "Nanoblock stock: #{nanoblock.stock}" # Should return 12
puts "Are there nanoblocks in stock? #{nanoblock.in_stock?}" # Should return true
puts "Are there firhouses in stock? #{firehouse.in_stock?}" # Should return false

products_in_stock = Product.in_stock
# Should return an array of all products with a stock greater than zero
puts "Are there nanoblocks in stock? #{products_in_stock.include?(nanoblock)}" # Should return true
puts "Are there firhouses in stock? ##{products_in_stock.include?(firehouse)}" # Should return false

# CUSTOMERS

Customer.new(name: "Walter Latimer")
Customer.new(name: "Julia Van Cleve")

puts "Customer count: #{Customer.all.count}" # Should return 2

# Customer.new(name: "Walter Latimer")
# Should return DuplicateCustomerError: 'Walter Latimer' already exists. (WORKS!)

walter = Customer.find_by_name("Walter Latimer")

puts "Customer name: #{walter.name}" # Should return "Walter Latimer""

# TRANSACTIONS

transaction = Transaction.new(walter, nanoblock)

puts "Transaction id: #{transaction.id}" # Should return 1
puts "Transaction product (nanoblock?): #{transaction.product == nanoblock}" # Should return true
puts "Transaction product (firehouse?) #{transaction.product == firehouse}" # Should return false
puts "Transaction customer (walter?): #{transaction.customer == walter}" # Should return true

puts "Nanoblock stock: #{nanoblock.stock}" # Should return 11

# PURCHASES

puts "Purchase: #{walter.purchase(nanoblock)}" # Returns a new transaction

puts "Transaction count: #{Transaction.all.count}" # Should return 2

transaction2 = Transaction.find(2)
puts "Find second transaction (product is nanoblock?): #{transaction2.product == nanoblock}" # Should return true

# walter.purchase(firehouse)
# Should return OutOfStockError: 'LEGO Firehouse Headquarter' is out of stock. (WORKS!)

# FEATURES
# 1. Added methods for a costumer to be able to return a product (if he has indeed bought that object)

t = Transaction.new(walter,nanoblock)

puts "Nanoblock stock: #{nanoblock.stock}" # Should return 9
puts "Devolution: #{walter.devolution(nanoblock)}" # Should return 10
# puts walter.devolution(firehouse) # Should return an error because walter didnt interact with firehouse (WORKS!)

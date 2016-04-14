class Transaction
        attr_reader :customer, :product, :id

        @@transactions = []

        # Initializes a transaction, buy = true means its a buying transaction
        # false means its a devolution
        def initialize(customer, product)
                @customer = customer
                @product = product
                @@transactions << self
                @id = @@transactions.index(self)+1
                product.purchase
        end

        # Returns all the transactions
        def self.all
                @@transactions
        end

        # Returns the customer of the transaction
        def customer
                @customer
        end

        # Returns the product of the transaction
        def product
                @product
        end

        # Finds a transaction by its id
        def self.find(id)
                @@transactions[id-1]
        end

        # Finds all the transactions involving a customer(name), a product(title), or both
        def self.find_by(options={})
                if options[:customer] && options[:product]
                        @@transactions.select { |transaction|transaction.customer.name == options[:customer] && transaction.product.title == options[:product] }
                elsif options[:customer]
                        @@transactions.select { |transaction| transaction.customer.name == options[:customer] }
                else
                        @@transactions.select { |transaction| transaction.product.title == options[:product] }
                end
        end
end

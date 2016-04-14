class Customer
        attr_reader :name

        @@customers = []

        # Initializes a customer
        def initialize(options={})
                @name = options[:name]
                add_to_customers
        end

        # Returns all the customers
        def self.all
                @@customers
        end

        # Finds a customer by its name
        def self.find_by_name(name)
                @@customers.each do |customer|
                        if customer.name == name
                                return customer
                        end
                end
        end

        # Purchases a product, decreases stock by 1
        def purchase(product)
                transaction = Transaction.new(self,product)
        end

        def devolution(product)
                transactions = Transaction.all
                transactions.each do |transaction|
                        if transaction.customer == self && transaction.product == product
                                return product.devolution
                        end
                end
                raise DevolutionNotAcceptedError, "There is no transaction between '#{self.name}' and '#{product.title}'"
        end

        private

        # Adds a customer to the array if it doesn't exists already
        def add_to_customers
                @@customers.each do |customer|
                        if customer.name == @name
                                raise DuplicatecustomerError, "'#{@name}' already exists."
                        end
                end
                @@customers << self
        end
end

class Transaction
        attr_reader :costumer, :product, :id

        @@transactions = []

        # Initializes a transaction
        def initialize(costumer, product)
                @costumer = costumer
                @product = product
                @@transactions << self
                @id = @@transactions.index(self)+1
                product.purchase
        end

        # Returns all the transactions
        def self.all
                @@transactions
        end

        # Returns the costumer of the transaction
        def customer
                @costumer
        end

        # Returns the product of the transaction
        def product
                @product
        end

        # Finds a transaction by its id
        def self.find(id)
                @@transactions.each do |transaction|
                        if transaction.id == id
                                return transaction
                        end
                end
        end
end

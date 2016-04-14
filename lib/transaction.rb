class Transaction
        attr_reader :costumer, :product, :id

        @@id_count = 1

        # Initializes a transaction
        def initialize(costumer, product)
                @costumer = costumer
                @product = product
                @id = @@id_count
                @@id_count+=1
        end

        # Returns the costumer of the transaction
        def customer
                @costumer
        end

        # Returns the product of the transaction
        def product
                @product
        end
end

class Customer
        attr_reader :name

        @@costumers = []

        # Initializes a costumer
        def initialize(options={})
                @name = options[:name]
                add_to_costumers
        end

        # Returns all the costumers
        def self.all
                @@costumers
        end

        # Finds a costumer by its name
        def self.find_by_name(name)
                @@costumers.each do |costumer|
                        if costumer.name == name
                                return costumer
                        end
                end
        end

        # Purchases a product, decreases stock by 1
        def purchase

        end

        private

        # Adds a costumer to the array if it doesn't exists already
        def add_to_costumers
                @@costumers.each do |costumer|
                        if costumer.name == @name
                                raise DuplicateCostumerError, "'#{@name}' already exists."
                        end
                end
                @@costumers << self
        end
end

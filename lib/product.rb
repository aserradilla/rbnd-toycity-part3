class Product
        attr_reader :title, :price, :stock

        @@products = []

        # Initializes a product
        def initialize(options={})
                @title = options[:title]
                @price= options[:price]
                @stock = options[:stock]
                add_to_products
        end

        # Returns all the products
        def self.all
                @@products
        end

        # Finds a product by its name
        def self.find_by_title(title)
                @@products.each do |product|
                        if product.title == title
                                return product
                        end
                end
        end

        # Returns an array of the products that are in stock
        def self.in_stock
                @@products.select { |product| product.stock > 0 }
        end

        # Return wether a product is in stock or not
        def in_stock?
                Product.in_stock.include?(self)
        end

        private

        # Adds a product to the array if it doesn't exists already
        def add_to_products
                @@products.each do |product|
                        if product.title == @title
                                raise DuplicateProductError, "'#{@title}' already exists."
                        end
                end
                @@products << self
        end
end

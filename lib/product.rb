class Product
        attr_reader :title, :price, :stock

        @@products = []

        def initialize(options={})
                @title = options[:title]
                add_to_products
        end

        def self.all
                @@products
        end

        def self.in_stock
                @@products.select { |product| product[:stock] > 0 }
        end

        def in_stock?
        end

        private

        def add_to_products
                @@products.each do |product|
                        if product.title == @title
                                raise DuplicateProductError, "#{@title} already exists."
                        end
                end
                @@products << self
        end
end

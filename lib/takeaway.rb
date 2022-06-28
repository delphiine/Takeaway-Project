class Takeaway
    def initialize
        @menu = []
        @basket = []
    end

    def view_menu 
        @menu.join("\n")
    end

    def add_to_menu(item)
        @menu << item
    end

    def view_basket  # Returns a string
        fail "Your basket is empty" if @basket.empty?
        "Your Basket: \n#{@basket.join("\n")}\nYour Grand Total: £#{grand_total}"
    end

    def add_to_basket(num)
        @menu.each { |item| @basket << item if item.identifier == num }
    end

    def remove_from_basket(num)
        @menu.each { |item| @basket.delete(item) if item.identifier == num }
    end

    def grand_total # Calculates the total of item prices and returns integer
        sum = 0
        @basket.each { |item| sum += item.price.to_i
        }
        return sum
    end
end
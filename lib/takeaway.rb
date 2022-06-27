class Takeaway
    def initialize
        @menu = []
        @basekt = []
        @grand_total = 0
    end

    def view_menu 
        @menu.join("\n")
    end

    def add_to_menu(item)
        @menu << ("#{item.item_num}. #{item.dish} - £#{item.price}")
    end

    def view_basekt  # Returns a string
    #     Your Order: 
    #     1. Dish_1 - £1
    #     2. Dish_2 - £1
    #     Your Grand Total: £2
        "Your Order: \n#{@basekt.join("\n")}\nYour Grand Total: £#{grand_total}"
    end

    def grand_total # Calculates the total of item prices and returns integer
        @menu.each { |item| @grand_total += item[-1].to_i } 
        @grand_total
    end

    def add_to_basekt(num)
        @menu.each { |item| @basekt << item if item[0] == num }     
    end
end
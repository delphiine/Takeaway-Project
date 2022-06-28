class Takeaway
    def initialize
        @menu = []
        @basekt = []
    end

    def view_menu
        @menu.join("\n")
    end

    def add_to_menu(item)
        @menu << ("#{item.item_num}. #{item.dish} - £#{item.price}")
    end

    def view_basekt
        @basekt.join("\n")
    end

    def add_to_basekt(num)
        @menu.each { |item| @basekt << item if item[0] == num }     
    end
end
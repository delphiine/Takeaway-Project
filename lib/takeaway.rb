class Takeaway
    def initialize
        @menu = []
    end

    def view_menu
        @menu.join("\n")
    end

    def add_to_menu(item)
        @menu << ("#{item.item_num}. #{item.dish} - £#{item.price}")
    end

end
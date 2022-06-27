class Takeaway
    def initialize(menu)
        @menu = menu
    end

    def view_menu
        "#{@menu.item_num}. #{@menu.dish} - £#{@menu.price}"
    end

end
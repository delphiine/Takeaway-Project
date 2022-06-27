class MenuItem
    def initialize(item_num, dish, price)
      @item_num = item_num
      @dish = dish
      @price = price
    end
  
    def item_num
        return @item_num
    end
  
    def dish
        return @dish
    end
  
    def price
        return @price
    end
  end
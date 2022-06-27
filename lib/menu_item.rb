class MenuItem
    def initialize(identifier, dish, price)
      @identifier = identifier
      @dish = dish
      @price = price
    end
  
    def identifier
        return @identifier
    end
  
    def dish
        return @dish
    end
  
    def price
        return @price
    end

    def to_s
        return "#{@identifier}. #{@dish} - £#{@price}"
    end
  end
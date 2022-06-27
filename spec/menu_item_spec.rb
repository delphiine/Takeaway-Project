require 'menu_item'

RSpec.describe MenuItem do
    it "Returns item number" do
        menu_item = MenuItem.new("1", "Dish", "5")
        result = menu_item.identifier
        expect(result).to eq "1"
    end

    it "Returns the name of a dish" do
        menu_item = MenuItem.new("1", "Dish", "5")
        result = menu_item.dish
        expect(result).to eq "Dish"
    end

    it "Returns the price of a dish" do
        menu_item = MenuItem.new("1", "Dish", "5")
        result = menu_item.price
        expect(result).to eq "5"
    end

    it "Returns the item as a string" do
        menu_item = MenuItem.new("1", "Dish", "5")
        result = menu_item.to_s
        expect(result).to eq "1. Dish - £5"
    end
end
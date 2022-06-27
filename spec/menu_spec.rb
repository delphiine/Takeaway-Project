require 'menu'

RSpec.describe Menu do
    it "Returns item number" do
        menu_item = Menu.new("1", "Dish", "5")
        result = menu_item.item_num
        expect(result).to eq "1"
    end

    it "Returns the name of a dish" do
        menu_item = Menu.new("1", "Dish", "5")
        result = menu_item.dish
        expect(result).to eq "Dish"
    end

    it "Returns the price of a dish" do
        menu_item = Menu.new("1", "Dish", "5")
        result = menu_item.price
        expect(result).to eq "5"
    end
end
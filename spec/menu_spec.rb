require 'menu'

RSpec.describe Menu do
    it "Returns item number" do
        menu_item = Menu.new("1", "Dish", "5")
        result = menu_item.item_num
        expect(result).to eq "1"
    end
end
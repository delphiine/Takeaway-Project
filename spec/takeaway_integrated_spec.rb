require 'takeaway'
require 'menu_item'

RSpec.describe Takeaway do
    context "Show the menu" do
        it "Returns 1 menu item" do
            takeaway = Takeaway.new
            menu_item = MenuItem.new("1", "Dish", "5")
            takeaway.add_to_menu(menu_item)
            result = takeaway.view_menu
            expect(result).to eq "1. Dish - £5"
        end

        it "Returns multiple menu items" do
            takeaway = Takeaway.new
            menu_item_1 = MenuItem.new("1", "Dish 1", "5")
            menu_item_2 = MenuItem.new("2", "Dish 2", "7")
            takeaway.add_to_menu(menu_item_1)
            takeaway.add_to_menu(menu_item_2)
            result = takeaway.view_menu
            expect(result).to eq "1. Dish 1 - £5\n2. Dish 2 - £7"
        end
    end
end

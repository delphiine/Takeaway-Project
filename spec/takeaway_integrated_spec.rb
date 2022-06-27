require 'takeaway'
require 'menu_item'

RSpec.describe Takeaway do
    context "Shows the menu" do
        it "Returns 1 menu item" do
            takeaway = Takeaway.new
            menu_item = MenuItem.new("1", "Dish", "5")
            takeaway.add_to_menu(menu_item)
            result = takeaway.view_menu
            expect(result).to eq "1. Dish - £5"
        end

        it "Returns multiple menu items" do
            takeaway = Takeaway.new
            menu_item_1 = MenuItem.new("1", "Dish_1", "5")
            menu_item_2 = MenuItem.new("2", "Dish_2", "7")
            takeaway.add_to_menu(menu_item_1)
            takeaway.add_to_menu(menu_item_2)
            result = takeaway.view_menu
            expect(result).to eq "1. Dish_1 - £5\n2. Dish_2 - £7"
        end
    end 

    context "Shows the basket" do
        it "Returns the basket with 1 item" do
            takeaway = Takeaway.new
            menu_item = MenuItem.new("1", "Dish", "5")
            takeaway.add_to_menu(menu_item)
            takeaway.add_to_basket("1")
            result = takeaway.view_basket
            expect(result).to eq "Your Order: \n1. Dish - £5\nYour Grand Total: £5"
        end
    
        it "Returns the basket with multiple items" do
            takeaway = Takeaway.new            
            menu_item_1 = MenuItem.new("1", "Dish_1", "5")
            menu_item_2 = MenuItem.new("2", "Dish_2", "7")
            takeaway.add_to_menu(menu_item_1)
            takeaway.add_to_menu(menu_item_2)
            takeaway.add_to_basket("1")
            takeaway.add_to_basket("2")
            result = takeaway.view_basket
            expect(result).to eq "Your Order: \n1. Dish_1 - £5\n2. Dish_2 - £7\nYour Grand Total: £12"
        end

        it "Returns the only item in basket when there are several item on menu" do
            takeaway = Takeaway.new            
            menu_item_1 = MenuItem.new("1", "Dish_1", "5")
            menu_item_2 = MenuItem.new("2", "Dish_2", "7")
            takeaway.add_to_menu(menu_item_1)
            takeaway.add_to_menu(menu_item_2)
            takeaway.add_to_basket("2")
            result = takeaway.view_basket
            expect(result).to eq "Your Order: \n2. Dish_2 - £7\nYour Grand Total: £7"
        end

        it "Return error message 'Your basket is empty' when the basket is empty" do
            takeaway = Takeaway.new
            expect{ takeaway.view_basket }.to raise_error "Your basket is empty"
        end
    end

    # context "Remove item from basket" do
    #     it "Returns basket after removing 1 item" do
    #         takeaway = Takeaway.new            
    #         menu_item_1 = MenuItem.new("1", "Dish_1", "5")
    #         menu_item_2 = MenuItem.new("2", "Dish_2", "7")
    #         menu_item_3 = MenuItem.new("3", "Dish_3", "10")
    #         takeaway.add_to_menu(menu_item_1)
    #         takeaway.add_to_menu(menu_item_2)
    #         takeaway.add_to_menu(menu_item_3)
    #         takeaway.add_to_basket("1")
    #         takeaway.add_to_basket("2")
    #         takeaway.add_to_basket("3")
    #         takeaway.remove_from_basket("2")
    #         result = takeaway.view_basket
    #         expect(result).to eq "Your Order: \n1. Dish_1 - £5\n3. Dish_3 - £10\nYour Grand Total: £15"
    #     end
    # end
end

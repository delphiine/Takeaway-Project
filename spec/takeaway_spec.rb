require 'takeaway'

RSpec.describe Takeaway do
    context "Shows the menu" do
        it "Returns 1 menu item" do
            takeaway = Takeaway.new
            fake_item = double(:fake_item, item_num: "1", dish: "Dish", price: "5")
            takeaway.add_to_menu(fake_item)
            result = takeaway.view_menu
            expect(result).to eq "1. Dish - £5"
        end

        it "Returns 1 menu item" do
            takeaway = Takeaway.new
            fake_item_1 = double(:fake_item, item_num: "1", dish: "Dish_1", price: "5")
            fake_item_2 = double(:fake_item, item_num: "2", dish: "Dish_2", price: "7")
            takeaway.add_to_menu(fake_item_1)
            takeaway.add_to_menu(fake_item_2)
            result = takeaway.view_menu
            expect(result).to eq "1. Dish_1 - £5\n2. Dish_2 - £7"
        end
    end

    context "Shows the basket" do
        it "Returns the basket with 1 item" do
            takeaway = Takeaway.new
            fake_item = double(:fake_item, item_num: "1", dish: "Dish", price: "5")
            takeaway.add_to_menu(fake_item)
            takeaway.add_to_basekt("1")
            result = takeaway.view_basekt
            expect(result).to eq "1. Dish - £5"
        end
    end
end
 
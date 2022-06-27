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
    end
end
 
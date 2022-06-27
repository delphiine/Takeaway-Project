require 'takeaway'
require 'menu'

RSpec.describe Takeaway do
    context "Show the menu" do
        it "Returns 1 menu item" do
            menu_item = Menu.new("1.", "Dish", "5")
            takeaway = Takeaway.new(menu_item)
            result = takeaway.view_menu
            expect(result).to eq menu_item
        end
    end
end

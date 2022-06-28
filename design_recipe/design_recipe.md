{{PROBLEM}} Multi-Class Planned Design Recipe
1. Describe the Problem
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices.

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes.

As a customer
So that I can verify that my order is correct
I would like to see an itemised receipt with a grand total.

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered.

2. Design the Class System
Consider diagramming out the classes and their relationships. Take care to focus on the details you see as important, not everything. The diagram below uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com

┌───────────────────────────────────────┐
│ Takeaway                              │
│                                       │ 
│ - initialize                          |
| - view_menu                           |
| - add_to_menu                         │
│ - add_to_basket                       |
| - remove_from_basket                  │         
│ - view_basket                         |
| - order?                              |
| - confirm_order                       |  
|                                       |           
└───────────┬───────────────────────────┘ 
            │
            │ owns a list of
            ▼
┌───────────────────────────────────────┐
│ Menu                                  │
│                                       │
│ - initialize(identifier, dish, price) |
| - identifier                          |
| - dish                                │
│ - price                               │
│                                       |
└───────────────────────────────────────┘
    

Also design the interface of each class in more detail.

class Takeaway
    def initialize
    end

    def view_menu # returns menu items in string format
    end

    def add_to_menu(item)
    end

    def view_basket #returns string of items in basket and grand total 
    end

    def add_to_basket(num) 
    end

    def remove_from_basket(num)
    end

    def grand_total # calculates the total of item prices and returns integer
    end

    def order # checks if the order has been placed
    end

    def order_confirmation 
    #returns a 'thank you for the order message' as a string"
    end
end

class MenuItem
    def initialize(identifier, dish, price)
    end
  
    def identifier
    end
  
    def dish
    end
  
    def price
    end

    def to_s #formats 'item' into a string - showing item number, dish & price
    end
  end

3. Create Examples as Integration Tests
Create examples of the classes being used together in different situations and combinations that reflect the ways in which the system will be used.

# EXAMPLE

# Integrated Test

takeaway = Takeaway.new
menu_item = MenuItem.new("1", "Dish", "5")
takeaway.add_to_menu(menu_item)
result = takeaway.view_menu
expect(result).to eq "1. Dish - £5"
end

takeaway = Takeaway.new
menu_item_1 = MenuItem.new("1", "Dish_1", "5")
menu_item_2 = MenuItem.new("2", "Dish_2", "7")
takeaway.add_to_menu(menu_item_1)
takeaway.add_to_menu(menu_item_2)
result = takeaway.view_menu
expect(result).to eq "1. Dish_1 - £5\n2. Dish_2 - £7" 

takeaway = Takeaway.new
menu_item = MenuItem.new("1", "Dish", "5")
takeaway.add_to_menu(menu_item)
takeaway.add_to_basket("1")
result = takeaway.view_basket
expect(result).to eq "Your Basket: \n1. Dish - £5\nYour Grand Total: £5"

takeaway = Takeaway.new
expect{ takeaway.view_basket }.to raise_error "Your basket is empty"
end


4. Create Examples as Unit Tests
Create examples, where appropriate, of the behaviour of each relevant class at a more granular level of detail.

# EXAMPLE

# MenuItem test

menu_item = MenuItem.new("1", "Dish", "5")
result = menu_item.identifier
expect(result).to eq "1"

menu_item = MenuItem.new("1", "Dish", "5")
result = menu_item.dish
expect(result).to eq "Dish"

menu_item = MenuItem.new("1", "Dish", "5")
result = menu_item.price
expect(result).to eq "5"



# Takeaway 
takeaway = Takeaway.new
fake_item = double(:fake_item, identifier: "1", dish: "Dish", price: "5", to_s: "1. Dish - £5")
takeaway.add_to_menu(fake_item)
result = takeaway.view_menu
expect(result).to eq "1. Dish - £5"

takeaway = Takeaway.new
fake_item = double(:fake_item, identifier: "1", dish: "Dish", price: "5", to_s: "1. Dish - £5")
takeaway.add_to_menu(fake_item)
takeaway.add_to_basket("1")
result = takeaway.view_basket
expect(result).to eq "Your Basket: \n1. Dish - £5\nYour Grand Total: £5"

takeaway = Takeaway.new
expect{ takeaway.view_basket }.to raise_error "Your basket is empty"
end


5. Implement the Behaviour
See 'takeaway.rb' & 'menue.rb'
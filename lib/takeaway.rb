require 'twilio-ruby'

class Takeaway
    def initialize(client = nil)
        @menu = []
        @basket = []
        @order_status = false
        @client = client
    end

    def view_menu 
        @menu.join("\n")
    end

    def add_to_menu(item)
        @menu << item
    end

    def set_client(client)
        @client = client
    end

    def view_basket  # Returns a string
        fail "Your basket is empty" if @basket.empty?
        "Your Basket: \n#{@basket.join("\n")}\nYour Grand Total: £#{grand_total}"
    end

    def add_to_basket(num)
        @menu.each { |item| @basket << item if item.identifier == num }
    end

    def remove_from_basket(num)
        @menu.each { |item| @basket.delete(item) if item.identifier == num }
    end

    def grand_total # Calculates the total of item prices and returns integer
        sum = 0
        @basket.each { |item| sum += item.price.to_i
        }
        return sum
    end

    def place_order
        fail "Your basket is empty" if @basket.empty? 
        @order_status =true
    end

    def confirm_order(client = nil) # Uses Twilio.com API to send an order confirmation sms to customer
        fail "No orders have been placed yet" if @order_status == false
        
        if client == nil
            client = @client
        end

        fail "No Twilio client available" if client == nil

        phone_number = ENV['MY_NUMBER']
        twilio_number = ENV['TWILIO_NUMBER']
        

        message = client.messages.create(
            body: 'Thank you! Your order was placed and will be delivered before 18:52',
            from: twilio_number,
            to: phone_number
          )

        return message.sid
    end
end

# account_sid = ENV['TWILIO_ACCOUNT_SID']
# auth_token = ENV['TWILIO_AUTH_TOKEN']
# client = Twilio::REST::Client.new(account_sid, auth_token)
# # 1.
# takeaway = Takeaway.new(client)
# takeaway.place_order
# takeaway.confirm_order
# 2.
# takeaway = Takeaway.new
# takeaway.set_client(client1)
# takeaway.set_client(client2)
# takeaway.place_order
# takeaway.confirm_order
# 3.
# takeaway = Takeaway.new
# takeaway.place_order
# takeaway.confirm_order(client)
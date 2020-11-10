module ApplicationHelper
    #custom helper to set current order globally
    def current_order
        if Order.find_by_id(session[:order_id]).nil?
            Order.new
        else
            Order.find_by_id(session[:order_id])
        end
    end
end

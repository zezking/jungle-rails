class Admin::SalesController < ApplicationController
    def index
        @sales=Sale.all
    end

    def current_sale

        @current_sale=Sale.where("sales.starts_on<=? AND sales.ends_on >= ?", Date.current, Date.current)
        puts "This is #{@current_sale}"

    end
end

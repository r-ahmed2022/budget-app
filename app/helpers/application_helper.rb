module ApplicationHelper
    def calculate_grand_total(current_user)
        grand_total = 0
    
        categories = current_user.categories
    
        categories.each do |category|
          grand_total += category.total_amount
        end
    
        grand_total
    end
end

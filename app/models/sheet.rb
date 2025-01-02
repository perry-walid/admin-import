# app/models/sheet.rb
class Sheet < ApplicationRecord
    has_one_attached :file
  
    enum status: { 
        pending: 0, 
        processing: 1, 
        completed: 2, 
        failed: 3, 
        partially_completed: 4 
    }
  
end
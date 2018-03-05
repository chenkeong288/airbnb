class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :listing
  

  #modal way to set number_of_days

  # before_save :set_number_of_days
  # def set_number_of_days 
  #     self.number_of_days = self.end_date - self.start_date
  # end

end

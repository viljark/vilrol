class Offer < ActiveRecord::Base
  validates :name, :description, :price, :presence => true
  validate :end_date_cant_be_in_present, :start_date_must_be_present
  
  def end_date_cant_be_in_present
   if  end_date < Date.today or end_date < start_date
      errors.add(:end_date, " can't be in the past or can't end before offer starts")
   end
  end

  def start_date_must_be_present
    if start_date < Date.today
      errors.add(:start_date, " can't be in the past")
    end
  end
end

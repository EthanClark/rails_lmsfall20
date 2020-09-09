class User < ApplicationRecord
  has_many :enrollments
  has_many :courses, through: :enrollments
  def full_name 
    "#{self.first_name} #{self.last_name}"
  end
end
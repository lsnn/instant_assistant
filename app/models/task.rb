class Task < ActiveRecord::Base

  validates :full_name, :email, :phone, :title, :description, presence: true

end

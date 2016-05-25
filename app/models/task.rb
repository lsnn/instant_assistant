class Task < ActiveRecord::Base

  belongs_to :assistant

  validates :full_name, :email, :phone, :title, :description, presence: true

end

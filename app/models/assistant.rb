class Assistant < ActiveRecord::Base

  has_many :tasks

  validates :full_name, :email, :phone, presence: true

end

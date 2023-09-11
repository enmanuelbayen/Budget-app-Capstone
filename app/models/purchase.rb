class Purchase < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_and_belongs_to_many :groups

  validates :name, presence: true, length: { maximum: 250, message: '%<count>s characters is the maximum allowed' }
end

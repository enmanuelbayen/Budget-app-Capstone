class Group < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_and_belongs_to_many :purchases, dependent: :destroy
  has_one_attached :icon

  validates :name, presence: true, length: { maximum: 250, message: '%<count>s characters is the maximum allowed' }
  validates :icon, presence: true
end

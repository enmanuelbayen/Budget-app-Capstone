class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :groups, dependent: :destroy, foreign_key: 'author_id'
  has_many :purchases, dependent: :destroy, foreign_key: 'author_id'

  validates :name, presence: true, length: { maximum: 250, message: '%<count>s characters is the maximum allowed' }
end

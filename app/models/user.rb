class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable
    
    has_many :groups
    has_many :purchases

    validates :name, presence: true, length: { maximum: 250, message: '%<count>s characters is the maximum allowed' }
end

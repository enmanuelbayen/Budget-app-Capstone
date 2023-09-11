class User < ApplicationRecord
    has_many :groups
    has_many :purchases

    validates :name, presence: true, length: { maximum: 250, message: '%<count>s characters is the maximum allowed' }
end

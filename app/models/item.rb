class Item < ApplicationRecord
  has_many :cart_itmes, dependent: :destroy
end

class User < ApplicationRecord
  has_many :addresses
  has_one :cart	
end

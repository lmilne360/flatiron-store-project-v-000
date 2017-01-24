class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         has_many :carts

         def current_cart
          self.carts[0]
         end

         def current_cart=(value)
           self.carts[0] = value
         end
end

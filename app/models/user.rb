class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[\w-]{6,128}+\z/i
         with_options presence: true do
          validates :password, length: {minimum: 6 }, format: { with: VALID_PASSWORD_REGEX}
          validates :email
          validates :name
         end

         has_many :room_users
         has_many :rooms, through: :room_users
    
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  extend ActiveHash::Associations::ActiveRecordExtensions

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable,  :validatable
  
  belongs_to_active_hash :genre
  belongs_to_active_hash :grade
  belongs_to_active_hash :class_number
  belongs_to_active_hash :number

  has_many :room_users
  has_many :rooms, through: :room_users
  has_many :messages
  


 
        
 with_options presence: true do
   validates :name
   validates :email
   validates :password

  with_options numericality: { other_than: 1} do
    validates :genre_id
    validates :grade_id
    validates :class_number_id
    validates :number_id
  end
 end
end
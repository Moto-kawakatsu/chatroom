class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
  belongs_to_active_hash :grade
  belongs_to_active_hash :class_number
  belongs_to_active_hash :number
  


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,  :validatable
  validates :name, :email, :password, :genre, :grade, :class_number, :number, presence: true
  validates :genre_id, :grade_id, :class_id, :class_number_id, :number_id,  numericality: { other_than: 1 }

  has_many :room_users
  has_many :rooms, through: :room_users
  has_many :messages
end
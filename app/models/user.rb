class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :projects
  has_many :participations, dependent: :destroy
  has_many :projects, through: :participations
  has_many :user_languages, dependent: :destroy
  has_many :chatroom_users, dependent: :destroy
  has_many :chatrooms, through: :chatroom_users
  has_many :notifications

  has_one_attached :photo

  validates :first_name, :last_name, :batch_number, :city, :pays, :bootcamp_year, presence: true
end

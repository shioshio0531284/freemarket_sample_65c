class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, :nickname, :birth_date, presence: true

  validates :first_name_kana, :last_name_kana,
               format: { with: /\A[ぁ-んー－]+\z/}, presence: true

  validates :phone_number,
               format: { with: /\A\d{10,11}\z/}, presence: true

  has_one :users_address
end

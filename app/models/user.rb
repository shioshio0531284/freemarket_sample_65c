class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :firsst_name, :last_name, :first_name_kana, :last_name_kana, :nickname, :birth_year, :birth_month, :birth_dey, :phone_number, presence: true
end

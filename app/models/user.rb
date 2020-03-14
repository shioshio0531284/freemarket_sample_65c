class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, :nickname, :birth_date, :first_name_kana, :last_name_kana, presence: true

  validates :first_name_kana, :last_name_kana, format: { with: /\A[ぁ-んー－]+\z/, message: "は全角ひらがなで入力してください" }

  has_one :users_address
  has_many :items
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, :nickname, :birth_date, :first_name_kana, :last_name_kana, :phone_number, presence: true

  validates :first_name_kana, :last_name_kana,
               format: { with: /\A[ぁ-んー－]+\z/,message: "は全角ひらがなで入力してください"}

  validates :phone_number,
               format: { with: /\A\d{10,11}\z/,message: "はハイフン無しの10桁か11桁の番号を入力してください"}


  has_one :users_address
end

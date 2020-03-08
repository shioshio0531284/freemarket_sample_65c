class UsersAddress < ApplicationRecord
  belongs_to :user, optional: true
  validates :address_first_name, :address_last_name, :address_first_name_kana, :address_last_name_kana, :post_number, :prefectures, :city, :house_number, presence: true

  validates :address_first_name_kana, :address_last_name_kana, 
            format: { with: /\A[ぁ-んー－]+\z/,message: "は全角ひらがなで入力してください"}

  validates :post_number, 
            format: { with: /\A\d{7}\z/,message: "はハイフン無しの7桁の番号を入力してください"}
end

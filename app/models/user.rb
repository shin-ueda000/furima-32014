class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         with_options presence: true do
         validates :nickname
         validates :password, format:    { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "please include both letters and numbers in."}
         validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "Input in full-width (kanji, hiragana, katakana) is required"}
         validates :first_name,  format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "Input in full-width (kanji, hiragana, katakana) is required"}
         validates :family_name_katakana,  format: { with:/\A[ァ-ヶー－]+\z/, message: "Frigana must be entered in full-width (katakana)"}
         validates :first_name_katakana,   format: { with:/\A[ァ-ヶー－]+\z/, message: "Frigana must be entered in full-width (katakana)"}
         validates :birthday
         end
         
         has_many :items
end


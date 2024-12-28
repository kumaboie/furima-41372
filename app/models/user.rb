class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "must contain a valid '@' symbol" }
  validates :nickname, presence: true
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :furigana_first_name, presence: true, format: { with: /\A[ァ-ヶー]+\z/ }
  validates :furigana_last_name, presence: true, format: { with: /\A[ァ-ヶー]+\z/ }
  validates :birth_date, presence: true
  validates :password, presence: true, length: { minimum: 6 }, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/ }
end

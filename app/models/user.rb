class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  validates :first_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :last_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :kana_firstname, presence: true, format: {with: /\A[ァ-ヶー－]+\z/}
  validates :kana_lastname, presence: true, format: {with: /\A[ァ-ヶー－]+\z/}
  validates :birthday, presence: true
  validates :password, presence: true, format: {with:/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze}
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'

  validates :email, uniqueness: true
  with_options presence: true do
    validates :nickname
    validates :last_name, :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'お名前(全角)は全角文字を使用してください' }
    validates :last_name_kana, :first_name_kana, format: { with: /\A[ァ-ン一]+\z/, message: 'お名前カナ(全角) は全角カナを使用してください' }
    validates :birth_date
  end
  has_many :items
  has_many :orders
end

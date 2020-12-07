class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :orders

  validates :nickname, presence: true, uniqueness: { case_sensitive: true }
  validates_format_of :password, with: /([0-9].*[a-zA-Z]|[a-zA-Z].*[0-9])/, length: { minimum: 6 }, message: 'は6文字以上の英数混在で入力してください。'
  validates :birthday, presence: true

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'に全角文字を使用してください' } do
    validates :first_name
    validates :last_name
  end

  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'に全角文字を使用してください' } do
    validates :first_name_kana
    validates :last_name_kana
  end
end

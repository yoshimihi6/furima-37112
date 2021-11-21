class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true

  has_many :items
  has_many :orders

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "は全角（漢字・ひらがな・カタカナ）で入力してください" } do
   validates :first_name, presence: true
   validates :last_name, presence: true
  end
  with_options presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: "は全角（カタカナ）で入力してください" } do
   validates :first_name_kana, presence: true
   validates :last_name_kana, presence: true
  end

  validates :birthday, presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: "は半角英数字を含んで入力してください"
end

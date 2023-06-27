class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :name, length: {minimum: 1}

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships

  has_many :posts
  has_many :comments
  has_many :likes

  def gravatar_url(size: 150)
    gravatar_id = Digest::MD5.hexdigest(email.downcase)
    "https://www.gravatar.com/avatar/#{gravatar_id}?s=#{size}&d=identicon"
  end
end

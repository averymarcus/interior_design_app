class User < ApplicationRecord
  include JwtToken
  # Direct associations

  has_many   :likes,
             dependent: :destroy

  has_many   :comments,
             dependent: :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    email
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

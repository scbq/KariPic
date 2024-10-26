class User < ApplicationRecord
  has_one_attached :profile_photo
  has_many :comments
  enum role: { user: 0, karina: 1 }
  after_initialize :set_default_role, if: :new_record?
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def set_default_role
    self.role ||= :user
  end
  
end

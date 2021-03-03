class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :rooms
  has_many :band_members
  has_many :bands, through: :band_members

  validates :first_name, :last_name, :email, :type, presence: true
  validates :email, format: { with: /^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/ }, length: { minimum: 7 },
            uniqueness: true
  validates :stage_name, uniqueness: true
  validates :password, confirmation: true
  validates :type, inclusion: { in: %w[host band both] }
end

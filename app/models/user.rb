class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :photo
  has_many :rooms
  has_many :band_members
  has_many :bands, through: :band_members

  validates :first_name, :last_name, :type, presence: true
  validates :stage_name, uniqueness: true
  validates :type, inclusion: { in: %w[host band both] }
end

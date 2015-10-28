class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :offer,    dependent: :destroy
  has_one :location, dependent: :destroy

  accepts_nested_attributes_for :location, reject_if: :all_blank

  validates :first_name, presence: true
  validates :last_name,  presence: true

  def admin?
  	self.admin
  end

  def full_name
  	first_name + " " + last_name
  end
end

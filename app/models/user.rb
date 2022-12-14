class User < ApplicationRecord
  has_one :profile, dependent: :destroy
  has_many :cars, dependent: :destroy
  has_many :enquiries, dependent: :destroy
  has_many :sells, dependent: :destroy

  after_create :set_profile

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
   attr_accessor :login
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, authentication_keys: [:login]

         def set_profile
          self.create_profile
          end

  def login
    @login || self.username || self.email || self.mobile
  end
  
  def email_required?
    false
  end
  
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value OR lower(mobile) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email) || conditions.has_key?(:mobile)
      where(conditions.to_h).first
    end
  end
end

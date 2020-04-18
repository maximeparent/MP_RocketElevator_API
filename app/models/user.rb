class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :quotes
  has_many :posts
  has_many :employees
  has_many :customers
  has_many :buildings

  belongs_to :role, optional: true
  rolify

  after_create :assign_default_role

  def assign_default_role
    if self.role_id == 1
      self.add_role(:admin) if self.roles.blank?
    elsif self.role_id == 3
      self.add_role(:employee) if self.roles.blank?
    else
      self.add_role(:customer) if self.roles.blank?
    end
  end
  validate :password_complexity
  
  def password_complexity
    # Regexp extracted from https://stackoverflow.com/questions/19605150/regex-for-password-must-contain-at-least-eight-characters-at-least-one-number-a
    return if password.blank? || password =~ /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,70}$/

    errors.add :password, 'Complexity requirement not met. Length should be 8-70 characters and include: 1 uppercase, 1 lowercase, 1 digit and 1 special character'
  end
end

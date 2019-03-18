# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  username        :string           not null
#  email           :string           not null
#  password_digest :string
#  role            :string           default("user"), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
    # Necessary to authenticate.
  has_secure_password

  has_one :employee

  accepts_nested_attributes_for :employee, reject_if: :all_blank, allow_destroy: true
  
  validates_length_of       :password, maximum: 72, minimum: 8, allow_nil: true, allow_blank: false
  validates_confirmation_of :password, allow_nil: true, allow_blank: false

  before_validation { 
    (self.email = self.email.to_s.downcase) && (self.username = self.username.to_s.downcase) 
  }

  # Make sure email and username are present and unique.
  validates_presence_of     :email, :username
  validates_uniqueness_of   :email, :username

  # This method gives us a simple call to check if a user has permission to see it's own info.
  def can_see_info?(employee_id)
    role == 'admin' || employee.id.to_s == employee_id.to_s
  end

  # This method tells us if the user is an admin or not.
  def is_admin?
    role == 'admin'
  end

end

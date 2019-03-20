# == Schema Information
#
# Table name: employees
#
#  id         :bigint(8)        not null, primary key
#  first_name :string
#  last_name  :string
#  entry_date :date
#  active     :boolean          default(FALSE)
#  user_id    :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Employee < ApplicationRecord
  belongs_to :user
  has_many :shifts, dependent: :destroy
  validates_presence_of :first_name, :last_name, :entry_date
end

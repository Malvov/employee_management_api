# == Schema Information
#
# Table name: employees
#
#  id         :bigint(8)        not null, primary key
#  first_name :string
#  last_name  :string
#  entry_date :date
#  active     :boolean
#  user_id    :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class EmployeeSerializer < ApplicationSerializer
  attributes :id, :name, :entry_date
  has_many :shifts

  def name
    object.first_name + ' ' + object.last_name
  end
end

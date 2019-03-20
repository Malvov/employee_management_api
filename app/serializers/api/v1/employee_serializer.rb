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

module API
  module V1
    class EmployeeSerializer < ApplicationSerializer
      attributes :id, :entry_date, :active, :first_name, :last_name, :user_id
      has_many :shifts
    end
  end
end


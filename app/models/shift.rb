# == Schema Information
#
# Table name: shifts
#
#  id          :bigint(8)        not null, primary key
#  date        :date
#  check_in    :time
#  check_out   :time
#  employee_id :bigint(8)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  comment     :text
#

class Shift < ApplicationRecord
  belongs_to :employee
  validates_presence_of :date, :check_in, :check_out, :employee_id
end

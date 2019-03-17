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

require 'rails_helper'

RSpec.describe Shift, type: :model do
    it { should validate_presence_of(:check_in) }
    it { should validate_presence_of(:check_out) }
    it { should validate_presence_of(:date) }
    it { should belong_to(:employee) }
end

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

require 'rails_helper'

RSpec.describe Employee, type: :model do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:entry_date) }
end

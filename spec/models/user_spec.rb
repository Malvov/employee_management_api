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

require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_uniqueness_of(:username) }
  it { should have_secure_password }
  it { should accept_nested_attributes_for(:employee) }
  it { should have_one(:employee) }
end

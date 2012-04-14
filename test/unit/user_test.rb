# == Schema Information
#
# Table name: users
#
#  id            :integer         not null, primary key
#  mhealth_id    :string(255)
#  email         :string(255)
#  name          :string(255)
#  created_at    :datetime        not null
#  updated_at    :datetime        not null
#  first_sign_in :boolean
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

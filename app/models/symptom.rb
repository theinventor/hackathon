# == Schema Information
#
# Table name: symptoms
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Symptom < ActiveRecord::Base
  belongs_to :user
end

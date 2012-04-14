# == Schema Information
#
# Table name: meals
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Meal < ActiveRecord::Base
  belongs_to :user

end

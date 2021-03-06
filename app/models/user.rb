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

class User < ActiveRecord::Base
  has_many :meals
  has_many :symptoms

  def self.fetch(access_token)
    response = RestClient.get "#{SlumberScore.setting(:mhealth_api)}v2/health/user?oauth_token=#{access_token}"
    profile = JSON.parse response

    user = first :mhealth_id => profile["id"]

    if user
      user.update :email => profile["email"]["value"], :name => profile["name"]["value"]
    else
      user = create :mhealth_id => profile["id"], :email => profile["email"]["value"], :name => profile["name"]["value"]
      user.first_sign_in = true
    end

    user
  end


end

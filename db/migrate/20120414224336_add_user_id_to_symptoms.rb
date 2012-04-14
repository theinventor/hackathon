class AddUserIdToSymptoms < ActiveRecord::Migration
  def change
    add_column :symptoms, :user_id, :integer

  end
end

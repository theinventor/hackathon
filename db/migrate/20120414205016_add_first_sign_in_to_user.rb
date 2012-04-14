class AddFirstSignInToUser < ActiveRecord::Migration

  def change
    add_column :users, :first_sign_in, :boolean

  end
end

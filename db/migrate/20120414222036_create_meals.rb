class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.string :title

      t.timestamps
    end
  end
end

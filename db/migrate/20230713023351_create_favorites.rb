class CreateFavorites < ActiveRecord::Migration[7.0]
  def change
    create_table :favorites do |t|
      t.integer :user_id
      t.integer :exercise_id
      t.timestamps
    end
  end
end

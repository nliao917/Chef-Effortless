class CreateMovies < ActiveRecord::Migration
  def up
    create_table :ingredients do |t|
      t.string :item
      t.integer :quantity
      t.datetime :expiration_date
      # Add fields that let Rails automatically keep track
      # of when movies are added or modified:
      t.timestamps
    end
  end

  def down
    drop_table :ingredients
  end
end

class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :comment
      t.integer :score
      t.integer :movie_id

      t.timestamps null: false
    end
  end
end

class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :title
      t.string :description
      t.integer :rating
      t.integer :user_id 
    end
  end
end
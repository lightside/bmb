class CreateListings < ActiveRecord::Migration
  def self.up
    create_table :listings do |t|
      t.string :title
      t.text :content
      t.string :condition
      t.string :price
      t.string :active
      t.integer :book_id
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :listings
  end
end

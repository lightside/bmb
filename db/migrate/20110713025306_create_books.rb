class CreateBooks < ActiveRecord::Migration
  def self.up
    create_table :books do |t|
      t.string :title
      t.string :ISBN
      t.boolean :active

      t.timestamps
    end
  end

  def self.down
    drop_table :books
  end
end

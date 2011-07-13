class CreateCourses < ActiveRecord::Migration
  def self.up
    create_table :courses do |t|
      t.string :school
      t.string :title
      t.string :code
      t.boolean :active

      t.timestamps
    end
  end

  def self.down
    drop_table :courses
  end
end

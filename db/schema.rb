# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 0) do

  create_table "books", :primary_key => "bookId", :force => true do |t|
    t.integer "courseId"
    t.integer "schoolId",                       :null => false
    t.string  "bookTitle",       :limit => 125
    t.string  "bookAuthor",      :limit => 125
    t.string  "bookISBN",        :limit => 14
    t.string  "bookCondition",   :limit => 10
    t.string  "bookTransaction", :limit => 5
  end

  create_table "courses", :primary_key => "courseId", :force => true do |t|
    t.integer "schoolId"
    t.string  "courseName",         :limit => 125
    t.string  "courseAbbreviation", :limit => 4
  end

  create_table "listings", :primary_key => "listingId", :force => true do |t|
    t.integer "userId"
    t.integer "bookId"
    t.integer "courseId"
    t.integer "schoolId"
    t.string  "listingTitle",       :limit => 125
    t.text    "listingDescription"
    t.date    "dateCreated",                       :null => false
  end

  create_table "schools", :primary_key => "schoolId", :force => true do |t|
    t.string "schoolName",   :limit => 125
    t.string "schoolDomain", :limit => 20
  end

  create_table "users", :primary_key => "userId", :force => true do |t|
    t.string  "userFullName", :limit => 125
    t.string  "userName",     :limit => 20
    t.string  "userPassword", :limit => 32
    t.string  "userEmail",    :limit => 125
    t.integer "schoolId"
  end

end

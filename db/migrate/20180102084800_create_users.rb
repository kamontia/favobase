class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string "provider"
      t.string "uid"
      t.string "nickname"
      t.string "name"
      t.string "image_url"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end

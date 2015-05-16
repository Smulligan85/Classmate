class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :title, null: false, default: ""
      t.string :body, null: false, default: ""
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :notes, :users
  end
end

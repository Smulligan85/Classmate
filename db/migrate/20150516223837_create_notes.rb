class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :title, null: false, default: ""
      t.string :body, null: false, default: ""

      t.timestamps null: false
    end
  end
end

class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.references :user, index: true
      t.string :title

      t.timestamps null: false
    end
    add_foreign_key :projects, :users
  end
end

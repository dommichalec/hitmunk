# rails g model Comment commentable_type:string commentable_id:integer user_id:integer body:text
class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :commentable_type
      t.integer :commentable_id
      t.integer :user_id
      t.text :body

      t.timestamps
    end
  end
end

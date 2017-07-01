class AddArchivalStatusToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :archived, :boolean, default: false
  end
end

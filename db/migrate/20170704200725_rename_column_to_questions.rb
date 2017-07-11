class RenameColumnToQuestions < ActiveRecord::Migration[5.0]
  def change
    rename_column :questions, :commments_count, :comments_count

  end
end

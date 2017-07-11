class AddCommentsCountToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :commments_count, :integer, default: 0, null: false

  end
end

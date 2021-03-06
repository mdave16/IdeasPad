class CreateJoinTableIdeaTag < ActiveRecord::Migration[5.1]
  def change
    create_join_table :ideas, :tags do |t|
      t.index [:idea_id, :tag_id]
      t.index [:tag_id, :idea_id]
    end
  end
end

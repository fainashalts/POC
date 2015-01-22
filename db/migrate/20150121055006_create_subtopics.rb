class CreateSubtopics < ActiveRecord::Migration
  def change
    create_table :subtopics do |t|
      t.integer :topic_id
      t.string :name

      t.timestamps
    end
  end
end

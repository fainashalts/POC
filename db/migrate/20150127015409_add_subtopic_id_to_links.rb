class AddSubtopicIdToLinks < ActiveRecord::Migration
  def change
    add_column :links, :subtopic_id, :integer
  end
end

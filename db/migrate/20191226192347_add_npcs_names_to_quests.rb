class AddNpcsNamesToQuests < ActiveRecord::Migration[5.2]
  def change
    add_column :quests, :npc_id, :integer
  end
end

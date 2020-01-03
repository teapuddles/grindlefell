class CreateNpcs < ActiveRecord::Migration[5.2]
  def change
    create_table :npcs do |t|
      t.string :npc_name
      t.integer :quest_id
    end 
  end
end

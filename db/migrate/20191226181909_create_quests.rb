class CreateQuests < ActiveRecord::Migration[5.2]
  def change
    create_table :quests do |t|
      t.string :title
      t.string :quest_desc
      t.string :reward
      t.integer :add_renown
    end 
  end
end

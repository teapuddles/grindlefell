class CreateQuestLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :quest_logs do |t|
      t.integer :player_id
      t.integer :quest_id
      t.boolean :quest_complete?
    end
  end
end

class Quest < ActiveRecord::Base
  has_many :quest_logs
  has_many :players, through: :quest_logs

  belongs_to :NPC
end
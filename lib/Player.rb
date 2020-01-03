class Player < ActiveRecord::Base
  has_many :quest_logs
  has_many :quests, through: :quest_logs 

end

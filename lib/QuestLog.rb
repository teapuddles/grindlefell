class QuestLog < ActiveRecord::Base
  belongs_to :player
  belongs_to :quest
end
class Note < ApplicationRecord
  enum type: [:plan, :summary, :game_notes]
end

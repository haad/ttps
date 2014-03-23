class PlayersTravel < ActiveRecord::Base
  belongs_to :player
  belongs_to :travel
end

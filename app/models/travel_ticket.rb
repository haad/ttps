class TravelTicket < ActiveRecord::Base
    belongs_to :travel
    has_one :player
    validates_presence_of :name
    validates_presence_of :ticket_img
    validates_presence_of :travel_id
    validates_presence_of :player_id

    mount_uploader :ticket_img, PictureUploader
end

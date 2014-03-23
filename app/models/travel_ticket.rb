class TravelTicket < ActiveRecord::Base
    belongs_to :travel
    belongs_to :player
    validates_presence_of :name
    validates_presence_of :ticket_img
    validates_presence_of :ticket_sum
    validates_presence_of :travel_id
    validates_presence_of :player_id


    validate :number_of_drivers_per_travel

    def number_of_drivers_per_travel
      unless travel.cars_count >= number_of_drivers + 1
        errors.add(:number_of_drivers_per_travel,
          "You can't have more drivers(#{number_of_drivers}) than cars(#{travel.cars_count}) assigned to this travel.")
      end
    end

    #
    # Returns number of drivers for a travel to which current TravelTicket is attached.
    #
    def number_of_drivers
      travel.travel_tickets.group_by { |e| e.player_id }.keys.count
    end

    mount_uploader :ticket_img, PictureUploader
end

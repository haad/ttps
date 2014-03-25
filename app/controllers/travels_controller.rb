class TravelsController < ApplicationController
  before_filter :require_login
  before_action :set_travel, only: [:show, :edit, :update, :destroy]

  # GET /travels
  def index
    @travels = Travel.all
  end

  # GET /travels/1
  def show

    if @travel.cars_count != @travel.travel_tickets.count
      flash.now[:alert] = "You don't have enough Travel tickets assigned to this travel you need #{@travel.cars_count - @travel.travel_tickets.count} more."
    end

    @travel_tickets=@travel.travel_tickets.to_a
  end

  # GET /travels/new
  def new
    #binding.pry
    @travel = Travel.new
    @travel_ticket = @travel.travel_tickets.build
    @players = Player.all.to_a
  end

  # GET /travels/1/edit
  def edit
      @players = Player.all.to_a
  end

  # POST /travels
  def create
    @travel = Travel.new(travel_params)
    if @travel.save
      unless params[:travel]["players"].nil?
        @travel.players = []
        params[:travel]["players"].map do |d|
          p = Player.find_by_id(d)
          @travel.players << p unless p.nil?
        end
      end
      redirect_to @travel, notice: 'Travel was successfully created.'
    else
      render 'new'
    end
  end
  # PATCH/PUT /travels/1
  def update
    if @travel.update(travel_params)
      unless params[:travel]["players"].nil?
        @travel.players = []
        params[:travel]["players"].map do |d|
          p = Player.find_by_id(d)
          @travel.players << p unless p.nil?
        end
        @travel.travel_tickets.each do |ticket|
          unless @travel.players.map(&:id).include?(ticket.player.id)
            @travel.players << ticket.player
          end
        end
      end
      redirect_to @travel, notice: 'Travel was successfully updated.'
    else
      render 'edit'
    end
  end

  # DELETE /travels/1
  def destroy
    @travel.destroy
    redirect_to travels_url, notice: 'Travel was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_travel
      @travel = Travel.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def travel_params
      params.require(:travel).permit(:destination, :description, :cars_count, :travel_distance, :travel_date,
                                     :travel_ticket_attributes => [:ticket_img, :player_id, :name, :ticket_sum])
    end
end

class TravelTicketsController < ApplicationController
  before_filter :require_login
  before_action :set_travel_ticket, only: [:show, :edit, :update, :destroy]

  # GET /travel_tickets
  def index
    @travel_tickets = TravelTicket.all
  end

  # GET /travel_tickets/1
  def show
  end

  # GET /travel_tickets/new
  def new
    @travel_ticket = TravelTicket.new
    @players = Player.all.to_a
    @travels = Travel.all.to_a
  end

  # GET /travel_tickets/1/edit
  def edit
    @players = Player.all.to_a
    @travels = Travel.all.to_a
  end

  # POST /travel_tickets
  def create
    @travel_ticket = TravelTicket.new(travel_ticket_params)
    @players = Player.all.to_a
    @travels = Travel.all.to_a

    if @travel_ticket.save
      unless @travel_ticket.travel.players.include?(@travel_ticket.player)
        @travel_ticket.travel.players << @travel_ticket.player
      end
      redirect_to @travel_ticket, notice: 'Travel ticket was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /travel_tickets/1
  def update
    @travels = Travel.all.to_a
    @players = Player.all.to_a

    if @travel_ticket.update(travel_ticket_params)
      redirect_to @travel_ticket, notice: 'Travel ticket was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /travel_tickets/1
  def destroy
    @travel_ticket.destroy
    redirect_to travel_tickets_url, notice: 'Travel ticket was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_travel_ticket
      @travel_ticket = TravelTicket.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def travel_ticket_params
      params.require(:travel_ticket).permit(:name, :ticket_img, :travel_id, :player_id, :ticket_sum)
    end
end

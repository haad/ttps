class TravelsController < ApplicationController
  before_action :set_travel, only: [:show, :edit, :update, :destroy]

  # GET /travels
  def index
    @travels = Travel.all
  end

  # GET /travels/1
  def show
    @travel_tickets=@travel.travel_tickets.all
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
  end
    require 'pry'

  # POST /travels
  def create
    @travel = Travel.new(travel_params)
    binding.pry
    if @travel.save
      unless params["travel_tickets"]["ticket_img"].nil?
        params["travel_tickets"]["ticket_img"].each do |a|
          @travel_ticket = @travel.travel_tickets.create!(:ticket_img => a, :travel_id => @travel.id, :name => params[:travel_tickets]['ticket_name'][0].to_s, :player_id => params[:travel_tickets]['ticket_player'][0].to_i)
        end
      end
      redirect_to @travel, notice: 'Travel was successfully created.'
    else
      render action: 'new'
    end
  end
  # PATCH/PUT /travels/1
  def update
    if @travel.update(travel_params)
      #binding.pry
      unless params["travel_tickets"]["ticket_img"].nil?
        params["travel_tickets"]["ticket_img"].each do |a|
          @travel_ticket = @travel.travel_tickets.create!(:ticket_img => a, :travel_id => @travel.id, :name => params[:travel_tickets]['ticket_name'][0].to_s, :player_id => params[:travel_tickets]['ticket_player'][0].to_i)
        end
      end
      redirect_to @travel, notice: 'Travel was successfully updated.'
    else
      render action: 'edit'
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
      params.require(:travel).permit(:destination, :description, :players_count, :cars_count, :travel_costs,
                                     :travel_distance, :travel_date,
                                     travel_ticket_attributes: [:ticket_img, :travel_id, :ticket_name, :ticket_player])
    end
end

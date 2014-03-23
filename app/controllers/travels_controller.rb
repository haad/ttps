class TravelsController < ApplicationController
  before_filter :require_login
  before_action :set_travel, only: [:show, :edit, :update, :destroy]

  # GET /travels
  def index
    @travels = Travel.all
  end

  # GET /travels/1
  def show
#    require 'pry'
#    binding.pry
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
      unless params[:travel][:travel_tickets].nil? or params["travel_tickets"][:ticket_img].nil?
        params[:travel][:travel_tickets][:ticket_img].each do |a|
          @travel_ticket = @travel.travel_tickets.create!(:ticket_img => a, :travel_id => @travel.id, :name => params[:travel][:travel_tickets][:name], :player_id => params[:travel][:travel_tickets][:player_id])
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
      unless params[:travel][:travel_tickets].nil? or params[:travel][:travel_tickets][:ticket_img].nil?
        params[:travel][:travel_tickets][:ticket_img].each do |a|
          @travel_ticket = @travel.travel_tickets.create!(:ticket_img => a, :travel_id => @travel.id, :name => params[:travel][:travel_tickets][:name], :player_id => params[:travel][:travel_tickets][:player_id])
        end
      end

      unless params[:travel]["players"].nil?
        params[:travel]["players"].map do |d|
          p = Player.find_by_id(d)
          @travel.players << p if not p.nil?
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
      params.require(:travel).permit(:destination, :description, :cars_count, :travel_costs,
                                     :travel_distance, :travel_date,
                                     :travel_ticket_attributes => [:ticket_img, :player_id, :name])
    end
end

class PaymentsController < ApplicationController
  before_action :set_payment, only: [:show, :edit, :update, :destroy]

  # GET /payments
  def index
    @payments = Payment.all
  end

  # GET /payments/1
  def show
  end

  # GET /payments/new
  #
  # We should be able to choose only from travels where player is already.
  #
  def new
    @payment = Payment.new
    @players = Player.all
    @travels = Travel.all
  end

  # GET /payments/1/edit
  def edit
    @players = Player.all
    @travels = Travel.all
  end

  # POST /payments
  def create
    @payment = Payment.new(payment_params)

    if @payment.save

      redirect_to @payment, notice: 'Payment was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /payments/1
  def update
    if @payment.update(payment_params)
      redirect_to @payment, notice: 'Payment was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /payments/1
  def destroy
    @payment.destroy
    redirect_to payments_url, notice: 'Payment was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment
      @payment = Payment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def payment_params
      params.require(:payment).permit(:payment_amount, :name, :player_id, :travel_id)
    end
end

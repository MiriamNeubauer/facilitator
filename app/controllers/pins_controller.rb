class PinsController < ApplicationController
  before_action :set_pin, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]
  respond_to :html, :xml #answer with xml in addition to html to everythign it responds to

  def index
    @pins = Pin.all
    respond_with(@pins)
  end

  def show
    respond_with(@pin)
  end

  def new
    # @pin = Pin.new
    @pin = current_user.pins.build
    respond_with(@pin)
  end

  def edit
  end

  def create
    # @pin = Pin.new(pin_params)
    @pin = current_user.pins.build(pin_params)
    if @pin.save
      redirect_to @pin, notice: 'Pin was successfully created'
    else
      render action: 'new'
    end
    respond_with(@pin)
  end

  def update
    if @pin.update(pin_params)
      redirect_to @pin, notice: 'Pin was successfully updated'
    else
      render action: 'edit'
    end
    respond_with(@pin)
  end

  def destroy
    @pin.destroy
    redirect_to pins_url
    respond_with(@pin)
  end

  private
    #Use callbacks to share common setups or constraints between actions
    def set_pin
      @pin = Pin.find(params[:id])
    end

    def correct_user
      @pin = current_user.pins.find_by(id: params[:id])
      redirect_to pins_path, notice: "Not authorized to edit this pin" if @pin.nil?
    end

    #Never trust parameter from the scary Internet, only allow the whitelist through.
    def pin_params
      params.require(:pin).permit(:description, :image)
    end
end
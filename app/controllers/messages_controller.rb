class MessagesController < ApplicationController

  before_action :set_message, only: [:show, :edit, :update, :destroy]

  @@counter = 0

  # GET /messages
  # GET /messages.json

  def self.counter
    @@counter
  end

  def index
    @counter = @@counter
    @messages = Message.all
  end

  # GET /messages/new
  def new
    @counter = @@counter
    @message = Message.new
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)

    respond_to do |format|
      if @message.save
        @@counter += 1
        @counter = @@counter
        format.html { redirect_to new_message_path, notice: 'Message was successfully created.' }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to new_message_path, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:text)
    end
end

class EventsController < ApplicationController

  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def show
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to events_path, notice: "Event was saved." }
        format.json { render action: 'show', status: :created, location: @event }
      else
        format.html { render action: 'new', notice: "Event could not be saved, please try again." }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @event.update_attributes(event_params)
        format.html { redirect_to @event, notice: "Event was updated." }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_path, notice: "Event removed." }
      format.json { head :no_content }
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :start_time, :end_time)
  end

  def set_event
    @event = Event.find(params[:id])
  end

end

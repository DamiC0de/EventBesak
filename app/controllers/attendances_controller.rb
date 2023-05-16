class AttendancesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_event
  
    def new
      @attendance = @event.attendances.build
    end
  
    def create
      @attendance = @event.attendances.build(attendance_params)
      @attendance.user = current_user
  
      if @attendance.save
        redirect_to @event, notice: 'You successfully joined the event.'
      else
        render :new
      end
    end
  
    private
  
    def set_event
      @event = Event.find(params[:event_id])
    end
  
    def attendance_params
      params.require(:attendance).permit(:event_id)
    end
  end
  
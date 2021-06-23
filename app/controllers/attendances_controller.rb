class AttendancesController < ApplicationController
    def join
      @attendance = Attendance.new(event_id: params[:id], user_id: current_user.id)
      @attendance.save
      respond_to do |format|
        format.html { redirect_to events_url, notice: "You are attending this event." }
        format.json { head :no_content }
      end
    end

    def destroy
      @attendance = Attendance.find_by(user_id: current_user.id, event_id: params[:id])
      @attendance.destroy
      respond_to do |format|
        format.html { redirect_to events_url, notice: "You were removed from this event." }
        format.json { head :no_content }
      end
    end
end

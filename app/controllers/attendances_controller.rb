class AttendancesController < ApplicationController
  def join
    @attendance = Attendance.new(event_id: params[:id], user_id: current_user.id)
    @attendance.save
    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end

  def destroy
    @attendance = Attendance.find_by(user_id: current_user.id, event_id: params[:id])
    @attendance.destroy
    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end
end

class AppointmentsController < ApplicationController
  before_action :set_doctor
  def index
    @gp = @doctor.appointments.where(specialty: 'general practitioner')
    @opto = @doctor.appointments.where(specialty: 'optometry')
    @dent = @doctor.appointments.where(specialty: 'dentistry')
  end
# In the interest of keeping my project similar to the lesson and not falling back to previous project frameworks,
# I decided to give the doctors specialties that essentially work like roles do in the lesson.
# I also decided to make everyone's appointments visible to all, even though that would violate HIPAA guidelines.
  def show
  end

  def new
    @appointment = @doctor.appointments.new
  end

  def create
    @appointment = @doctor.appointments.new(appointment_params)
    if @appointment.save
      redirect_to @appointment
    else
      render :new
    end
  end
  # I considered giving the option to edit appointments, but the information used for appointments is being pulled from the faker gem, 
  # and I would rather not take the time to make a schedule template for fake doctors 

  def destroy
    @appointment = @doctor.appointments.find(params[:id])
    @appointment.destroy
    redirect_to doctor_appointments_path(@doctor)
  end

  private
  def set_doctor
    @doctor = Doctor.find(params[:doctor_id])
# This is the 2nd time that I haven't been able to find a model id while in a nested model's controller. I would legit like some help understanding what I'm doing wrong
# I've checked the routes in the localhost routes page, and the doctor id is in the show url, but it's still not showing up
# I've also checked all instances of the nested model in the rails console and they do have a doctor's id, so I'm not sure why I can't pull up doctor info
  end

  def appointment_params
    params.require(:appointment).permit(:time, :user_id)
  end
end

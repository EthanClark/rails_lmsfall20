class EnrollmentsController < ApplicationController
  before_action :set_course
  def index
    # @enrollments = @course.enrollments
    @teachers = @course.enrollments.where(role: 'teacher')
    @tas = @course.enrollments.where(role: 'ta')
    @students = @course.enrollments.where(role: 'student')
  end
  # TODO
  def show
  end
  def new
    @users = User.all - @course.users
    @enrollment = @course.enrollments.new
  end
  def create
    @enrollment = @course.enrollments.new(enrollment_params)
    if @enrollment.save
      redirect_to course_enrollments_path(@course)
    else
      render :new
    end
  end
  #TODO
  def edit
  end
  def destroy
    @course.enrollments.find(params[:id]).destroy
    redirect_to course_enrollments_path(@course)
  end
  private
    def set_course
      @course = Course.find(params[:course_id])
    end
    def enrollment_params
      params.require(:enrollment).permit(:role, :user_id)
    end
end
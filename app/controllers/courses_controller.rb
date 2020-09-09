class coursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  def index
    @courses = course.all
  end
  def show
  end
  def new
    @course = course.new
  end
  def create
    @course = course.new(course_params)
    if @course.save
      redirect_to @course
    else
      render :new
    end
  end
  def edit
  end
  def update
    if @course.update(course_params)
      redirect_to @course
    else
      render :edit
    end
  end
  def destroy
    @course.destroy
    redirect_to courses_path
  end
  private 
    def set_course
      @course = course.find(params[:id])
    end
    def course_params
      params.require(:course).permit(:name)
    end
end
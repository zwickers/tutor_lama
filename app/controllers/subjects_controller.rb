class SubjectsController < ApplicationController
  def show
    if current_user
      @subject = Subject.find(params[:id])
      @numbers = Number.where(subject_id: @subject.id)
    end
  end

  def index
    if current_user
      @subjects = Subject.all
    end
  end

  def create
    @subject = Subject.find_by_name(params[:name])
    unless @subject
      @subject = Subject.create(name: params[:name])
      @subject.save
    end
    redirect_to subject_numbers_path(@subject)
  end

  private
  def subject_param
    params.permit(:name)
  end
end

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
    @subject = Subject.create(name: params[:name])
    if @subject.save
      redirect_to subject_numbers_path(@subject)
    end
  end

  private
  def subject_param
    params.permit(:name)
  end
end

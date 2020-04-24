class NumbersController < ApplicationController
  def show
    if current_user
      @subject = Subject.find(params[:subject_id])
      @number = Number.find(params[:id])
      @tutor_searches = TutorSearch.where(number_id: @number.id)
      @tutee_searches = TuteeSearch.where(number_id: @number.id)
    end
  end

  def index
    if current_user
      @subject = Subject.find(params[:subject_id])
      @numbers = Number.where(subject_id: params[:subject_id])
    end
  end

  def create
    @subject = Subject.find(params[:subject_id])
    @number = Number.find_by(name: params[:name], subject_id: @subject.id)
    unless @number
      @number = @subject.numbers.create(name:params[:name])
      @number.save
    end
    redirect_to subject_number_path(subject_id: @subject.id, id:@number.id)
  end
end

class TutorSearchesController < ApplicationController
  def index
    @tutor_searches = TutorSearch.all
  end

  def new
    @tutor_search = TutorSearch.new
  end

  def edit
    @tutor_search = TutorSearch.find(params[:id])
  end

  def create
    @tutor_search = current_user.tutor_searches.create(tutor_search_params)
    if @tutor_search.save
      redirect_to @tutor_search
    else
      render 'new'
    end
  end

  def show
    @tutor_search = TutorSearch.find(params[:id])
  end

  private
  def tutor_search_params
    params.permit(:title, :text)
  end
end

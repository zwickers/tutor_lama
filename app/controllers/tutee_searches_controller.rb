class TuteeSearchesController < ApplicationController
  def index
    @tutee_searches = TuteeSearch.all
  end

  def new
    @tutee_search = TuteeSearch.new
  end

  def edit
    @tutee_search = TuteeSearch.find(params[:id])
  end

  def create
    @tutee_search = current_user.tutee_searches.create(tutee_search_params)
    if @tutee_search.save
      redirect_to @tutee_search
    else
      render 'new'
    end
  end

  def show
    @tutee_search = TuteeSearch.find(params[:id])
  end

  private
  def tutee_search_params
    params.permit(:title, :text)
  end
end
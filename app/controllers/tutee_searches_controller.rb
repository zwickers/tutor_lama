class TuteeSearchesController < ApplicationController
  def index
    @tutee_searches = TuteeSearch.all
  end

  def new
    @tutee_search = TuteeSearch.new
    puts(params)
    @number = Number.find(params[:number_id])
  end

  def edit
    @tutee_search = TuteeSearch.find(params[:id])
  end

  def create
    @tutee_search = current_user.tutee_searches.create(tutee_search_params)
    @tutee_search.number_id = params[:number_id]
    puts(params)
    if @tutee_search.save
      redirect_to @tutee_search
    else
      render 'new'
    end
  end

  def show
    @tutee_search = TuteeSearch.find(params[:id])
    puts(@tutee_search.number_id)
  end

  private
  def tutee_search_params
    params.permit(:title, :text)
  end
end

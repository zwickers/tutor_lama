class TutorSearchesController < ApplicationController
  def index
    @tutor_searches = TutorSearch.all
  end

  def new
    @tutor_search = TutorSearch.new
    @number = Number.find(params[:number_id])
  end

  def edit
    @tutor_search = TutorSearch.find(params[:id])
  end

  def create
    @tutor_search = current_user.tutor_searches.create(tutor_search_params)
    @tutor_search.number_id = params[:number_id]
    if @tutor_search.save
      redirect_to @tutor_search
    else
      render 'new'
    end
  end

  def show
    @tutor_search = TutorSearch.find(params[:id])
    @owner = current_user.id == @tutor_search.user.id
  end

  def destroy
    begin 
      @tutor_search = TutorSearch.find(params[:id])
      @tutor_search.destroy
      puts "Successful Delete Tutor Search" 
      redirect_to users_me_path
    rescue
      puts "Post has been deleted, Passed"
      redirect_to users_me_path
    end
  end 


  private
  def tutor_search_params
    params.permit(:title, :text)
  end
end

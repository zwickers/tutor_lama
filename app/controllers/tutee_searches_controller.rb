class TuteeSearchesController < ApplicationController
  def index
    if current_user
      @tutee_searches = TuteeSearch.all
    end
  end

  def new
    if current_user
      @tutee_search = TuteeSearch.new
      @number = Number.find(params[:number_id])
    end
  end

  def edit
    if current_user
      @tutee_search = TuteeSearch.find(params[:id])
    end
  end

  def create
    if current_user
      @tutee_search = current_user.tutee_searches.create(tutee_search_params)
      @tutee_search.number_id = params[:number_id]
      if @tutee_search.save
        redirect_to @tutee_search
      else
        render 'new'
      end
    end
  end

  def show
    if current_user
      @tutee_search = TuteeSearch.find(params[:id])
      @owner = current_user.id == @tutee_search.user.id
    end
  end

  def destroy
    begin 
      @tutee_search = TuteeSearch.find(params[:id])
      @tutee_search.destroy
      puts "Successful Delete Tutee Search" 
      redirect_to users_me_path
    rescue
      puts "Post has been deleted, Passed"
      redirect_to users_me_path
    end
  end 

  private
  def tutee_search_params
    params.permit(:title, :text)
  end
end

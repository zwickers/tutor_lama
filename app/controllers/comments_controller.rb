class CommentsController < ApplicationController

  # get form for comment
  def new_comment
    puts params[:post_type]
    puts @create_comment_route
    @create_comment_route = "/comments/" + params[:post_type] + "/" + params[:id]
  end

  # submit comment form
  def create_comment
    comment_text = params["comment_text"]["text"]
    if params[:post_type] ==  "tutor"
      tutor_search_id = params[:id]
    else 
      tutee_search_id = params[:id]
    end
    Comment.create(text: comment_text, tutor_search_id: tutor_search_id, tutee_search_id: tutee_search_id, author: current_user.name)
    new_url = "/" + params[:post_type] + "_searches/#{params[:id]}"
    redirect_to new_url
  end
end

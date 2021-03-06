class RequestsController < ApplicationController
  def create
    puts('****')
    @request = Request.create(text: params[:text], title: params[:title], contact: params[:contact],
                              number_id: params[:number_id], requester_id: params[:requester_id],
                              receiver_id: params[:receiver_id])
    if params[:tutee_search_id]
      @request.tutee_search_id = params[:tutee_search_id]
    end

    if params[:tutor_search_id]
      @request.tutor_search_id = params[:tutor_search_id]
    end

    if @request.save
      redirect_to @request
    end
  end

  def show
    puts(params)
    @request = Request.find(params[:id])
  end
end

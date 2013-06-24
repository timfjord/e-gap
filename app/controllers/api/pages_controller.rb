class Api::PagesController < ApplicationController
  include ActionController::MimeResponds
  respond_to :json, :xml
  
  def index
    respond_with :api, Page.all
  end
  
  def published
    respond_with :api, Page.published.order('published_on DESC')
  end
  
  def unpublished
    respond_with :api, Page.unpublished.order('published_on DESC')
  end

  def show
    respond_with :api, Page.find(params[:id])
  end

  def create
    respond_with :api, Page.create(params[:page])
  end

  def update
    respond_with :api, Page.update(params[:id], params[:page])
  end
  
  def publish
    respond_with :api, Page.find(params[:id]).publish
  end
  
  def unpublish
    respond_with :api, Page.find(params[:id]).unpublish
  end
  
  def total_words
    respond_with :api, Page.find(params[:id]).total_words
  end

  def destroy
    respond_with :api, Page.destroy(params[:id])
  end
end

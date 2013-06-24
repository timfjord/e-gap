class Api::PagesController < ApplicationController
  include ActionController::MimeResponds
  respond_to :json, :xml
  
  def index
    respond_with :api, Page.all
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

  def destroy
    respond_with :api, Page.destroy(params[:id])
  end
end

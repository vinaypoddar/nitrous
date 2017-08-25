class Api::V1::BlogsController < ApplicationController
  before_action :authenticate

  def index
    @blogs = Blog.all
    respond_to do |format|
      format.json { render :json => @blogs}
    end
  end

  def show
    @blog = Blog.find(params[:id])
    respond_to do |format|
      format.json { render :json => @blog}
    end
  end

  private
    def authenticate
      unless User.find_by_auth_token(params[:auth_token]).present?
        render json: "Unauthorised User", status: 401
      end
    end

end
class BlogsController < ApplicationController

  before_action :require_user, only: [:new, :show]

  def index
    @blogs = Blog.all
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.author = current_user
    if @blog.save
      flash[:notice] = "Blog created successfully"
      redirect_to(blog_path(@blog.id))
    else
      render("new")
    end
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update_attributes(blog_params)
      flash[:notice] = "Blog Successfully Updated"
      redirect_to(:action => "show", :id => params[:id])
    else
      flash[:notice] = "Something went wrong please try again!!"
      render("edit/#{params[:id]}")
    end
  end

  def delete
  end

  def destroy
  end

  private
    def blog_params
      params.require(:blog).permit(:title, :desc, :author, :rating)
    end
end

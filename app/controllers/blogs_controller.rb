class BlogsController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  def index
    @blogs = Blog.all
    @blog = Blog.new
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    # respond_to do |format|
    #   format.json{
    #     if @blog.save
    #       render json: @blog
    #     else
    #       render nothing: true
    #     end
    #   }
    # end
    if @blog.save
      render :show_ajax, layout: false
    else
    end
  end

  def show
  end

  def edit
  end

  def update
    if @blog.update(blog_params)
      redirect_to @blog
    else
      render :edit
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path
  end

  private
    def blog_params
      params.require(:blog).permit(:title, :body)
    end

    def set_blog
      @blog = Blog.find(params[:id])
    end

    def authenticate_user!
      redirect_to "/" unless session[:user_id].present?
    end
end

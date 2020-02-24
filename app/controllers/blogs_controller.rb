class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy, :change_status]
  access all: [:show, :index], user: {except: [:destroy, :new, :edit, :create, :update, :change_status]}, admin: :all
  layout "blog"

  # GET /blogs
  # GET /blogs.json
  def index
    # kaminari/pagination gem
    @blogs = Blog.page(params[:page]).per(5)
    @page_title = "Other-side.net | Blog"
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
    @page_title = @blog.title
    @seo_keywords = @blog.body
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: 'Blog post was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'Blog post was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Blog post was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  def change_status
    if @blog.draft?
      @blog.published!
      respond_to do |format|
        format.html { redirect_to blogs_url, notice: "Blog entry status was updated from 'draft' to 'published'" }
      end
    else
      @blog.draft!
      respond_to do |format|
        format.html { redirect_to blogs_url, notice: "Blog entry status was updated from 'published' to 'draft'" }
      end
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blog_params
      params.require(:blog).permit(:title, :body, :categories)
    end
end

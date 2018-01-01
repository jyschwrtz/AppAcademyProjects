class PostsController < ApplicationController
  before_action :require_logged_in

  def new
    @post = Post.new
    @subs = Sub.all
  end

  def create
    @post = current_user.posts.new(post_params)
    # @post.author_id = current_user.id
    # @post.sub_ids = post_params[:sub_ids]
    if @post.save!
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def edit
    @post = current_user.posts.find_by(id: params[:id])
  end

  def update
    @post = current_user.posts.find_by(id: params[:id])
    unless @post
      flash.now[:errors] = "Unable to edit this post"
      return render :edit
    end
    if @post.update(post_params)
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def destroy
    @post = current_user.posts.find_by(id: params[:id])
    unless @post
      flash.now[:errors] = "Unable to edit this post"
      return redirect_to subs_url
    end
    @post.destroy
    redirect_to subs_url

  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :content, sub_ids: [])
  end

end

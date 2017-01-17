class PostsController < ApplicationController

  # where all the methods are defined for the corresponding views

  # displays all posts on index route
  def index
  @posts = Post.all
  end

  def new
  end

  # method is triggered when the router hears a request
  def create
    @new_post = Post.create(
      title: params[:post][:title],
      content: params[:post][:content],
      user_id: params[:post][:user_id]
    )
      # when method create successful redirect user to home page else redirect to sign up
    if @new_post
      redirect_to url_for(:controller => :posts, :action => :index)
      # if not the controller redirects to a new post url
    else
      redirect_to url_for(:controller => :posts, :action => :new)
    end
  end

  def show
    # instance variables are created and can be used in corresponding view
    @post = Post.find(params[:id])
    @post_user = @post.user.fname
    @comments = @post.comments

    if session[:post_id] # if logged in
      @message = "You're now logged in!"
    else
      @message = "You're not logged in yet"
    end
  end

# post can be edited by looking for the id corresponding the post created
  def edit
    @post = Post.find(params[:id])
  end

# THIS METHOD ALLOWS THE TITLE AND CONTENT TO BE UPDATED
  def update
    @post = Post.find(params[:id])
    @post.update({
      title: params[:post][:title],
      content: params[:post][:content],
      user_id: params[:post][:user_id]
    })

    if (@post)
      redirect_to url_for(:controller => :posts, :action => :index)
    else
      redirect_to url_for(:controller => :posts, :action => :edit)
    end
  end

  # THIS METHOD allows to delete the post
  def destroy
    Post.delete(params[:id])
    redirect_to url_for(:controller => :posts, :action => :index)
  end
end

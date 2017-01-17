class UsersController < ApplicationController

  # where all the methods are defined for the corresponding views
    # users on index route
    def index
      @users  = User.all
    end

    def new
      @message = "sign up to my blog"
    end

    # method is triggered when the router hears a request
    def create
      @new_user = User.create(
      fname: params[:user][:fname],
      lname: params[:user][:lname],
      password: params[:user][:password],
      username: params[:user][:username],
      email: params[:user][:email]
      )
      # when method create successful redirect user to home page else redirect to sign up
      if @new_user
        session[:user_id] = @new_user.id
        redirect_to url_for(:controller => :users, :action => :index)
      else
        redirect_to url_for(:controller => :users, :action => :new)
      end
    end

    def show
        # instance variables are created and can be used in corresponding view

      @user = User.find(params[:id])
      # get users post based on this id
      @user_posts = @user.posts

      if session[:user_id]
        @message = "you are logged in"
      else
        @message = "not logged in yet"
      end
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
    @user = User.find(params[:id])
    @user.update({
      fname: params[:user][:fname],
      lname: params[:user][:lname],
      password: params[:user][:password],
      username: params[:user][:username],
      email: params[:user][:email]
    })

    if (@user)
      redirect_to url_for(:controller => :users, :action => :index)
    else
      redirect_to url_for(:controller => :users, :action => :edit)
    end
  end
  # ends the session and redirect to home
  def destroy
    User.delete(params[:id])
    session.destroy
    redirect_to url_for(:controller => :users, :action => :index)
  end

  def login_form
    if session[:user_id] # if logged in
      @message = "You're logged in!"
    else
      @message = "You're not logged in"
    end
  end

  def create_login
    @user = User.where(username: params[:username], password:
    # finds the first password in array
   params[:password]).first

    if @user
      session[:user_id] = @user.id
      # redirect_to url_for(:controller => :users, :action => :index)
      redirect_to user_path(session[:user_id])
    else
      redirect_to url_for(:controller => :users, :action => :login)
    end
  end

# THIS METHOD allows to end the current session
  def logout
      session.destroy
      redirect_to url_for(:controller => :users, :action => :index)
  end

end

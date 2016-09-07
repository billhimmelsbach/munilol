class UsersController < ApplicationController
  include AuthHelper

  def new
    @user = User.new
    render :new
  end

  def create
    # TODO: This method needs a more descriptive name. Maybe create_user? It's
    #       not immediately clear what it does without scrolling down. Also,
    #       why is this necessary? You should just write @user = User.new(user_params)
    #       in the create method. I'm not aware of any reason to break this out into a private method.
    set_user
    if @user.save
      login(@user)
      flash[:notice] = "User account created! Welcome to Munilol"
      redirect_to @user
    else
      flash[:notice] = "There was a problem creating your account. #{@user.errors.full_messages.join(', ')}."
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find(params[:id])
    @articles = @user.articles.order("created_at DESC")
    render :show
  end

  def edit
    @user = User.find(params[:id])
    # TODO: Refactor to use 'unless' instead of ! and if
    auth_fail("edit other people's user information!", @user) if !auth_route(@user)
  end

  def update
    @user = User.find(params[:id])
    if auth_route(@user)
      if @user.update(user_params)
        flash[:success] = "Your profile was successfully updated"
        redirect_to @user
      else
        render :edit
      end
    else
      auth_fail("update other people's user information!", @user)
    end
  end

  def destroy
    @user = User.find(params[:id])
    if auth_route(@user)
      Comment.delete_all(:user => @user.id)
      Article.delete_all(:user => @user.id)
      @user.destroy
      flash[:success] = "Your account has been deactivated."
      redirect_to root_path
    else
      auth_fail("Your account could not be deactivated.", user_path(@user))
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :full_name, :email, :password, :image)
  end

  def set_user
    @user = User.new(user_params)
  end

end

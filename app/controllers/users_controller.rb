class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # Devise require authentication
  before_action :authenticate_user!

  # CanCanCan helper
  load_and_authorize_resource

  # GET /users
  # GET /users.json
  def index
    if current_user.admin?
      @users = User.all
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    if current_user.admin?
      @user = User.new
    else
      redirect_to root_path, notice: "That's no place for you!"
    end
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create

    @user = User.new(user_params)
    @user.confirmed_at = DateTime.now # to prevent email confirmation

    respond_to do |format|
      if @user.save
        format.html { redirect_to root_path, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }

        # Tell the UserMailer to send a welcome email after save
        # UserMailer.with(user: @user).welcome_mail.deliver_now
        # format.html { redirect_to(@user, notice: 'User was successfully created.') }
        # format.json { render json: @user, status: :created, location: @user }

      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update_with_password(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      if current_user.admin?
        format.html { redirect_to users_path, notice: 'User was successfully destroyed.' }
      else
        format.html { redirect_to root_path, notice: 'Hope to see again, bye bye!' }
      end
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
    end
end

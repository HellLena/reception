class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  # load_and_authorize_resource

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    @roles = Role.all.map{|role| {'value' => role.id.to_s, 'text' => role.name}}.to_json
  end

  def new

  end

  def create
    @user = User.new
    if user_params[:password] != user_params[:password_confirmation]
      respond_to do |format|
        @user.errors.messages['pass'] = 'Пароли не совпадают'
        format.js
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    else
      @user.password = user_params[:password]
      @user.email = user_params[:email]
      @user.roles = []
      @user.roles << Role.find(user_params[:roles])

      @roles = Role.all.map{|role| {'value' => role.id.to_s, 'text' => role.name}}.to_json

      respond_to do |format|
        if @user.save
          format.js
        else
          format.js
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end

  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/1/edit
  def edit
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if params[:name] == 'roles'
      @user.roles = []
      @user.roles << Role.find(params[:value])
    else
      @user.update(params[:name] => params[:value])
    end
    respond_to do |format|
      if @user.save
        format.js
      else
        format.js
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.js
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :roles)
  end
end

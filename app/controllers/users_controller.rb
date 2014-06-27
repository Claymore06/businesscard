class UsersController < ApplicationController
  before_action :set_company
  before_action :set_group
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = @group.users.page(params[:page])
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = @group.users.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = Company.find(params[:company_id]).groups.find(params[:group_id]).users.new(user_params)

      if @user.save
         redirect_to company_group_user_path(@user.group.company_id, @user.group_id, @user), notice: '正常に作成しました'
         render :show, status: :created, location: @user
      else
         render :new
         render json: @user.errors, status: :unprocessable_entity
      end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
      if @user.update(user_params)
         redirect_to  company_group_user_path(@user.group.company_id, @user.group_id, @user), notice: '正常に更新しました'
         render :show, status: :ok, location: @user
      else
         render :edit
         render json: @user.errors, status: :unprocessable_entity
      end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
       redirect_to company_group_users_path, notice: '正常に削除しました'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :mail, :tel)
    end
end

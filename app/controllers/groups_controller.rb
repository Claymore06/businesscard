class GroupsController < ApplicationController
  before_action :set_company
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  # GET /groups
  # GET /groups.json
  def index
    @groups = @company.groups.page(params[:page])
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
  end

  # GET /groups/new
  def new
    @group = @company.groups.new
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Company.find(params[:company_id]).groups.new(group_params)
      if @group.save
         redirect_to company_group_path(@group.company_id,@group.id), notice: '正常に作成しました'
      else
         render :new
      end
  end

  # PATCH/PUT /groups/1
  def update
      if @group.update(group_params)
         redirect_to company_group_path(@group.company_id,@group.id), notice: '正常に更新しました'
      else
         render :edit
      end
  end

  # DELETE /groups/1
  def destroy
    @group.destroy
    redirect_to company_groups_url(params[:company_id]), notice: '正常に削除しました'
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:name)
    end
end

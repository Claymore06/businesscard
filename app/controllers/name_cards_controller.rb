class NameCardsController < ApplicationController
  before_action :set_name_card, only: [:show, :edit, :update, :destroy]

  # GET /name_cards
  # GET /name_cards.json
  def index
    @company = Company.find(params[:company_id])
    @group = @company.groups.find(params[:group_id])
    @user = @group.users.find(params[:user_id])
    @name_cards = @user.name_cards
  end

  # GET /name_cards/1
  # GET /name_cards/1.json
  def show
  end

  # GET /name_cards/new
  def new
    @company = Company.find(params[:company_id])
    @group = @company.groups.find(params[:group_id])
    @user = @group.users.find(params[:user_id])
    @name_card = @user.name_cards.new
  end

  # GET /name_cards/1/edit
  def edit
  end

  # POST /name_cards
  # POST /name_cards.json
  def create
    @name_card = Company.find(params[:company_id]).groups.find(params[:group_id]).users.find(params[:user_id]).name_cards.new(name_card_params)

    respond_to do |format|
      if @name_card.save
        format.html { redirect_to company_group_user_name_card_path(@name_card.user.group.company_id, @name_card.user.group_id, @name_card.user.id, @name_card.id), notice: 'Name card was successfully created.' }
        format.json { render :show, status: :created, location: @name_card }
      else
        format.html { render :new }
        format.json { render json: @name_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /name_cards/1
  # PATCH/PUT /name_cards/1.json
  def update
    respond_to do |format|
      if @name_card.update(name_card_params)
        format.html { redirect_to company_group_user_name_card_path(@name_card.user.group.company_id, @name_card.user.group_id, @name_card.user.id, @name_card.id), notice: 'Name card was successfully updated.' }
        format.json { render :show, status: :ok, location: @name_card }
      else
        format.html { render :edit }
        format.json { render json: @name_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /name_cards/1
  # DELETE /name_cards/1.json
  def destroy
    @name_card.destroy
    respond_to do |format|
      format.html { redirect_to company_group_user_name_cards_url, notice: 'Name card was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_name_card
      @company = Company.find(params[:company_id])
      @group = @company.groups.find(params[:group_id])
      @user = @group.users.find(params[:user_id])
      @name_card = @user.name_cards.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def name_card_params
      params.require(:name_card).permit(:name, :address, :fax, :tel, :url)
    end
end

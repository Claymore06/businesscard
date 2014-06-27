class NameCardsController < ApplicationController
  before_action :set_company
  before_action :set_group
  before_action :set_user 
  before_action :set_name_card, only: [:show, :edit, :update, :destroy]

  # GET /name_cards
  # GET /name_cards.json
  def index
     @name_cards = @user.name_cards.page(params[:page])
  end

  # GET /name_cards/1
  # GET /name_cards/1.json
  def show
  end

  # GET /name_cards/new
  def new
    @name_card = @user.name_cards.new
  end

  # GET /name_cards/1/edit
  def edit
  end

  # POST /name_cards
  # POST /name_cards.json
  def create
    @name_card = Company.find(params[:company_id]).groups.find(params[:group_id]).users.find(params[:user_id]).name_cards.new(name_card_params)

      if @name_card.save
         redirect_to company_group_user_name_card_path(@name_card.user.group.company_id, @name_card.user.group_id, @name_card.user.id, @name_card.id), notice: '正常に作成しました'
      else
         render :new
      end
  end

  # PATCH/PUT /name_cards/1
  # PATCH/PUT /name_cards/1.json
  def update
      if @name_card.update(name_card_params)
         redirect_to company_group_user_name_card_path(@name_card.user.group.company_id, @name_card.user.group_id, @name_card.user.id, @name_card.id), notice: '正常に更新しました'
      else
         render :edit
      end
  end

  # DELETE /name_cards/1
  # DELETE /name_cards/1.json
  def destroy
    @name_card.destroy
       redirect_to company_group_user_name_cards_url, notice: '正常に削除しました'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_name_card
     @name_card = @user.name_cards.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def name_card_params
      params.require(:name_card).permit(:name, :address, :fax, :tel, :url)
    end
end

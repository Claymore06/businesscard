class NameCardsController < ApplicationController
  before_action :set_name_card, only: [:show, :edit, :update, :destroy]

  # GET /name_cards
  # GET /name_cards.json
  def index
    @name_cards = NameCard.all
  end

  # GET /name_cards/1
  # GET /name_cards/1.json
  def show
  end

  # GET /name_cards/new
  def new
    @name_card = NameCard.new
  end

  # GET /name_cards/1/edit
  def edit
  end

  # POST /name_cards
  # POST /name_cards.json
  def create
    @name_card = NameCard.new(name_card_params)

    respond_to do |format|
      if @name_card.save
        format.html { redirect_to @name_card, notice: 'Name card was successfully created.' }
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
        format.html { redirect_to @name_card, notice: 'Name card was successfully updated.' }
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
      format.html { redirect_to name_cards_url, notice: 'Name card was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_name_card
      @name_card = NameCard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def name_card_params
      params.require(:name_card).permit(:name, :address, :fax, :tel, :url)
    end
end

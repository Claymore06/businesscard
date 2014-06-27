class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  # GET /companies
  # GET /companies.json
  def index
    @companies = Company.all.page(params[:page]).per(5)
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
  end

  # GET /companies/new
  def new
    @company = Company.new
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(company_params)
      if @company.save
        redirect_to @company, notice: '正常に作成しました'
      else
        render :new 
      end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
      if @company.update(company_params)
        redirect_to @company, notice: '正常に更新しました'
      else
        render :edit
      end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.destroy
    redirect_to companies_url, notice: '正常に削除しました'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:name, :address, :fax, :tel, :url)
    end
end

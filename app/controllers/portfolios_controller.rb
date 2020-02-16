class PortfoliosController < ApplicationController
  before_action :set_portfolio, only: [:edit, :update, :show, :destroy]
  layout "portfolio"
  
  def index
    @portfolio_items = Portfolio.all
  end

  def react
    @react_items = Portfolio.react
  end

  def rails
    @rails_items = Portfolio.rails
  end

  def new
    @portfolio_item = Portfolio.new
    # refactor later w/ JS to add another item check box/similar feature:
    3.times { @portfolio_item.technologies.build }
  end

  def create
    @portfolio_item = Portfolio.new(portfolio_params)
    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'A project was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html {redirect_to portfolios_path, notice: 'Project item was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
  end

  def destroy
    @portfolio_item.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Project item was successfully deleted.' }
    end
  end

  private
  def set_portfolio
    @portfolio_item = Portfolio.find(params[:id])
  end

  # to allow attrs/whitelisting
  def portfolio_params
    params.require(:portfolio).permit(:title, :subtitle, :body, technologies_attributes: [:name])
  end

end

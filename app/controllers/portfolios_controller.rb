class PortfoliosController < ApplicationController
  # before_action :set_portfolio

  def index
    @portfolio_items = Portfolio.all
  end

  def new
    @portfolio_item = Portfolio.new
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

  private
  def set_portfolio
    @portfolio = Portfolio.find(params[:id])
  end

  # to allow attrs/whitelisting
  def portfolio_params
    params.require(:portfolio).permit(:title, :substitle, :body)
  end

end

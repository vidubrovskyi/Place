class StaticPageController < ApplicationController
  def index
    @shops = Shop.all
    @stocks = Stock.all
    @hits = Hit.all
  end
end

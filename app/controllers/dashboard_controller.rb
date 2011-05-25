class DashboardController < ApplicationController
  def show
    @stores = Store.find(:all, :order => :id)
  end
end

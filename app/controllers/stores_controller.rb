class StoresController < ApplicationController
  def index
    @stores = Store.all
    
    respond_to do |format|
       format.html # index.html.erb
       format.xml  { render :xml => @stores }
     end    
  end
  
  def show
    @store = Store.find(params[:id])

    respond_to do |format|
       format.html # index.html.erb
       format.xml  { render :xml => @stores }
     end    
  end
  
end

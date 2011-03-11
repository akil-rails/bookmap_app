class MembersController < ApplicationController
  def index
    @members = Member.all
    
    respond_to do |format|
       format.html # index.html.erb
       format.xml  { render :xml => @members }
     end    
  end
end

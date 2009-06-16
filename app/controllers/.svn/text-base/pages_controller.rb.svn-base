class PagesController < ApplicationController
  # GET /pages
  # GET /pages.xml
  def index
    @pages = PublishedPage.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pages }
    end
  end

  # GET /pages/1
  # GET /pages/1.xml
  def show
    @page = PublishedPage.find(:first, :conditions => {:name => params[:page_name]})

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @page }
    end
  end

end

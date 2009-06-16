class SizesController < ApplicationController
  # GET /sizes
  # GET /sizes.xml
  def index
    @sizes = Size.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sizes }
    end
  end

  # GET /sizes/1
  # GET /sizes/1.xml
  def show
    @size = Size.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @size }
    end
  end

end

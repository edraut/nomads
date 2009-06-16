class ItemColorsController < ApplicationController
  # GET /item_colors
  # GET /item_colors.xml
  def index
    @item_colors = ItemColor.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @item_colors }
    end
  end

  # GET /item_colors/1
  # GET /item_colors/1.xml
  def show
    @item_color = ItemColor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @item_color }
    end
  end

  # GET /item_colors/new
  # GET /item_colors/new.xml
  def new
    @item_color = ItemColor.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @item_color }
    end
  end

  # GET /item_colors/1/edit
  def edit
    @item_color = ItemColor.find(params[:id])
  end

  # POST /item_colors
  # POST /item_colors.xml
  def create
    @item_color = ItemColor.new(params[:item_color])

    respond_to do |format|
      if @item_color.save
        flash[:notice] = 'ItemColor was successfully created.'
        format.html { redirect_to(@item_color) }
        format.xml  { render :xml => @item_color, :status => :created, :location => @item_color }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @item_color.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /item_colors/1
  # PUT /item_colors/1.xml
  def update
    @item_color = ItemColor.find(params[:id])

    respond_to do |format|
      if @item_color.update_attributes(params[:item_color])
        flash[:notice] = 'ItemColor was successfully updated.'
        format.html { redirect_to(@item_color) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @item_color.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /item_colors/1
  # DELETE /item_colors/1.xml
  def destroy
    @item_color = ItemColor.find(params[:id])
    @item_color.destroy

    respond_to do |format|
      format.html { redirect_to(item_colors_url) }
      format.xml  { head :ok }
    end
  end
end

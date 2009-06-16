class ItemSizesController < ApplicationController
  # GET /item_sizes
  # GET /item_sizes.xml
  def index
    @item_sizes = ItemSize.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @item_sizes }
    end
  end

  # GET /item_sizes/1
  # GET /item_sizes/1.xml
  def show
    @item_size = ItemSize.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @item_size }
    end
  end

  # GET /item_sizes/new
  # GET /item_sizes/new.xml
  def new
    @item_size = ItemSize.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @item_size }
    end
  end

  # GET /item_sizes/1/edit
  def edit
    @item_size = ItemSize.find(params[:id])
  end

  # POST /item_sizes
  # POST /item_sizes.xml
  def create
    @item_size = ItemSize.new(params[:item_size])

    respond_to do |format|
      if @item_size.save
        flash[:notice] = 'ItemSize was successfully created.'
        format.html { redirect_to(@item_size) }
        format.xml  { render :xml => @item_size, :status => :created, :location => @item_size }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @item_size.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /item_sizes/1
  # PUT /item_sizes/1.xml
  def update
    @item_size = ItemSize.find(params[:id])

    respond_to do |format|
      if @item_size.update_attributes(params[:item_size])
        flash[:notice] = 'ItemSize was successfully updated.'
        format.html { redirect_to(@item_size) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @item_size.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /item_sizes/1
  # DELETE /item_sizes/1.xml
  def destroy
    @item_size = ItemSize.find(params[:id])
    @item_size.destroy

    respond_to do |format|
      format.html { redirect_to(item_sizes_url) }
      format.xml  { head :ok }
    end
  end
end

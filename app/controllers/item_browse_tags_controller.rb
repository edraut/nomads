class ItemBrowseTagsController < ApplicationController
  # GET /item_browse_tags
  # GET /item_browse_tags.xml
  def index
    @item_browse_tags = ItemBrowseTag.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @item_browse_tags }
    end
  end

  # GET /item_browse_tags/1
  # GET /item_browse_tags/1.xml
  def show
    @item_browse_tag = ItemBrowseTag.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @item_browse_tag }
    end
  end

  # GET /item_browse_tags/new
  # GET /item_browse_tags/new.xml
  def new
    @item_browse_tag = ItemBrowseTag.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @item_browse_tag }
    end
  end

  # GET /item_browse_tags/1/edit
  def edit
    @item_browse_tag = ItemBrowseTag.find(params[:id])
  end

  # POST /item_browse_tags
  # POST /item_browse_tags.xml
  def create
    @item_browse_tag = ItemBrowseTag.new(params[:item_browse_tag])

    respond_to do |format|
      if @item_browse_tag.save
        flash[:notice] = 'ItemBrowseTag was successfully created.'
        format.html { redirect_to(@item_browse_tag) }
        format.xml  { render :xml => @item_browse_tag, :status => :created, :location => @item_browse_tag }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @item_browse_tag.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /item_browse_tags/1
  # PUT /item_browse_tags/1.xml
  def update
    @item_browse_tag = ItemBrowseTag.find(params[:id])

    respond_to do |format|
      if @item_browse_tag.update_attributes(params[:item_browse_tag])
        flash[:notice] = 'ItemBrowseTag was successfully updated.'
        format.html { redirect_to(@item_browse_tag) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @item_browse_tag.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /item_browse_tags/1
  # DELETE /item_browse_tags/1.xml
  def destroy
    @item_browse_tag = ItemBrowseTag.find(params[:id])
    @item_browse_tag.destroy

    respond_to do |format|
      format.html { redirect_to(item_browse_tags_url) }
      format.xml  { head :ok }
    end
  end
end

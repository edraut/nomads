class BrowseTagsController < ApplicationController
  # GET /browse_tags
  # GET /browse_tags.xml
  def index
    @browse_tags = BrowseTag.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @browse_tags }
    end
  end

  # GET /browse_tags/1
  # GET /browse_tags/1.xml
  def show
    @browse_tag = BrowseTag.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @browse_tag }
    end
  end

  # GET /browse_tags/new
  # GET /browse_tags/new.xml
  def new
    @browse_tag = BrowseTag.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @browse_tag }
    end
  end

  # GET /browse_tags/1/edit
  def edit
    @browse_tag = BrowseTag.find(params[:id])
  end

  # POST /browse_tags
  # POST /browse_tags.xml
  def create
    @browse_tag = BrowseTag.new(params[:browse_tag])

    respond_to do |format|
      if @browse_tag.save
        flash[:notice] = 'BrowseTag was successfully created.'
        format.html { redirect_to(@browse_tag) }
        format.xml  { render :xml => @browse_tag, :status => :created, :location => @browse_tag }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @browse_tag.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /browse_tags/1
  # PUT /browse_tags/1.xml
  def update
    @browse_tag = BrowseTag.find(params[:id])

    respond_to do |format|
      if @browse_tag.update_attributes(params[:browse_tag])
        flash[:notice] = 'BrowseTag was successfully updated.'
        format.html { redirect_to(@browse_tag) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @browse_tag.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /browse_tags/1
  # DELETE /browse_tags/1.xml
  def destroy
    @browse_tag = BrowseTag.find(params[:id])
    @browse_tag.destroy

    respond_to do |format|
      format.html { redirect_to(browse_tags_url) }
      format.xml  { head :ok }
    end
  end
end

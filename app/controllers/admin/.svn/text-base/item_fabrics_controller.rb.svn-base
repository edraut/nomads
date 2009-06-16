class Admin::ItemFabricsController < Admin::AdministrationController
  # GET /item_fabrics
  # GET /item_fabrics.xml
  def index
    @item_fabrics = ItemFabric.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @item_fabrics }
    end
  end

  # GET /item_fabrics/1
  # GET /item_fabrics/1.xml
  def show
    @item_fabric = ItemFabric.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @item_fabric }
    end
  end

  # GET /item_fabrics/new
  # GET /item_fabrics/new.xml
  def new
    @item_fabric = ItemFabric.new

    respond_to do |format|
      format.html { render :partial => 'new'}
      format.xml  { render :xml => @item_fabric }
    end
  end

  # GET /item_fabrics/1/edit
  def edit
    @item_fabric = ItemFabric.find(params[:id])
  end

  # POST /item_fabrics
  # POST /item_fabrics.xml
  def create
    @item_fabric = ItemFabric.new(params[:item_fabric])

    respond_to do |format|
      if @item_fabric.save
        flash[:notice] = 'ItemFabric was successfully created.'
        format.html { redirect_to(@item_fabric) }
        format.xml  { render :xml => @item_fabric, :status => :created, :location => @item_fabric }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @item_fabric.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /item_fabrics/1
  # PUT /item_fabrics/1.xml
  def update
    @item_fabric = ItemFabric.find(params[:id])

    respond_to do |format|
      if @item_fabric.update_attributes(params[:item_fabric])
        flash[:notice] = 'ItemFabric was successfully updated.'
        format.html { redirect_to(@item_fabric) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @item_fabric.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /item_fabrics/1
  # DELETE /item_fabrics/1.xml
  def destroy
    @item_fabric = ItemFabric.find(params[:id])
    @item_fabric.destroy

    respond_to do |format|
      format.html { redirect_to(item_fabrics_url) }
      format.xml  { head :ok }
    end
  end
end

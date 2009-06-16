class Admin::SizesController < Admin::AdministrationController
  # GET /sizes
  # GET /sizes.xml
  def index
    if params[:size_group_id]
      size_group = SizeGroup.find(params[:size_group_id])
      @sizes = size_group.sizes.find(:all, :order => :position)
    else
      @sizes = Size.find(:all, :order => :position)
    end

    respond_to do |format|
      format.html { render :partial => 'select', :collection => @sizes, :locals => {:selected => true}}
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

  # GET /sizes/new
  # GET /sizes/new.xml
  def new
    @size = Size.new

    respond_to do |format|
      format.html { render :partial => 'new_li', :object => @size, :locals => {:selected => true} }
      format.xml  { render :xml => @size }
    end
  end

  # GET /sizes/1/edit
  def edit
    @size = Size.find(params[:id])
  end

  # POST /sizes
  # POST /sizes.xml
  def create
    @size = Size.new(params[:size])

    respond_to do |format|
      if @size.save
        flash[:notice] = 'Size was successfully created.'
        format.html { redirect_to(@size) }
        format.xml  { render :xml => @size, :status => :created, :location => @size }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @size.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sizes/1
  # PUT /sizes/1.xml
  def update
    if params[:id] == 'multiple'
      params[:size_list].each_with_index do |size_id,position|
        size = Size.find(size_id)
        size.position = position
        size.save
      end
      render :nothing => true and return
    else
    @size = Size.find(params[:id])

    respond_to do |format|
      if @size.update_attributes(params[:size])
        flash[:notice] = 'Size was successfully updated.'
        format.html { redirect_to(@size) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @size.errors, :status => :unprocessable_entity }
      end
    end
  end
  end

  # DELETE /sizes/1
  # DELETE /sizes/1.xml
  def destroy
    @size = Size.find(params[:id])
    @size.destroy

    respond_to do |format|
      format.html { redirect_to(sizes_url) }
      format.xml  { head :ok }
    end
  end
end

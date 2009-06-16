class Admin::SizeGroupsController < Admin::AdministrationController
  # GET /size_groups
  # GET /size_groups.xml
  def index
    @size_groups = SizeGroup.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @size_groups }
    end
  end

  # GET /size_groups/1
  # GET /size_groups/1.xml
  def show
    @size_group = SizeGroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @size_group }
    end
  end

  # GET /size_groups/new
  # GET /size_groups/new.xml
  def new
    @size_group = SizeGroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @size_group }
    end
  end

  # GET /size_groups/1/edit
  def edit
    @size_group = SizeGroup.find(params[:id])
  end

  # POST /size_groups
  # POST /size_groups.xml
  def create
    @size_group = SizeGroup.new(params[:size_group])
    result = @size_group.save
    if result
      for size in params[:size]
        new_size = Size.new(size)
        new_size.save
        @size_group.sizes << new_size
      end
    end
    respond_to do |format|
      if result
        flash[:notice] = 'SizeGroup was successfully created.'
        format.html { redirect_to([:admin, @size_group]) }
        format.xml  { render :xml => @size_group, :status => :created, :location => @size_group }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @size_group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /size_groups/1
  # PUT /size_groups/1.xml
  def update
    @size_group = SizeGroup.find(params[:id])
    result = @size_group.update_attributes(params[:size_group])
    if result
      for size in params[:size]
        new_size = Size.new(size)
        new_size.save
        @size_group.sizes << new_size
      end
      for id,size in params[:existing_size]
        if size.has_key? :delete
          Size.delete(id)
        else
          this_size = Size.find(id)
          this_size.update_attributes(size)
        end
      end if params[:existing_size]
    end
    
    respond_to do |format|
      if result
        flash[:notice] = 'SizeGroup was successfully updated.'
        format.html { redirect_to([:admin, @size_group]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @size_group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /size_groups/1
  # DELETE /size_groups/1.xml
  def destroy
    @size_group = SizeGroup.find(params[:id])
    @size_group.destroy

    respond_to do |format|
      format.html { redirect_to(admin_size_groups_url) }
      format.xml  { head :ok }
    end
  end
end

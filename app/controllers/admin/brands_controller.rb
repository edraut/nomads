class Admin::BrandsController < Admin::AdministrationController
  # GET /brands
  # GET /brands.xml
  def index
    @brands = Brand.find(:all, :order => 'position asc')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @brands }
    end
  end

  # GET /brands/1
  # GET /brands/1.xml
  def show
    @brand = Brand.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @brand }
    end
  end

  # GET /brands/new
  # GET /brands/new.xml
  def new
    @brand = Brand.new

    respond_to do |format|
      if params[:partial]
        format.html { render :partial => 'new_li', :object => @brand}
      else
        format.html
      end
      format.xml  { render :xml => @brand }
    end
  end

  # GET /brands/1/edit
  def edit
    @brand = Brand.find(params[:id])
  end

  # POST /brands
  # POST /brands.xml
  def create
    if params[:brand].class.name == 'Array'
      success = true
      for brand in params[:brand]
        new_brand = Brand.new(brand)
        new_brand.save or success = false
      end
    else
      @brand = Brand.new(params[:brand])
      success = @brand.save
    end

    respond_to do |format|
      if success
        flash[:notice] = 'Brand was successfully created.'
        format.html { redirect_to(admin_brands_path) }
        format.xml  { render :xml => @brand, :status => :created, :location => @brand }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @brand.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /brands/1
  # PUT /brands/1.xml
  def update
    if params[:id] == 'multiple'
      params[:brand_list].each_with_index do |brand_id,position|
        brand = Brand.find(brand_id)
        brand.position = position
        brand.save
      end
      render :nothing => true and return
    else
      @brand = Brand.find(params[:id])

      respond_to do |format|
        if @brand.update_attributes(params[:brand])
          flash[:notice] = 'Brand was successfully updated.'
          format.html { redirect_to([:admin, @brand]) }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @brand.errors, :status => :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /brands/1
  # DELETE /brands/1.xml
  def destroy
    @brand = Brand.find(params[:id])
    @brand.destroy

    respond_to do |format|
      format.html { redirect_to(admin_brands_url) }
      format.xml  { head :ok }
    end
  end
end

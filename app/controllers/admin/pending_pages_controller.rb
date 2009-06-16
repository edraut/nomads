class Admin::PendingPagesController < Admin::AdministrationController
  # GET /pages
  # GET /pages.xml
  def index
    @pages = PendingPage.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pages }
    end
  end

  # GET /pages/1
  # GET /pages/1.xml
  def show
    @page = PendingPage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @page }
    end
  end

  # GET /pages/new
  # GET /pages/new.xml
  def new
    @page = PendingPage.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @page }
    end
  end

  # GET /pages/1/edit
  def edit
    @page = PendingPage.find(params[:id])
  end

  # POST /pages
  # POST /pages.xml
  def create
    @page = PendingPage.new(params[:pending_page])

    respond_to do |format|
      if @page.save
        flash[:notice] = 'Page was successfully created.'
        format.html { redirect_to([:admin, @page]) }
        format.xml  { render :xml => @page, :status => :created, :location => @page }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @page.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pages/1
  # PUT /pages/1.xml
  def update
    @page = PendingPage.find(params[:id])
    if params[:publish]
      @published_page = @page.published_version
      @published_page ||= PublishedPage.new(@page.attributes)
      unless @page.page_content_image.nil?
        @published_page.page_content_image = @page.page_content_image.clone_attachment 
        @published_page.save
      end
      if @published_page.new_record?
        published_result = @published_page.save
      else
        published_result = @published_page.update_attributes(@page.attributes)
      end
      pending_result = @page.update_attributes(:dirty => false)
      result = pending_result and published_result
      completed_action = 'published to the live site'
    elsif params[:revert]
      @published_page = @page.published_version
      result = @page.update_attributes(@published_page.attributes.merge(:dirty => false))
      if @published_page.page_content_image.nil?
        @page.page_content_image = nil
        @page.save
      else
        @page.page_content_image = @published_page.page_content_image.clone_attachment 
        @page.save
      end
      completed_action = 'reverted to the live version'
    else
      for id, image_action in params[:page_content_image_action]
        if PageContentImage.exists?(id)
          pci = PageContentImage.find(id)
          case image_action
          when 'delete','update'
            pci.destroy
          end
        end
      end if params[:page_content_image_action]
      for id, image_params in params[:page_content_images]
        if image_params[:uploaded_data] and image_params[:uploaded_data].length > 0
          new_image = PageContentImage.new(image_params)
          @page.page_content_image = new_image
        end
      end if params[:page_content_images]
      @page.save
      result = @page.update_attributes(params[:pending_page].merge(:dirty => true))
      completed_action = 'updated but not yet published'
    end
    respond_to do |format|
      if result
        flash[:notice] = "Page was successfully #{completed_action}."
        format.html { redirect_to(admin_pending_page_path(@page.id, :page_name => @page.name)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @page.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.xml
  def destroy
    @page = PendingPage.find(params[:id])
    @published_page = @page.published_version
    @page.destroy
    @published_page.destroy if @published_page
    respond_to do |format|
      format.html { redirect_to(admin_pending_pages_url) }
      format.xml  { head :ok }
    end
  end
end

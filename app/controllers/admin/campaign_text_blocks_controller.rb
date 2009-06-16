class Admin::CampaignTextBlocksController < Admin::AdministrationController
  # GET /campaign_text_blocks
  # GET /campaign_text_blocks.xml
  def index
    @campaign_text_blocks = CampaignTextBlock.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @campaign_text_blocks }
    end
  end

  # GET /campaign_text_blocks/1
  # GET /campaign_text_blocks/1.xml
  def show
    @campaign_text_block = CampaignTextBlock.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @campaign_text_block }
    end
  end

  # GET /campaign_text_blocks/new
  # GET /campaign_text_blocks/new.xml
  def new
    @campaign_text_block = CampaignTextBlock.new

    respond_to do |format|
      if params[:campaign_template_id]
        format.html { render :partial => 'new_from_template', :collection => CampaignTemplate.find(params[:campaign_template_id]).campaign_text_blocks}
      else
        format.html # new.html.erb
      end
      format.xml  { render :xml => @campaign_text_block }
    end
  end

  # GET /campaign_text_blocks/1/edit
  def edit
    @campaign_text_block = CampaignTextBlock.find(params[:id])
  end

  # POST /campaign_text_blocks
  # POST /campaign_text_blocks.xml
  def create
    @campaign_text_block = CampaignTextBlock.new(params[:campaign_text_block])

    respond_to do |format|
      if @campaign_text_block.save
        flash[:notice] = 'CampaignTextBlock was successfully created.'
        format.html { redirect_to([:admin,@campaign_text_block]) }
        format.xml  { render :xml => @campaign_text_block, :status => :created, :location => @campaign_text_block }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @campaign_text_block.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /campaign_text_blocks/1
  # PUT /campaign_text_blocks/1.xml
  def update
    @campaign_text_block = CampaignTextBlock.find(params[:id])

    respond_to do |format|
      if @campaign_text_block.update_attributes(params[:campaign_text_block])
        flash[:notice] = 'CampaignTextBlock was successfully updated.'
        format.html { redirect_to([:admin,@campaign_text_block]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @campaign_text_block.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /campaign_text_blocks/1
  # DELETE /campaign_text_blocks/1.xml
  def destroy
    @campaign_text_block = CampaignTextBlock.find(params[:id])
    @campaign_text_block.destroy

    respond_to do |format|
      format.html { redirect_to(admin_campaign_text_blocks_url) }
      format.xml  { head :ok }
    end
  end
end

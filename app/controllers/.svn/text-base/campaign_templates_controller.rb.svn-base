class CampaignTemplatesController < ApplicationController
  # GET /campaign_templates
  # GET /campaign_templates.xml
  def index
    @campaign_templates = CampaignTemplate.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @campaign_templates }
    end
  end

  # GET /campaign_templates/1
  # GET /campaign_templates/1.xml
  def show
    @campaign_template = CampaignTemplate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @campaign_template }
    end
  end

  # GET /campaign_templates/new
  # GET /campaign_templates/new.xml
  def new
    @campaign_template = CampaignTemplate.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @campaign_template }
    end
  end

  # GET /campaign_templates/1/edit
  def edit
    @campaign_template = CampaignTemplate.find(params[:id])
  end

  # POST /campaign_templates
  # POST /campaign_templates.xml
  def create
    @campaign_template = CampaignTemplate.new(params[:campaign_template])

    respond_to do |format|
      if @campaign_template.save
        flash[:notice] = 'CampaignTemplate was successfully created.'
        format.html { redirect_to(@campaign_template) }
        format.xml  { render :xml => @campaign_template, :status => :created, :location => @campaign_template }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @campaign_template.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /campaign_templates/1
  # PUT /campaign_templates/1.xml
  def update
    @campaign_template = CampaignTemplate.find(params[:id])

    respond_to do |format|
      if @campaign_template.update_attributes(params[:campaign_template])
        flash[:notice] = 'CampaignTemplate was successfully updated.'
        format.html { redirect_to(@campaign_template) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @campaign_template.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /campaign_templates/1
  # DELETE /campaign_templates/1.xml
  def destroy
    @campaign_template = CampaignTemplate.find(params[:id])
    @campaign_template.destroy

    respond_to do |format|
      format.html { redirect_to(campaign_templates_url) }
      format.xml  { head :ok }
    end
  end
end

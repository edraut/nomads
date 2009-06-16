class SizeGroupsController < ApplicationController
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

end

class AttachmentsController < ApplicationController
  # GET /attachments
  # GET /attachments.xml
  def index
    attachable_type = params[:attachable_type].constantize
    attachable = attachable_type.find(params[:attachable_id])
    attachment_type = params[:attachment_type].underscore.pluralize.to_sym
    @attachments = attachable.send(attachment_type)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @attachments }
    end
  end

  # GET /attachments/1
  # GET /attachments/1.xml
  def show
    @attachment = Attachment.find(params[:id])

    respond_to do |format|
      format.html { render :partial => 'show_full', :object => @attachment}
      format.xml  { render :xml => @attachment }
    end
  end
  
end

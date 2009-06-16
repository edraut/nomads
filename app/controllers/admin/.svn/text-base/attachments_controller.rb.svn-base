class Admin::AttachmentsController < Admin::AdministrationController
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
      format.html # show.html.erb
      format.xml  { render :xml => @attachment }
    end
  end

  # GET /attachments/new
  # GET /attachments/new.xml
  def new
    attachment_name = params[:attachment_type].underscore
    attachable_class = params[:attachable_type].constantize
    if params[:attachable_parent_type]# this condition is no longer used, but is here for future reference.
      attachable_parent_name = params[:attachable_parent_type].underscore
      attachable_parent_key = (attachable_parent_name + '_id').to_sym
      attachable_parent_ids = params[:attachable_parent_id].split(',')
      attachables = []
      for attachable_parent_id in attachable_parent_ids
        attachables << attachable_class.new(attachable_parent_key => attachable_parent_id)
      end
      locals = {:attachable_parent_name => attachable_parent_name, :attachment_type => attachment_name}
    else
      attachable = attachable_class.new
      attachable.id = params[:attachable_id].to_i
      locals = {:attachable_parent_name => nil, :attachment_type => attachment_name}
    end
    respond_to do |format|
      format.html { render :partial => 'new_li', :object => attachable, :locals => locals}
      format.xml  { render :xml => @attachment }
    end
  end

  # GET /attachments/new
  # GET /attachments/new.xml
  def edit
    attachment_name = params[:attachment_type].underscore
    attachable_class = params[:attachable_type].constantize
    if params[:item_id]
      item = Item.find(params[:item_id])
      attachable_assoc = attachable_class.name.underscore.pluralize.to_sym
      current_attachables = item.send(attachable_assoc)
    end
    if params[:attachable_parent_type]
      attachable_parent_name = params[:attachable_parent_type].underscore
      attachable_parent_key = (attachable_parent_name + '_id').to_sym
      attachable_parent_ids = params[:attachable_parent_id].split(',')
      attachables = []
      for attachable_parent_id in attachable_parent_ids
        current_attachable = current_attachables.select{|att| att.send(attachable_parent_key) == attachable_parent_id.to_i}.first
        if current_attachable
          attachables << current_attachable
        else
          attachables << attachable_class.new(attachable_parent_key => attachable_parent_id)
        end
      end
      locals = {:attachable_parent_name => attachable_parent_name, :attachment_type => attachment_name}
    else
      attachables = attachable_class.find(params[:attachable_id].split(','))
      locals = {}
    end
    respond_to do |format|
      format.html { render :partial => 'edit_li', :collection => attachables, :locals => locals}
      format.xml  { render :xml => @attachment }
    end
  end
  
end

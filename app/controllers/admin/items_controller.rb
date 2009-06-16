class Admin::ItemsController < Admin::AdministrationController
  before_filter :convert_string_to_money, :only => [:create, :update]

  # GET /items
  # GET /items.xml
  def index
    item_query = Item.query
    if params[:search_terms] && params[:search_terms].length > 0
      search_conditions, *search_params = Item.conditions_from_search_terms(params[:search_terms])
      @items = Item.paginate(:per_page => 9, :page => params[:page], :conditions => [search_conditions,*search_params], :order => params[:order_by])
    else
      @items = item_query.paginate(:per_page => 9, :page => params[:page], :order => params[:order_by])
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @items }
    end
  end

  # GET /items/1
  # GET /items/1.xml
  def show
    @item = Item.find(params[:id], :include => :brand)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @item }
    end
  end

  # GET /items/new
  # GET /items/new.xml
  def new
    @item = Item.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @item }
    end
  end

  # GET /items/1/edit
  def edit
    @item = Item.find(params[:id], :include => :brand)
    @size_group = !@item.sizes.empty? ? @item.sizes.first.size_group : SizeGroup.find(:first)
  end

  # POST /items
  # POST /items.xml
  def create

    @item = Item.new(params[:item])
    for size_id in params[:size]
      size = Size.find(size_id)
      @item.sizes << size
    end if params[:item]
    for fake_id, color_name in params[:item_colors]
      item_color = ItemColor.new(:name => color_name)
      if params[:item_color_photos] and params[:item_color_photos].has_key? fake_id and params[:item_color_photos][fake_id][:uploaded_data] and (params[:item_color_photos][fake_id][:uploaded_data].length > 0)
        item_color_photo = ItemColorPhoto.new(params[:item_color_photos][fake_id])
        item_color_photo.save
        item_color.item_color_photos << item_color_photo
      end
      item_color.save
      @item.item_colors << item_color
    end if params[:item_colors]
    for fabric_name in params[:item_fabrics]
      item_fabric = ItemFabric.new(:name => fabric_name)
      @item.item_fabrics << item_fabric
    end if params[:item_fabrics]
    for browse_tag_id in params[:browse_tags]
      browse_tag = BrowseTag.find(browse_tag_id)
      @item.browse_tags << browse_tag
    end if params[:browse_tags]
    respond_to do |format|
      if @item.save
        flash[:notice] = 'Item was successfully created.'
        format.html { redirect_to([:admin, @item]) }
        format.xml  { render :xml => @item, :status => :created, :location => @item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /items/1
  # PUT /items/1.xml
  def update
    @item = Item.find(params[:id])
    @item.sizes.clear
    @item.browse_tags.clear
    for id, delete in params[:item_fabric_actions]
      @item.item_fabrics.destroy(id) if delete
    end if params[:item_fabric_actions]
    for id, delete in params[:item_color_actions]
      @item.item_colors.destroy(id) if delete
    end if params[:item_color_actions]
    for size_id in params[:size]
      size = Size.find(size_id)
      @item.sizes << size
    end if params[:size]
    item_color_params = params[:item_colors].clone if params[:item_colors]
    item_color_params ||= {}
    @item.item_colors.each{|item_color| item_color_params[item_color.id.to_s] = item_color.name}
    for id, color_name in item_color_params
      if ItemColor.exists?(id)
        item_color = ItemColor.find(id)
        item_color_photo = item_color.item_color_photos.first
        if(item_color_photo and (params[:item_color_photo_action].has_key? id.to_s))
          case params[:item_color_photo_action][id.to_s]
          when 'delete','update'
            item_color_photo.destroy
          end
        end
      else
        item_color = ItemColor.new(:name => color_name)
      end
      if ((params[:item_color_photos] and (params[:item_color_photos].has_key? id) and params[:item_color_photos][id][:uploaded_data] and (params[:item_color_photos][id][:uploaded_data].length > 0)) and (!params[:item_color_photo_action] or !(params[:item_color_photo_action].has_key? id) or params[:item_color_photo_action][id] == 'update'))
        item_color_photo = ItemColorPhoto.new(params[:item_color_photos][id])
        item_color_photo.save
        item_color.item_color_photos << item_color_photo
      end
      item_color.save
      @item.item_colors << item_color
    end if item_color_params.length > 0
    for fabric_name in params[:item_fabrics]
      item_fabric = ItemFabric.new(:name => fabric_name)
      @item.item_fabrics << item_fabric
    end if params[:item_fabrics]
    for browse_tag_id in params[:browse_tags]
      browse_tag = BrowseTag.find(browse_tag_id)
      @item.browse_tags << browse_tag
    end if params[:browse_tags]
    @item.save
    respond_to do |format|
      if @item.update_attributes(params[:item]) or !params[:item]
        flash[:notice] = 'Item was successfully updated.'
        format.html { redirect_to([:admin,@item]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.xml
  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to(admin_items_url) }
      format.xml  { head :ok }
    end
  end
  
  private
  
  def convert_string_to_money
    params[:item][:price] = string_to_money(params[:item][:price]) if params[:item][:price]
    params[:item][:sale_price] = string_to_money(params[:item][:sale_price]) if params[:item][:sale_price]
  end
  
end
class ItemsController < ApplicationController
  # GET /items
  # GET /items.xml
  def index
    marshall_browse
    item_query = Item.query
    item_query.eq('active',true)

    if @browse_in_progress
      unless @browse_tag_id == 1
        item_browse_tag = item_query.join('item_browse_tags')
        browse_tag_ids = item_browse_tag.or
        for apropos_tag in @browse_tag.ancestors + @browse_tag.me_and_my_descendants
          browse_tag_ids.eq('browse_tag_id', apropos_tag)
        end
      end

      unless @brand_id == 1
        item_query.eq('brand_id',@brand_id)
      end

      unless @gender == 'Womens and Mens'
        gender_query = item_query.or
        gender_query.eq('gender',@gender)
        gender_query.eq('gender','Womens and Mens')
      end

      unless @price_range == 'All Prices'
        case @price_range
        when 'Sale Items'
          item_query.eq('on_sale', true)
        when '$0 - $50'
          item_query.lt('price', 5000)
        when '$50 & up'
          item_query.gte('price', 5000)
        end
      end
      @items = item_query.paginate(:per_page => 9, :page => params[:page], :order => params[:order_by])
    elsif params[:search_terms] && params[:search_terms].length > 0
      search_conditions, *search_params = Item.conditions_from_search_terms(params[:search_terms])
      search_conditions += ' AND ' + item_query.conditions
      search_params += item_query.parameters
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
    marshall_browse
    @item = Item.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @item }
    end
  end

  def marshall_browse
    if (params[:browse_tag_id] || params[:brand_id] || params[:gender] || params[:price_range])
      @browse_in_progress = true
    else
      @browse_in_progress = false
    end

    @browse_tag_id = params[:browse_tag_id].to_i
    @browse_tag_id = 1 if @browse_tag_id == 0
    @browse_tag = BrowseTag.find(@browse_tag_id)

    @brand_id = params[:brand_id].to_i
    @brand_id = 1 if @brand_id == 0
    @brand = Brand.find(@brand_id)

    @gender = params[:gender]
    @gender ||= 'Womens and Mens'

    @price_range = params[:price_range]
    @price_range ||= 'All Prices'
  end
end

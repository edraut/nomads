# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def print_nav_tree(browse_tag)
    tree = ''
    browse_tag.ancestors.reverse.each do |tag|
      if(tag.id == 1)
        tree += '<ul class="browse_nav_top">' # All Categories is always on top
      else
        tree += '<ul class="browse_nav">' # Other parent categories are indented
      end
      tree += '<li>' + link_to(tag.name, items_path(:browse_tag_id => tag.id, :gender => @gender, :price_range => @price_range, :brand_id => @brand.id)) 
    end
    if(browse_tag.id == 1)
      tree += '<ul class="browse_nav_top">' # if All Categories is the selected tag, still print it on top
    else
      tree += '<ul class="browse_nav">' # if the selected tag was not 'All Categories', print it indented
    end
    if params[:action] == 'show'
      browse_tag_class = ''
      browse_tag_display = link_to(browse_tag.name, items_path(:browse_tag_id => browse_tag.id, :gender => @gender, :price_range => @price_range, :brand_id => @brand.id))
    else
      browse_tag_class = 'class="current_browse_tag"'
      browse_tag_display = browse_tag.name
    end
    tree += '<li ' + browse_tag_class + '>' + browse_tag_display
    if params[:action] == 'show'
      tree += '<ul class="browse_nav"><li class="current_browse_tag">' + @item.name + '</li>'
      tree += '</ul>'
    elsif !browse_tag.children.empty? # print the children of the selected tag if we aren't on the item detail page
      tree += '<ul class="browse_nav">' 
      browse_tag.children.each do |tag|
        tree += '<li>' + link_to(tag.name, items_path(:browse_tag_id => tag.id, :gender => @gender, :price_range => @price_range, :brand_id => @brand.id)) + '</li>'
      end
      tree += '</ul>' # end the list for the children
    end
    tree += '</li></ul>' # end the list for the selected browse tag
    browse_tag.ancestors.length.times do
      tree += '</li></ul>' # end the list for each ancestor
    end
    tree
  end
  def print_gender_tree(current_gender)
    tree = '<ul class="browse_nav_top">'
    GENDERS.each do |gender_array|
      gender = gender_array.first
      if gender == current_gender
        tree += '<li class="current_browse_tag">' + gender + '</li>'
      else
        tree += '<li>' + link_to(gender,items_path(:gender => gender,:browse_tag_id => @browse_tag.id, :price_range => @price_range, :brand_id => @brand.id)) + '</li>'
      end
    end
    tree += '</ul>'
    tree
  end
  def print_price_tree(current_price_range)
    tree = '<ul class="browse_nav_top">'
    PRICE_RANGES.each do |price_range|
      if price_range == current_price_range
        tree += '<li class="current_browse_tag">' + price_range + '</li>'
      else
        tree += '<li>' + link_to(price_range,items_path(:price_range => price_range, :gender => @gender, :browse_tag_id => @browse_tag.id, :brand_id => @brand.id)) + '</li>'
      end
    end
    tree += '</ul>'
    tree
  end
  def print_brand_list(current_brand)
    list = '<ul class="brand_nav_top">'
    Brand.find(:all, :order => :position).each do |brand|
      if @browse_in_progress
        if brand.id == current_brand.id
          list += '<li class="current_brand_tag">' + brand.name + '</li>'
        else
          list += '<li>' + link_to(brand.name,items_path(:price_range => @price_range, :gender => @gender, :browse_tag_id => @browse_tag.id, :brand_id => brand.id)) + '</li>'
        end
      else
        list += '<li>' + brand.name + '</li>' unless brand.id == 1
      end
    end
    list += '</ul>'
    list
  end
end

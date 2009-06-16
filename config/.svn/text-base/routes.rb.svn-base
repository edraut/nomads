ActionController::Routing::Routes.draw do |map|

  map.root :controller => 'pages', :action => 'show', :page_name => 'Home'

  map.resources :attachments
  map.resources :campaign_text_blocks
  map.resources :campaigns
  map.resources :campaign_templates
  map.resources :browse_tags
  map.resources :item_browse_tags
  map.resources :item_fabrics
  map.resources :fabrics
  map.resources :items
  map.resources :sizes
  map.resources :size_groups
  map.resources :pages
  map.resources :item_genders
  map.resources :users
  map.resources :item_colors
  map.resources :colors
  map.resources :item_sizes
  map.resources :brands

  map.home 'home', :controller => 'pages', :action => 'show', :page_name => 'Home'
  map.about 'about', :controller  => 'pages', :action => 'show', :page_name => 'About'
  map.contact 'contact', :controller => 'pages', :action => 'show', :page_name => 'Contact'
  map.forgot_password 'forgot_password', :controller => 'auth', :action => 'forgot_password'
  map.auth 'auth', :controller => 'auth', :action => 'index'
  map.login 'login', :controller => 'auth', :action => 'login'
  map.logout 'logout', :controller => 'auth', :action => 'logout'
  
  map.namespace :admin do |admin|
    admin.root :controller => 'items'
    admin.catalog 'catalog', :controller => 'items', :action => 'index'
    admin.resources :items do |item|
      item.resources :item_colors
      item.resources :item_fabrics
      item.resources :item_sizes
    end
    admin.resources :sizes
    admin.resources :colors
    admin.resources :fabrics
    admin.resources :size_groups
    admin.resources :item_fabrics
    admin.resources :item_colors
    admin.resources :item_sizes
    admin.resources :users
    admin.resources :brands do |brand|
      brand.resources :items
    end
    admin.resources :pending_pages
    admin.resources :attachments
    admin.resources :browse_tags
    admin.resources :campaign_text_blocks
    admin.resources :campaigns
    admin.resources :campaign_templates
  end
  
  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end

namespace :utils do
  task (:add_admin_users => :environment) do
    eric = Editor.new(:name => 'Eric', :user_name => 'edraut', :email => 'edraut@gmail.com', :password => 'edraut')
    eric.save
    kelly = Editor.new(:name => 'Kelly', :user_name => 'kelly', :email => '', :password => 'kelly')
    kelly.save
  end
  task (:add_pages => :environment) do
    home = PendingPage.new(:name => 'Home', :body => "A locally owned and operated shop on the waterfront in Portland, Maine's Old Port district. Proprietors Kelly Fernald and (?) welcome you to their new site. We hope you enjoy perusing our offerings here, and better yet, take the time when in Maine to wander in and find the active wear and travel gear you need for any adventure.")
    home_live = PublishedPage.new(:name => home.name, :body => home.body)
    home_live.save
    home.dirty = false
    home.save
    about = PendingPage.new(:name => 'About', :body => home.body)
    about_live = PublishedPage.new(:name => about.name, :body => about.body)
    about_live.save
    about.dirty = false
    about.save
    contact = PendingPage.new(:name => 'Contact', :body => "Contact Info Here")
    contact_live = PublishedPage.new(:name => contact.name, :body => contact.body)
    contact_live.save
    contact.dirty = false
    contact.save
  end
  task (:generate_google_sitemap => :environment) do
    include ActionController::UrlWriter  
    default_url_options[:host] = 'imanomad.com'  

    filename = "#{RAILS_ROOT}/public/sitemap.xml"  
    File.open(filename, "w") do |file|  
      xml = Builder::XmlMarkup.new(:target => file, :indent => 2)  
      xml.instruct!  
      xml.urlset "xmlns" => "http://www.sitemaps.org/schemas/sitemap/0.9" do  
        xml.url do
          xml.loc home_url
          xml.lastmod PublishedPage.find(:first, :conditions => {:name => 'Home'}).updated_at.xmlschema
          xml.changefreq "weekly"
          xml.priority 0.8
        end
        for item in Item.all
          xml.url do
            xml.loc item_url(CGI::escape(item.id.to_s + '-' + item.name))
            xml.lastmod item.updated_at.xmlschema
            xml.changefreq "weekly"
            xml.priority 1.0
          end
        end
        xml.url do
          xml.loc about_url
          xml.lastmod PublishedPage.find(:first, :conditions => {:name => 'About'} ).updated_at.xmlschema
          xml.changefreq "weekly"
          xml.priority 0.9
        end
      end  
    end    
  end
    
end
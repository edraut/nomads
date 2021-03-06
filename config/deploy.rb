before "deploy:cold", "config_files:create"
after "deploy:update_code", "config_files:symlink"
after "deploy:update", "deploy:cleanup"

set :stages, %w(staging production)
set :default_stage, "staging"

require 'capistrano/ext/multistage'
require 'erb'

set :application, "nomads"
set :user, "nobody"
set :runner, "nobody"
ssh_options[:paranoid] = false

set :repository,  "git@github.com:edraut/nomads.git"
set :scm, :git
set :git_shallow_clone, 1
set :ssh_options, { :forward_agent => true }

set :keep_releases, 2

set (:deploy_to) { "/var/www/nomads/#{stage}" }

desc "Modified deploy task for Phusion Passenger"
namespace :deploy do
  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end
  task :start, :roles => :app do
    # start task unnecessary for Passenger deployment
  end
end


# Tasks for config files
namespace :config_files do
  desc "Create directories and config files: database.yml, mongrel_cluster.yml"
  task :create do
    make_directories
    database_yml
    mailer_config
    pictures
  end

  desc "Prepate directory structure"
  task :make_directories do
    run "mkdir -p #{shared_path}/config"
    run "mkdir -p #{shared_path}/log" 
    run "mkdir -p #{shared_path}/public" 
    run "mkdir -p #{shared_path}/system" 
    run "mkdir -p #{deploy_to}/releases"     
  end

  desc "Make symlink for config files" 
  task :symlink do
    symlink_database_yml
    symlink_mailer_config
    # symlink_pictures
  end

  desc "Create database.yml in shared path" 
  task :database_yml do
    template = File.read(File.join(File.dirname(__FILE__), "deploy/templates", "database.erb"))
    result = ERB.new(template).result(binding)
    put result, "#{shared_path}/config/database.yml", :via => :scp
  end

  desc "Make symlink for database.yml" 
  task :symlink_database_yml do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml" 
  end

  task :mailer_config do
    template = File.read(File.join(File.dirname(__FILE__), "deploy/templates", "mailer_config.erb"))
    result = ERB.new(template).result(binding)
    put result, "#{shared_path}/config/mailer_config.rb", :via => :scp
  end
  
  desc "Make symlink for database.yml" 
  task :symlink_mailer_config do
    run "ln -nfs #{shared_path}/config/mailer_config.rb #{release_path}/config/mailer_config.rb" 
  end

  desc "Create picture directories in shared path" 
  task :pictures do
    run "mkdir -p #{shared_path}/public/uploaded_images" 
  end

  desc "Make symlinks for pictures" 
  task :symlink_pictures do
    run "rm -rf #{release_path}/public/uploaded_images" 
    run "ln -nfs #{shared_path}/public/uploaded_images #{release_path}/public/uploaded_images" 
  end
end

#role :app, "your app-server here"
#role :web, "your web-server here"
#role :db,  "your db-server here", :primary => true
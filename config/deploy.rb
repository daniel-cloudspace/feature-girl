set :application, "feature-girl"
set :repository,  "git@github.com:daniel-cloudspace/feature-girl.git"
set :scm, :git
set :branch, "capistrano" #currently working off of the capistrano branch because I don't want to mess with master

set :deploy_to, "/vol/www/#{application}"
set :deploy_via, :remote_cache
set :rails_env, "production"
set :ssh_options, { :user => "root", :password => "kijiop" }

role :web, "local.feature-girl.com"                          # Your HTTP server, Apache/etc
role :app, "local.feature-girl.com"                          # This may be the same as your `Web` server
role :db,  "local.feature-girl.com", :primary => true # This is where Rails migrations will run

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

namespace :bundler do
  task :bundle_new_release do
    #bundler.create_symlink
    #bundler.install
    run "cd #{release_path} && bundle isntall"
  end
end

after "deploy", "bundler.bundle_new_release"

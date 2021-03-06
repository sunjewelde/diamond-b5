# config valid only for current version of Capistrano
# lock '3.4.0'

# require "bundler/capistrano"

set :application, 'code4'
# set :application, 'myapp'
set :repo_url, 'https://github.com/sunjewelde/diamond-b5.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
set :branch, "master"

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, '/var/www/myapp'
set :deploy_to, '/var/www/myapp/current'

# Default value for :scm is :git
# set :scm, :git

# set :stages, %w(production)
# set :default_stage, :production

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
set :pty, true
# set :pty, false

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')
# set :linked_files, fetch(:linked_files, []).push('log')
set :keep_releases, 3

# Default value for linked_dirs is []
#set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

set :rvm_ruby_version, '2.3.0'

set :tmp_dir, '/var/www/myapp/code4/tmp'

# set :passenger_environment_variables, { :path => '/path-to-passenger/bin:/home/hiroyuki/.rvm/gems/ruby-2.2.1/wrappers/ruby' }
# set :passenger_restart_command, '/path-to-passenger/bin/passenger-config restart-app'


# set :passenger_restart_with_touch, true

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }
# set :default_env, { path: "/opt/bin:$PATH" }


# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do
  
  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end
  
  # require 'sidekiq/capistrano'
  # set :sidekiq_role, :web

  
  # after "deploy:update", :roles => :app do
  #   run "/bin/cp #{shared_path}/config/database.yml #{release_path}/config"
  #   run "/bin/mkdir -p #{shared_path}/files"
  #   run "/bin/ln -s #{shared_path}/files #{release_path}/public"
  # end

end

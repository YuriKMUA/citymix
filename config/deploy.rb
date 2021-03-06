# config valid only for Capistrano 3.1
lock '3.2.1'
set :username, 'yurikmua'
set :application, 'citymix'
set :deploy_to, '/var/www/yurikmua/data/www/citymix.com.ua'
set :linked_dirs, %w{public/upload}
set :scm, :git
set :repo_url, 'git@github.com:yurikmua/citymix.git'
set :deploy_via, :remote_cache
set :branch, 'master'
set :unicorn_config, "/var/www/yurikmua/data/www/citymix.com.ua/shared/config/unicorn.rb"
set :unicorn_pid, "/var/www/yurikmua/data/www/citymix.com.ua/shared/run/unicorn.pid"
set :rails_env, 'production'
set :rvm_ruby_string, 'rvm'
# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call
# Default deploy_to directory is /var/www/my_app
# Default value for :scm is :git
# Default value for :format is :pretty
# set :format, :pretty
# Default value for :log_level is :debug
set :log_level, :info
# Default value for :pty is false
# set :pty, true
# Default value for :linked_files is []
set :linked_files, %w{config/database.yml}
# Default value for linked_dirs is []
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}
# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }
# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do
    after :finishing, 'application:stop'
    after :finishing, 'application:start'
    after :finishing, :cleanup
end

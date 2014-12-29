# config valid only for Capistrano 3.1
lock '3.2.1'

set :username, 'yurikmua'
set :application, 'citymix.com.ua'
set :deploy_to, '/var/www/yurikmua/data/#{ fetch(:username) }/#{ fetch(:aplication) }'
set :linked_dirs, %w{public/upload}

set :scm, :git
set :repo_url, 'git@github.com:yuriKMUA/citymix.git'
set :deploy_via, :remote_cache
set :branch, 'master'

set :unicorn_config, "#{shared_path}/config/unicorn.rb"
set :unicorn_pid, "#{shared_path}/run/unicorn.pid"
set :rails_env, 'production'

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


namespace :setup do
    desc 'Загрузка конфигурационных файлов на удаленный сервер'
    task :upload_config do
        on roles :all do
            execute :mkdir, "-p #{shared_path}"
            ['shared/config', 'shared_run'].each do |f|
                upload!(f, shared_path, recursive: true)
            end
        end
    end
end   

namespace :nginx do
    desc 'Создание симлинка в /etc/nginx/conf.d на nginx.conf приложения'
    task :append_config do
        on roles :all do
            sudo :ln, "-fs #{shared_path}/config/nginx.conf /etc/nginx/conf.d/#{fetch(:applpcation)}.conf"
        end
    end
    desc 'Релоад nginx'
    task :reload do
        on role :all do
            sudo :service, :nginx, :reload
        end    
    end    
    desc 'Рестарт nginx'
    task :restart do
        on role :all do
            sudo :service, :nginx, :restart
        end    
    end
    after :append_config, :restart
end   

set :unicorn_config, "#{shared_path}/config/unicorn.rb"
set :unicorn_pid, "#{shared_path}/run/unicorn.pid"

namespace :application do
    desc 'Запуск Unicorn'
    task :start do
        on roles(:app) do
            execute "cd #{release_path} && ~/.rvm/bin/rvm default do bundle exec unicorn_rails -c #{fetch(:unicorn_config)} -E #{fetch(:rails_env)} -D"
        end
    end
    desc 'Завершение Unicorn'
    task :stop do
        on roles(:app) do
            execute "if [ -f #{fetch(:unicorn_pid)} ] && [ -e /proc/$(cat # {fetch(:unicorn_pid)}) ]; then kill -9 'cat #{fetch(:unicorn_pid)}'; fi"
        end
    end
end   

namespace :deploy do
    after :finishing, 'application:stop'    
    after :finishing, 'application:start'    
    after :finishing, :cleanup    

end



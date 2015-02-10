#set :unicorn_config, "#{shared_path}/config/unicorn.rb"
#set :unicorn_pid, "#{shared_path}/run/unicorn.pid"

namespace :application do
    desc 'Запуск Unicorn'
    task :start do
        on roles(:app) do
            execute "cd #{release_path} && ~/.rvm/bin/rvm default do bundle exec unicorn_rails -c #{fetch(:unicorn_config)} -l citymix.com.ua:8080 -E #{fetch(:rails_env)} -D"
        end
    end
    desc 'Завершение Unicorn'
    task :stop do
        on roles(:app) do
            execute "if [ -f #{fetch(:unicorn_pid)} ] && [ -e /proc/$(cat #{fetch(:unicorn_pid)}) ]; then kill -9 `cat #{fetch(:unicorn_pid)}`; fi"
        end
    end
end

# Рабочие директории приложения на сервере
root       = '/var/www/yurikmua/data/www/citymix.com.ua'
rails_root = "/var/www/yurikmua/data/www/citymix.com.ua/current"

# Файлы, хранящие идентификаторы запущенных Unicorn-процессов
pidfile     = "/var/www/yurikmua/data/www/citymix.com.ua/shared/run/unicorn.pid"
pidfile_old = pidfile + '.oldbin'
pid pidfile 

#Главные параметры
worker_processes 1
preload_app true
timeout 30

# Путь к сокету
listen "/var/www/yurikmua/data/www/citymix.com.ua/shared/run/unicorn.sock", :backlog => 1024

#Путь к лог-файлам
stderr_path "/var/www/yurikmua/data/www/citymix.com.ua/current/log/unicorn_error.log"
stdout_path "/var/www/yurikmua/data/www/citymix.com.ua/current/log/unicorn.log"

#Установки сборщика мусора
GC.copy_on_write_friendly = true if GC.respond_to?(:copy_on_write_friendly=)

#Блок инструкций, выполняемых до запуска сервера
before_exec do |server|
    ENV["BUNDLE_GEMFILE"] = "/var/www/yurikmua/data/www/citymix.com.ua/current/Gemfile"
end

#Инструкции для управления воркерами и состоянием соединения с БД
    before_fork do |server, worker|
    defined?(ActiveRecord::Base) and
        ActiveRecord::Base.connection.disconnect!
      if File.exists?(pidfile_old) && server.pid != pidfile_old
        begin
            Process.kill("QUIT", File.read(pidfile_old).to_i)
        rescue Errno::ENOENT, Errno::ESRCH
        end
      end
    end

    after_fork do |server, worker|
    defined?(ActiveRecord::Base) and
        ActiveRecord::Base.establish_connection
end
